import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/screens/event_games_screen.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/widgets/async_value_builder.dart';
import 'package:ladder2/widgets/date_text.dart';

/// The events page.
class LadderEventsPage extends ConsumerWidget {
  /// Create an instance.
  const LadderEventsPage({required this.division, super.key});

  /// The division to show events for.
  final PlayerDivision division;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final value = ref.watch(ladderEventsProvider(division));
    return AsyncValueBuilder(
      value: value,
      builder: (events) => ListView.builder(
        itemBuilder: (context, final index) {
          final event = events[index];
          final query = db.managers.ladderEvents.filter(
            (f) => f.id.equals(event.id),
          );
          final name = event.name;
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
                      await query.update(
                        (o) => o(name: Value(name.isEmpty ? null : name)),
                      );
                      ref.invalidate(ladderEventsProvider(division));
                    },
                    labelText: 'Event name',
                    text: name ?? '',
                    title: 'Rename Event',
                  ),
                ),
              ),
              PerformableAction(
                name: 'Move Back',
                activator: moveUpShortcut,
                invoke: () async {
                  await query.update(
                    (o) => o(
                      when: Value(event.when.subtract(const Duration(days: 1))),
                    ),
                  );
                  ref.invalidate(ladderEventsProvider);
                },
              ),
              PerformableAction(
                name: 'Move Forward',
                activator: moveDownShortcut,
                invoke: () async {
                  await query.update(
                    (o) =>
                        o(when: Value(event.when.add(const Duration(days: 1)))),
                  );
                  ref.invalidate(ladderEventsProvider);
                },
              ),
              PerformableAction(
                name: 'Delete',
                activator: deleteShortcut,
                invoke: () async {
                  final games = await ref.read(
                    eventGamesProvider(event).future,
                  );
                  if (games.isEmpty) {
                    await query.delete();
                    ref.invalidate(ladderEventsProvider);
                  } else {
                    if (context.mounted) {
                      await context.showMessage(
                        message: 'You can only delete events with no games.',
                      );
                    }
                  }
                },
              ),
              PerformableAction(
                name: 'Set To Today',
                activator: CrossPlatformSingleActivator(
                  LogicalKeyboardKey.keyT,
                ),
                invoke: () async {
                  await query.update((o) => o(when: Value(DateTime.now())));
                  ref.invalidate(ladderEventsProvider);
                },
              ),
            ],
            autofocus: index == 0,
            title: name == null ? DateText(date: event.when) : Text(name),
            subtitle: name == null ? null : DateText(date: event.when),
            onTap: () => context.pushWidgetBuilder(
              (_) => EventGamesScreen(event: event),
            ),
          );
        },
        itemCount: events.length,
        shrinkWrap: true,
      ),
    );
  }
}
