import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/database/tables.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/widgets/async_value_builder.dart';

/// Show games for the given [event].
class EventGamesScreen extends ConsumerWidget {
  /// Create an instance.
  const EventGamesScreen({required this.event, super.key});

  /// The event to show games for.
  final LadderEvent event;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final value = ref.watch(eventGamesProvider(event));
    return CommonShortcuts(
      newCallback: () => _populateGames(ref),
      child: Cancel(
        child: SimpleScaffold(
          title: 'Games',
          body: AsyncValueBuilder(
            value: value,
            builder: (games) => ListView.builder(
              itemBuilder: (_, index) {
                final row = games[index];
                final game = row.game;
                final player1 = row.player1;
                final player2 = row.player2;
                final sets = row.sets;
                final player1Points = sets
                    .where((e) => e.winningPlayer == WinningPlayer.player1)
                    .length;
                final player2Points = sets
                    .where((e) => e.winningPlayer == WinningPlayer.player2)
                    .length;
                final query = db.managers.eventGames.filter(
                  (f) => f.id.equals(game.id),
                );
                return PerformableActionsListTile(
                  actions: [
                    PerformableAction(
                      name: 'Delete',
                      activator: deleteShortcut,
                      invoke: () async {
                        final sets = await ref.read(
                          gameSetsProvider(game).future,
                        );
                        if (sets.isEmpty) {
                          await query.delete();
                          ref.invalidate(eventGamesProvider(event));
                        } else {
                          if (context.mounted) {
                            await context.showMessage(
                              message:
                                  'You can only delete games with no sets.',
                            );
                          }
                        }
                      },
                    ),
                  ],
                  autofocus: index == 0,
                  title: Text(
                    '#${index + 1}: ${player1.name} vs ${player2.name}',
                  ),
                  subtitle: Text('$player1Points : $player2Points'),
                  onTap: () {},
                );
              },
              itemCount: games.length,
              shrinkWrap: true,
            ),
          ),
          floatingActionButton: NewButton(
            onPressed: () => _populateGames(ref),
            tooltip: 'Populate Games',
          ),
        ),
      ),
    );
  }

  /// Populate the games.
  Future<void> _populateGames(final WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    final division = await db.managers.playerDivisions
        .filter((f) => f.id.equals(event.divisionId))
        .getSingle();
    final players = await ref.read(playersProvider(division).future);
    final games = <EventGame>[];
    for (var i = 0; i < (players.length - 1); i++) {
      final player1 = players[i];
      for (var j = i + 1; j < players.length; j++) {
        final player2 = players[j];
        final query = db.managers.eventGames.filter(
          (f) =>
              f.eventId.id.equals(event.id) &
              f.player1Id.id.equals(player1.id) &
              f.player2Id.id.equals(player2.id),
        );
        if (await query.getSingleOrNull() == null) {
          games.add(
            EventGame(
              id: -1,
              eventId: event.id,
              player1Id: player1.id,
              player2Id: player2.id,
            ),
          );
        }
      }
    }
    games.shuffle();
    for (final game in games) {
      await db.managers.eventGames.create(
        (o) => o(
          eventId: event.id,
          player1Id: game.player1Id,
          player2Id: game.player2Id,
        ),
      );
    }
    ref.invalidate(eventGamesProvider(event));
  }
}
