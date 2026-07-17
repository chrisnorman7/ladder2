import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/widgets/async_value_builder.dart';
import 'package:ladder2/widgets/points_text.dart';

/// The players tab.
class PlayersPage extends ConsumerWidget {
  /// Create an instance.
  const PlayersPage({this.playerOrder = PlayerOrder.name, super.key});

  /// The ordering scheme to use.
  final PlayerOrder playerOrder;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final value = ref.watch(playersProvider(playerOrder));
    return AsyncValueBuilder(
      value: value,
      builder: (players) => ListView.builder(
        itemBuilder: (_, final index) {
          final player = players[index];
          final query = db.managers.players.filter(
            (f) => f.id.equals(player.id),
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
                    onDone: (value) async {
                      builderContext.pop();
                      await query.update((o) => o(name: Value(value)));
                      ref.invalidate(playersProvider);
                    },
                    labelText: 'Player name',
                    text: player.name,
                    title: 'Rename Player',
                  ),
                ),
              ),
              PerformableAction(
                name: player.deactivated == null ? 'Deactivate' : 'Reactivate',
                activator: deleteShortcut,
                invoke: () async {
                  if (player.deactivated == null) {
                    await query.update(
                      (o) => o(deactivated: Value(DateTime.now())),
                    );
                  } else {
                    await query.update(
                      (o) => o(deactivated: const Value(null)),
                    );
                  }
                  ref.invalidate(playersProvider);
                },
              ),
            ],
            autofocus: index == 0,
            title: Text(player.name),
            subtitle: player.deactivated == null
                ? PointsText(player: player)
                : const Text('(Inactive)'),
            onTap: () {},
          );
        },
        itemCount: players.length,
        shrinkWrap: true,
      ),
    );
  }
}
