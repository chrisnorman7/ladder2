import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/providers.dart';

/// A widget for managing the lifecycle of the database.
class DatabaseManager extends ConsumerStatefulWidget {
  /// Create an instance.
  const DatabaseManager({required this.child, super.key});

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create state for this widget.
  @override
  DatabaseManagerState createState() => DatabaseManagerState();
}

/// State for [DatabaseManager].
class DatabaseManagerState extends ConsumerState<DatabaseManager> {
  /// The database to use.
  late AppDatabase database;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      RendererBinding.instance.ensureSemantics();
    }
  }

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    database.close();
  }

  /// Build a widget.
  @override
  Widget build(BuildContext context) {
    database = ref.watch(databaseProvider);
    return widget.child;
  }
}
