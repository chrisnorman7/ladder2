import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A widget which shows [date] in a human-readable format.
class DateText extends StatelessWidget {
  /// Create an instance.
  const DateText({required this.date, super.key});

  /// The dateTime to use.
  final DateTime date;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final dateFormat = DateFormat('EEEE dd MMMM y').format(date);
    return Text(dateFormat);
  }
}
