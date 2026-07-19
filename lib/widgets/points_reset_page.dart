import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/widgets/async_value_builder.dart';
import 'package:ladder2/widgets/date_text.dart';

/// The page that shows all point resets.
class PointsResetPage extends ConsumerWidget {
  /// Create an instance.
  const PointsResetPage({required this.division, super.key});

  /// The division whose resets will be shown.
  final PlayerDivision division;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final value = ref.watch(pointsResetsProvider(division));
    return AsyncValueBuilder(
      value: value,
      builder: (resets) {
        if (resets.isEmpty) {
          return const CenterText(
            text: 'Points have never been reset for this division.',
            autofocus: true,
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final reset = resets[index];
            final query = db.managers.pointsResets.filter(
              (f) => f.id.equals(reset.id),
            );
            final name = reset.name;
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
                        ref
                          ..invalidate(pointsResetsProvider(division))
                          ..invalidate(pointsResetProvider(division));
                      },
                      labelText: 'Reset name',
                      text: name ?? '',
                      title: 'Rename Reset',
                    ),
                  ),
                ),
                PerformableAction(
                  name: 'Move Back',
                  activator: moveUpShortcut,
                  invoke: () async {
                    await query.update(
                      (o) => o(
                        when: Value(
                          reset.when.subtract(const Duration(days: 1)),
                        ),
                      ),
                    );
                    await invalidateProviders(ref);
                  },
                ),
                PerformableAction(
                  name: 'Move Forwards',
                  activator: moveDownShortcut,
                  invoke: () async {
                    await query.update(
                      (o) => o(
                        when: Value(reset.when.add(const Duration(days: 1))),
                      ),
                    );
                    await invalidateProviders(ref);
                  },
                ),
                PerformableAction(
                  name: 'Delete',
                  activator: deleteShortcut,
                  invoke: () async {
                    await query.delete();
                    await invalidateProviders(ref);
                  },
                ),
              ],
              autofocus: index == 0,
              title: name == null ? DateText(date: reset.when) : Text(name),
              subtitle: name == null ? null : DateText(date: reset.when),
              onTap: () => dateFormatter.format(reset.when).copyToClipboard(),
            );
          },
          itemCount: resets.length,
          shrinkWrap: true,
        );
      },
    );
  }

  /// Invalidate providers.
  Future<void> invalidateProviders(final WidgetRef ref) async {
    ref
      ..invalidate(pointsResetsProvider(division))
      ..invalidate(pointsResetProvider(division));
  }
}
