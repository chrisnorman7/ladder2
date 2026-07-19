import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/screens/new_players_screen.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/widgets/ladder_events_page.dart';
import 'package:ladder2/widgets/players_page.dart';
import 'package:ladder2/widgets/points_reset_page.dart';

/// The main screen of the application.
class MainScreen extends ConsumerWidget {
  /// Create an instance.
  const MainScreen({required this.division, super.key});

  /// The division to work with.
  final PlayerDivision division;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Players',
          icon: const Text('All the players in the club'),
          child: CommonShortcuts(
            newCallback: () => _newPlayer(ref),
            child: PlayersPage(division: division),
          ),
          floatingActionButton: NewButton(
            onPressed: () => _newPlayer(ref),
            tooltip: 'New Player',
          ),
        ),
        TabbedScaffoldTab(
          title: 'Events',
          icon: const Text(
            'The events which have happened in the club in the current period',
          ),
          child: CommonShortcuts(
            newCallback: () => _newLadderEvent(ref),
            child: LadderEventsPage(division: division),
          ),
          floatingActionButton: NewButton(
            onPressed: () => _newLadderEvent(ref),
            tooltip: 'New Event',
          ),
        ),
        TabbedScaffoldTab(
          title: 'Point Resets',
          icon: const Text('The times when player points have been reset'),
          child: CommonShortcuts(
            child: PointsResetPage(division: division),
            newCallback: () => _newPointsReset(ref),
          ),
          floatingActionButton: NewButton(
            onPressed: () => _newPointsReset(ref),
            tooltip: 'New Point Reset',
          ),
        ),
      ],
    ),
  );

  /// Create a new player.
  Future<void> _newPlayer(final WidgetRef ref) => ref.context.pushWidgetBuilder(
    (builderContext) => NewPlayersScreen(division: division),
  );

  /// Create a new event.
  Future<void> _newLadderEvent(final WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    await db.managers.ladderEvents.create((o) => o(divisionId: division.id));
    ref.invalidate(ladderEventsProvider);
  }

  /// Create a new points reset.
  Future<void> _newPointsReset(final WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    await db.managers.pointsResets.create((o) => o(divisionId: division.id));
    ref.invalidate(pointsResetsProvider(division));
  }
}
