import 'dart:async';

import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/services.dart';

/// Provide a set of [actions] which can be performed on [DateTime] objects.
class DateTimeActions {
  /// Create an instance.
  const DateTimeActions({
    required this.dateTime,
    required this.onChanged,
    this.min,
    this.max,
  });

  /// The date time to start with.
  final DateTime dateTime;

  /// The function to call when [dateTime] has been updated.
  final FutureOr<void> Function(DateTime dateTime) onChanged;

  /// The minimum date time.
  final DateTime? min;

  /// The maximum date time.
  final DateTime? max;

  /// Get the actions to use.
  List<PerformableAction> get actions {
    final keys = <(String, LogicalKeyboardKey, int)>{
      ('Back 1 Day', LogicalKeyboardKey.arrowUp, -1),
      ('Forward 1 Day', LogicalKeyboardKey.arrowDown, 1),
      ('Back 1 Week', LogicalKeyboardKey.pageUp, -7),
      ('Forward 1 Week', LogicalKeyboardKey.pageDown, 7),
      ('Back 1 Year', LogicalKeyboardKey.home, -365),
      ('Forward 1 Year', LogicalKeyboardKey.end, 365),
      ('Move To Today', LogicalKeyboardKey.keyT, 0),
    };
    final possibleActions = keys.map((row) {
      final (name, key, days) = row;
      final duration = Duration(days: days.abs());
      final DateTime d;
      if (days == 0) {
        final now = DateTime.now();
        d = DateTime(now.year, now.month, now.day);
      } else if (days.isNegative) {
        final adjusted = dateTime.subtract(duration);
        d = DateTime(adjusted.year, adjusted.month, adjusted.day);
      } else {
        final adjusted = dateTime.add(duration);
        d = DateTime(adjusted.year, adjusted.month, adjusted.day);
      }
      final minDateTime = min;
      final maxDateTime = max;
      if ((minDateTime == null || d.isAfter(minDateTime)) &&
          (maxDateTime == null || d.isBefore(maxDateTime))) {
        return PerformableAction(
          name: name,
          activator: CrossPlatformSingleActivator(key),
          invoke: () => onChanged(d),
        );
      }
      return null;
    });
    return possibleActions.whereType<PerformableAction>().toList();
  }
}
