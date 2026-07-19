import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/database/tables.dart';
import 'package:ladder2/src/game_context.dart';
import 'package:ladder2/src/providers.dart';

/// A screen to show the sets in a game.
class GameSetsScreen extends ConsumerWidget {
  /// Create an instance.
  const GameSetsScreen({required this.game, super.key});

  /// The game to show the sets for.
  final EventGame game;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final value = ref.watch(eventGameProvider(game));
    switch (value) {
      case AsyncLoading<GameContext>():
        return const LoadingScreen();
      case AsyncData<GameContext>():
        final gameContext = value.value;
        final player1 = gameContext.player1;
        final player2 = gameContext.player2;
        final sets = gameContext.sets;
        return Cancel(
          child: SimpleScaffold(
            title: '${player1.name} vs ${player2.name}',
            body: ListView.builder(
              itemBuilder: (_, index) {
                final String subtitle;
                if (index == sets.length) {
                  subtitle = 'Undecided';
                } else {
                  subtitle = switch (sets[index].winningPlayer) {
                    WinningPlayer.player1 => player1.name,
                    WinningPlayer.player2 => player2.name,
                  };
                }
                return ListTile(
                  autofocus: index == 0,
                  title: Text('Set ${index + 1}'),
                  subtitle: Text(subtitle),
                  onTap: () async {
                    if (index == sets.length) {
                      await db.managers.gameSets.create(
                        (o) => o(
                          gameId: game.id,
                          winningPlayer: WinningPlayer.values.first,
                        ),
                      );
                    } else {
                      final set = sets[index];
                      if (index == (sets.length - 1) &&
                          set.winningPlayer == WinningPlayer.values.last) {
                        await db.managers.gameSets
                            .filter((f) => f.id.equals(set.id))
                            .delete();
                      } else {
                        await db.managers.gameSets
                            .filter((f) => f.id.equals(set.id))
                            .update(
                              (o) => o(
                                winningPlayer: Value(
                                  switch (set.winningPlayer) {
                                    WinningPlayer.player1 =>
                                      WinningPlayer.player2,
                                    WinningPlayer.player2 =>
                                      WinningPlayer.player1,
                                  },
                                ),
                              ),
                            );
                      }
                    }
                    ref
                      ..invalidate(gameSetsProvider(game))
                      ..invalidate(eventGamesProvider(gameContext.event))
                      ..invalidate(eventGameProvider(game));
                    for (final player in [player1, player2]) {
                      ref.invalidate(playerPointsProvider(player));
                    }
                  },
                );
              },
              itemCount: sets.length + 1,
              shrinkWrap: true,
            ),
          ),
        );
      case AsyncError<GameContext>():
        return ErrorScreen(error: value.error, stackTrace: value.stackTrace);
    }
  }
}
