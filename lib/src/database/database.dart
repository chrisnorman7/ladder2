import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:ladder2/src/database/tables.dart';

part 'database.g.dart';

/// The ladder database class.
@DriftDatabase(
  tables: [Players, LadderEvents, EventGames, GameSets, PlayerDivisions],
)
class AppDatabase extends _$AppDatabase {
  /// Create an instance.
  AppDatabase()
    : super(
        driftDatabase(
          name: 'ladder2',
          native: const DriftNativeOptions(),
          web: DriftWebOptions(
            sqlite3Wasm: Uri.parse('sqlite3.wasm'),
            driftWorker: Uri.parse('drift_worker.dart.js'),
          ),
        ),
      );

  @override
  int get schemaVersion => 1;
}
