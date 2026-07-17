import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/database/tables.dart';

/// Provide the database.
final databaseProvider = Provider((ref) => AppDatabase());

/// How to order players.
enum PlayerOrder {
  /// Order by the name of players.
  name,

  /// Order by player points.
  points,
}

/// Provide all players in the database.
final playersProvider = FutureProvider.family<List<Player>, PlayerOrder>((
  ref,
  final playerOrder,
) async {
  final db = ref.watch(databaseProvider);
  switch (playerOrder) {
    case PlayerOrder.name:
      return db.managers.players
          .orderBy((o) => o.deactivated.asc() & o.name.asc())
          .get();
    case PlayerOrder.points:
      final players = await db.managers.players.get();
      final points = [
        for (final player in players)
          await ref.watch(playerPointsProvider(player).future),
      ];
      final everything = [
        for (var i = 0; i < players.length; i++) (players[i], points[i]),
      ]..sort((a, b) => a.$2.compareTo(b.$2));
      return everything.map((e) => e.$1).toList();
  }
});

/// Provides the most recent points reset.
///
/// If no reset has ever happened, a dummy reset is generated with an ID of
/// `-1`.
final pointsResetProvider = FutureProvider<PointsReset?>((ref) {
  final db = ref.watch(databaseProvider);
  return db.managers.pointsResets
      .orderBy((o) => o.when.desc())
      .getSingleOrNull();
});

/// All the events which have happened.
final ladderEventsProvider = FutureProvider<List<LadderEvent>>((ref) async {
  final db = ref.watch(databaseProvider);
  final reset = await ref.watch(pointsResetProvider.future);
  var query = db.managers.ladderEvents.orderBy((o) => o.when.desc());
  if (reset != null) {
    query = query.filter((f) => f.when.isAfterOrOn(reset.when));
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
  final reset = await ref.watch(pointsResetProvider.future);
  var query = db.managers.eventGames.filter(
    (f) => f.player1Id.id.equals(player.id) | f.player2Id.id.equals(player.id),
  );
  if (reset != null) {
    query = query.filter((f) => f.eventId.when.isAfterOrOn(reset.when));
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
final playerPointsProvider = FutureProvider.family<int, Player>((
  final ref,
  final player,
) async {
  final games = await ref.watch(playerGamesProvider(player).future);
  var points = 0;
  for (final game in games) {
    final sets = await ref.watch(gameSetsProvider(game).future);
    for (final set in sets) {
      if ((game.player1Id == player.id &&
              set.winningPlayer == WinningPlayer.player1) ||
          (game.player2Id == player.id &&
              set.winningPlayer == WinningPlayer.player2)) {
        points++;
      }
    }
  }
  return points;
});
