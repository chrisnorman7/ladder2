import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/database/tables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provide the database.
@riverpod
AppDatabase database(final Ref ref) => AppDatabase();

/// Provide all players in the database.
final playersProvider = FutureProvider.family<List<Player>, PlayerDivision>((
  final ref,
  final division,
) {
  final db = ref.watch(databaseProvider);
  return db.managers.players
      .filter((f) => f.divisionId.id.equals(division.id))
      .orderBy((o) => o.name.asc())
      .get();
});

/// Provides the most recent points reset.
@riverpod
Future<DateTime?> pointsResetWhen(final Ref ref) {
  final db = ref.watch(databaseProvider);
  return db.managers.pointsResets
      .orderBy((o) => o.when.desc())
      .getSingleOrNull()
      .then((reset) => reset?.when);
}

/// All the events which have happened.
final ladderEventsProvider =
    FutureProvider.family<List<LadderEvent>, PlayerDivision>((
      ref,
      division,
    ) async {
      final db = ref.watch(databaseProvider);
      final resetWhen = await ref.watch(pointsResetWhenProvider.future);
      var query = db.managers.ladderEvents
          .filter((f) => f.divisionId.id.equals(division.id))
          .orderBy((o) => o.when.desc());
      if (resetWhen != null) {
        query = query.filter((f) => f.when.isAfterOrOn(resetWhen));
      }
      return query.get();
    });

/// Provide all games for the given event.
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

/// Provide all the games the given player has played.
final playerGamesProvider = FutureProvider.family<List<EventGame>, Player>((
  final ref,
  final player,
) async {
  final db = ref.watch(databaseProvider);
  final resetWhen = await ref.watch(pointsResetWhenProvider.future);
  var query = db.managers.eventGames.filter(
    (f) => f.player1Id.id.equals(player.id) | f.player2Id.id.equals(player.id),
  );
  if (resetWhen != null) {
    query = query.filter((f) => f.eventId.when.isAfterOrOn(resetWhen));
  }
  return query.get();
});

/// Provide the sets for the given game.
final gameSetsProvider = FutureProvider.family<List<GameSet>, EventGame>((
  final ref,
  final game,
) {
  final db = ref.watch(databaseProvider);
  return db.managers.gameSets.filter((f) => f.gameId.id.equals(game.id)).get();
});

/// Provide the points for the given player.
@riverpod
Future<int> playerPoints(final Ref ref, final int playerId) async {
  final db = ref.watch(databaseProvider);
  final resetWhen = await ref.watch(pointsResetWhenProvider.future);
  var query = db.managers.eventGames.filter(
    (f) => f.player1Id.id.equals(playerId) | f.player2Id.id.equals(playerId),
  );
  if (resetWhen != null) {
    query = query.filter((f) => f.eventId.when.isAfterOrOn(resetWhen));
  }
  final games = await query.get();
  var points = 0;
  for (final game in games) {
    final sets = await db.managers.gameSets
        .filter((f) => f.gameId.id.equals(game.id))
        .get();
    for (final set in sets) {
      if ((game.player1Id == playerId &&
              set.winningPlayer == WinningPlayer.player1) ||
          (game.player2Id == playerId &&
              set.winningPlayer == WinningPlayer.player2)) {
        points++;
      }
    }
  }
  return points;
}

/// Provide all divisions.
final playerDivisionsProvider = FutureProvider<List<PlayerDivision>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.managers.playerDivisions.orderBy((o) => o.name.asc()).get();
});
