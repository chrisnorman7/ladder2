import 'dart:convert';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/providers.dart';

/// A screen for adding multiple players.
class NewPlayersScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const NewPlayersScreen({required this.division, super.key});

  /// The division to make players for.
  final PlayerDivision division;

  /// Create state for this widget.
  @override
  NewPlayersScreenState createState() => NewPlayersScreenState();
}

/// State for [NewPlayersScreen].
class NewPlayersScreenState extends ConsumerState<NewPlayersScreen> {
  late final TextEditingController _controller;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// Build a widget.
  @override
  Widget build(BuildContext context) => Cancel(
    child: CallbackShortcuts(
      bindings: {CrossPlatformSingleActivator(LogicalKeyboardKey.keyS): _save},
      child: SimpleScaffold(
        title: 'Create Players',
        body: TextField(
          autofocus: true,
          controller: _controller,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          decoration: const InputDecoration(
            helperText: 'Enter player names on separate lines',
            hintText:
                // ignore: lines_longer_than_80_chars
                'Each name will be made into a new player in the current division',
            labelText: 'Player names',
          ),
          minLines: 1,
          maxLines: null,
        ),
        floatingActionButton: SaveButton(onPressed: _save),
      ),
    ),
  );

  Future<void> _save() async {
    final names = const LineSplitter()
        .convert(_controller.text)
        .map((name) => name.trim());
    final db = ref.read(databaseProvider);
    for (final name in names) {
      await db.managers.players.create(
        (o) => o(name: name, divisionId: widget.division.id),
      );
    }
    ref.invalidate(playersProvider(widget.division));
    if (mounted) {
      context.pop();
    }
  }
}
