import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/widgets/ladder_events_page.dart';
import 'package:ladder2/widgets/players_page.dart';

/// The main screen of the application.
class MainScreen extends ConsumerWidget {
  /// Create an instance.
  const MainScreen({super.key});

  /// Build the widget.
  @override
  Widget build(
    final BuildContext context,
    final WidgetRef ref,
  ) => TabbedScaffold(
    tabs: [
      TabbedScaffoldTab(
        title: 'Players',
        icon: const Text('All the players in the club'),
        child: CommonShortcuts(
          newCallback: () => _newPlayer(ref),
          child: const PlayersPage(),
        ),
        floatingActionButton: NewButton(onPressed: () => _newPlayer(ref)),
      ),
      TabbedScaffoldTab(
        title: 'Events',
        icon: const Text(
          'The events which have happened in the club in the current period',
        ),
        child: CommonShortcuts(
          newCallback: () => _newLadderEvent(ref),
          child: const LadderEventsPage(),
        ),
        floatingActionButton: NewButton(onPressed: () => _newLadderEvent(ref)),
      ),
    ],
  );

  /// Create a new player.
  Future<void> _newPlayer(final WidgetRef ref) => ref.context.pushWidgetBuilder(
    (builderContext) => GetText(
      onDone: (name) async {
        builderContext.pop();
        final db = ref.read(databaseProvider);
        await db.managers.players.create((o) => o(name: name));
        ref.invalidate(playersProvider);
      },
      labelText: 'Player name',
      title: 'Create Player',
    ),
  );

  /// Create a new event.
  Future<void> _newLadderEvent(final WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    await db.managers.ladderEvents.create((o) => o());
    ref.invalidate(ladderEventsProvider);
  }
}
