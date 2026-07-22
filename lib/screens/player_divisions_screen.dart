import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/screens/main_screen.dart';
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
