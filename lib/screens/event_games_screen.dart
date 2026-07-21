import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/screens/game_sets_screen.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/database/tables.dart';
import 'package:ladder2/src/extensions.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/widgets/async_value_builder.dart';
import 'package:ladder2/widgets/date_text.dart';

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
            builder: (games) {
              if (games.isEmpty) {
                return const CenterText(
                  text: 'There are no games to show.',
                  autofocus: true,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
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
                        name: 'Copy Schedule',
                        activator: copyShortcut,
                        invoke: () {
                          final buffer = StringBuffer()
                            ..writeln(
                              // ignore: lines_longer_than_80_chars
                              'Schedule for ${dateFormatter.format(event.when)}:',
                            );
                          for (var i = 0; i < games.length; i++) {
                            final row = games[i];
                            buffer.writeln(
                              // ignore: lines_longer_than_80_chars
                              '#${i + 1}: ${row.player1.name} vs ${row.player2.name}',
                            );
                          }
                          buffer.toString().copyToClipboard();
                        },
                      ),
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
                    onTap: () => context.pushWidgetBuilder(
                      (_) => GameSetsScreen(game: game),
                    ),
                  );
                },
                itemCount: games.length,
                shrinkWrap: true,
              );
            },
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
    try {
      await event.populateGames(ref);
      // ignore: avoid_catching_errors
    } on UnsupportedError catch (e) {
      if (ref.context.mounted) {
        await ref.context.showMessage(
          message: e.message ?? 'An unknown error occurred.',
        );
      }
    }
  }
}
