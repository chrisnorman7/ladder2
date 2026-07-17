import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ladder2/src/database/tables.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

/// The ladder database class.
@DriftDatabase(
  tables: [
    Players,
    LadderEvents,
    EventGames,
    GameSets,
    PointsResets,
    PlayerDivisions,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Create an instance.
  AppDatabase({final bool debug = false})
    : super(
        debug
            ? NativeDatabase.memory()
            : LazyDatabase(() async {
                final documentsPath = await getApplicationDocumentsDirectory();
                final directoryName = path.join(documentsPath.path, 'ladder2');
                final file = File(path.join(directoryName, 'ladder2.sqlite3'));
                return NativeDatabase(file);
              }),
      );

  @override
  int get schemaVersion => 1;
}
