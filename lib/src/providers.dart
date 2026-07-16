import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';

/// Provide the database.
final databaseProvider = Provider((ref) => AppDatabase());

/// Provide all players in the database.
final playersProvider = FutureProvider<List<Player>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.managers.players.orderBy((o) => o.name.asc()).get();
});

/// All the events which have happened.
final eventsProvider = FutureProvider<List<LadderEvent>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.managers.ladderEvents.orderBy((o) => o.when.desc()).get();
});

/// Provide all games.
final gamesProvider = FutureProvider.family<List<EventGame>, LadderEvent>((
  ref,
  final event,
) {
  final db = ref.watch(databaseProvider);
  return db.managers.eventGames
      .filter((f) => f.eventId.id.equals(event.id))
      .orderBy((o) => o.id.asc())
      .get();
});
