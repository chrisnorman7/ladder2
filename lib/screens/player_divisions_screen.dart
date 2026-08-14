import 'dart:convert';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/screens/main_screen.dart';
import 'package:ladder2/src/json/exported_division.dart';
import 'package:ladder2/src/json/exported_event.dart';
import 'package:ladder2/src/json/exported_game.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/widgets/async_value_builder.dart';
import 'package:ladder2/widgets/date_text.dart';
import 'package:ladder2/widgets/date_time_actions.dart';

/// The screen which shows all player divisions.
class PlayerDivisionsScreen extends ConsumerWidget {
  /// Create an instance.
  const PlayerDivisionsScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(playerDivisionsProvider);
    final db = ref.watch(databaseProvider);
    return CommonShortcuts(
      newCallback: () => _newDivision(ref),
      child: SimpleScaffold(
        actions: [
          IconButton(
            onPressed: () async {
              final file = await openFile(
                acceptedTypeGroups: [
                  const XTypeGroup(
                    extensions: ['json'],
                    label: 'JSON files',
                    uniformTypeIdentifiers: ['division.json'],
                  ),
                ],
              );
              if (file == null) {
                return; // Cancelled.
              }
              final source = await file.readAsString();
              final json = jsonDecode(source) as JsonMap;
              final imported = ExportedDivision.fromJson(json);
              final importedDivision = imported.getDivision();
              final managers = db.managers;
              final division = await managers.playerDivisions.createReturning(
                (o) => o(
                  name: importedDivision.name,
                  lastPointsReset: Value(importedDivision.lastPointsReset),
                ),
              );
              final playerIds = <int, int>{};
              final importedPlayers = imported.getPlayers();
              for (final importedPlayer in importedPlayers) {
                final player = await managers.players.createReturning(
                  (o) => o(
                    divisionId: division.id,
                    name: importedPlayer.name,
                    deactivated: Value(importedPlayer.deactivated),
                  ),
                );
                playerIds[importedPlayer.id] = player.id;
              }
              for (final eventContext in imported.events) {
                final importedEvent = eventContext.getEvent();
                final event = await managers.ladderEvents.createReturning(
                  (o) => o(
                    divisionId: division.id,
                    name: Value(importedEvent.name),
                    when: Value(importedEvent.when),
                  ),
                );
                for (final gameContext in eventContext.getGames(
                  importedPlayers,
                )) {
                  final game = await managers.eventGames.createReturning(
                    (o) => o(
                      eventId: event.id,
                      player1Id: playerIds[gameContext.player1.id]!,
                      player2Id: playerIds[gameContext.player2.id]!,
                    ),
                  );
                  for (final importedSet in gameContext.sets) {
                    await managers.gameSets.create(
                      (o) => o(
                        gameId: game.id,
                        winningPlayer: importedSet.winningPlayer,
                      ),
                    );
                  }
                }
              }
              ref.invalidate(playerDivisionsProvider);
            },
            icon: const Icon(Icons.import_contacts_outlined),
            tooltip: 'Import division from JSON',
          ),
        ],
        title: 'Divisions',
        body: AsyncValueBuilder(
          value: value,
          builder: (divisions) => ListView.builder(
            itemBuilder: (_, index) {
              final division = divisions[index];
              final query = db.managers.playerDivisions.filter(
                (f) => f.id.equals(division.id),
              );
              final dateTimeActions = DateTimeActions(
                dateTime: division.lastPointsReset,
                onChanged: (dateTime) async {
                  await query.update(
                    (o) => o(lastPointsReset: Value(dateTime)),
                  );
                  ref
                    ..invalidate(playerDivisionsProvider)
                    ..invalidate(playersProvider(division))
                    ..invalidate(ladderEventsProvider(division));
                },
                max: DateTime.now(),
              );
              return PerformableActionsListTile(
                actions: [
                  PerformableAction(
                    name: 'Rename',
                    activator: CrossPlatformSingleActivator(
                      LogicalKeyboardKey.keyR,
                    ),
                    invoke: () => context.pushWidgetBuilder(
                      (builderContext) => GetText(
                        onDone: (name) async {
                          builderContext.pop();
                          await query.update((o) => o(name: Value(name)));
                          ref.invalidate(playerDivisionsProvider);
                        },
                        labelText: 'Division name',
                        text: division.name,
                        title: 'Rename Division',
                      ),
                    ),
                  ),
                  ...dateTimeActions.actions,
                  PerformableAction(
                    name: 'Export',
                    activator: CrossPlatformSingleActivator(
                      LogicalKeyboardKey.keyE,
                      shift: true,
                    ),
                    invoke: () async {
                      final players = await ref.read(
                        playersProvider(division).future,
                      );
                      final ladderEvents = await ref.read(
                        ladderEventsProvider(division).future,
                      );
                      final events = <ExportedEvent>[];
                      for (final event in ladderEvents) {
                        final games = await ref.read(
                          eventGamesProvider(event).future,
                        );
                        events.add(
                          ExportedEvent(
                            event: event.toJson(),
                            games: games
                                .map(
                                  (gameContext) => ExportedGame(
                                    game: gameContext.game.toJson(),
                                    sets: gameContext.sets
                                        .map((final set) => set.toJson())
                                        .toList(),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      }
                      final export = ExportedDivision(
                        division: division.toJson(),
                        players: players
                            .map((player) => player.toJson())
                            .toList(),
                        events: events,
                      );
                      final json = const JsonEncoder.withIndent(
                        '  ',
                      ).convert(export);
                      final fileName = 'division_${division.id}.json';
                      final result = await getSaveLocation(
                        suggestedName: fileName,
                      );
                      if (result == null) {
                        // Operation was canceled by the user.
                        return;
                      }
                      final fileData = Uint8List.fromList(json.codeUnits);
                      const mimeType = 'application/json';
                      final textFile = XFile.fromData(
                        fileData,
                        mimeType: mimeType,
                        name: fileName,
                      );
                      await textFile.saveTo(result.path);
                    },
                  ),
                  PerformableAction(
                    name: 'Delete',
                    activator: deleteShortcut,
                    invoke: () async {
                      final players = await ref.read(
                        playersProvider(division).future,
                      );
                      if (players.isEmpty) {
                        final events = await ref.read(
                          ladderEventsProvider(division).future,
                        );
                        if (events.isEmpty) {
                          await query.delete();
                          ref.invalidate(playerDivisionsProvider);
                        } else {
                          if (context.mounted) {
                            await context.showMessage(
                              message:
                                  // ignore: lines_longer_than_80_chars
                                  'You can only delete divisions with no events.',
                            );
                          }
                        }
                      } else {
                        if (context.mounted) {
                          await context.showMessage(
                            message:
                                // ignore: lines_longer_than_80_chars
                                'You can only delete divisions with no players in them.',
                          );
                        }
                      }
                    },
                  ),
                ],
                autofocus: index == 0,
                title: Text(division.name),
                subtitle: DateText(date: division.lastPointsReset),
                onTap: () => context.pushWidgetBuilder(
                  (_) => MainScreen(division: division),
                ),
              );
            },
            itemCount: divisions.length,
            shrinkWrap: true,
          ),
        ),
        floatingActionButton: NewButton(
          onPressed: () => _newDivision(ref),
          tooltip: 'New Division',
        ),
      ),
    );
  }

  /// Create a new division.
  Future<void> _newDivision(final WidgetRef ref) =>
      ref.context.pushWidgetBuilder(
        (context) => GetText(
          onDone: (name) async {
            context.pop();
            final db = ref.read(databaseProvider);
            await db.managers.playerDivisions.create((o) => o(name: name));
            ref.invalidate(playerDivisionsProvider);
          },
          labelText: 'Division name',
          title: 'New Division',
        ),
      );
}
