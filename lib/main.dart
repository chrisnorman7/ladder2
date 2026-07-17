import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/screens/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// The top-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({super.key});

  /// Build the widget.
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Ladder2',
    theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    home: const MainScreen(),
  );
}
