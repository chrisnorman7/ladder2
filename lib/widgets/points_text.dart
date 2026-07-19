import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/providers.dart';

/// A [Text] widget which shows points for [player].
class PointsText extends ConsumerWidget {
  /// Create an instance.
  const PointsText({required this.player, super.key});

  /// The player to show points for.
  final Player player;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(playerPointsProvider(player));
    switch (value) {
      case AsyncLoading<int>():
        return const Text('Loading');
      case AsyncData<int>():
        return Text('${value.value}');
      case AsyncError<int>():
        return ErrorListTile(error: value.error, stackTrace: value.stackTrace);
    }
  }
}
