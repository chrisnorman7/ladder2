import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/database/tables.dart';
import 'package:ladder2/src/game_context.dart';

/// Provide the database.
final databaseProvider = Provider<AppDatabase>((final ref) => AppDatabase());

/// Provide all players in the database.
final playersProvider = FutureProvider.family<List<Player>, PlayerDivision>((
  final ref,
  final division,
) async {
  final db = ref.watch(databaseProvider);
  final players = await db.managers.players
      .filter((f) => f.divisionId.id.equals(division.id))
      .orderBy((o) => o.name.asc())
      .get();
  if (players.isEmpty) {
    return [
      await db.managers.players.createReturning(
        (o) => o(divisionId: division.id, name: 'First Player'),
      ),
    ];
  }
  return players;
});

/// Provides all point resets for the given division.
final pointsResetsProvider =
    FutureProvider.family<List<PointsReset>, PlayerDivision>((
      final ref,
      final division,
    ) async {
      final db = ref.watch(databaseProvider);
      return db.managers.pointsResets.orderBy((o) => o.when.desc()).get();
    });

/// Provides the most recent points reset.
final pointsResetProvider = FutureProvider.family<PointsReset?, PlayerDivision>(
  (final ref, final division) async {
    final db = ref.watch(databaseProvider);
    return db.managers.pointsResets
        .filter((f) => f.divisionId.id.equals(division.id))
        .orderBy((o) => o.when.desc())
        .getSingleOrNull();
  },
);

/// All the events which have happened.
final ladderEventsProvider =
    FutureProvider.family<List<LadderEvent>, PlayerDivision>((
      ref,
      division,
    ) async {
      final db = ref.watch(databaseProvider);
      final reset = await ref.watch(pointsResetProvider(division).future);
      return db.managers.ladderEvents
          .filter((f) {
            final divisionIdMatchExpression = f.divisionId.id.equals(
              division.id,
            );
            if (reset == null) {
              return divisionIdMatchExpression;
            }
            return divisionIdMatchExpression & f.when.isAfterOrOn(reset.when);
          })
          .orderBy((o) => o.when.desc())
          .get();
    });

/// Provide all games for the given event.
final eventGamesProvider =
    FutureProvider.family<List<GameContext>, LadderEvent>((
      ref,
      final event,
    ) async {
      final db = ref.watch(databaseProvider);
      final rows = await db.managers.eventGames
          .filter((f) => f.eventId.id.equals(event.id))
          .orderBy((o) => o.id.asc())
          .get();
      final games = <GameContext>[];
      for (final game in rows) {
        games.add(await ref.watch(eventGameProvider(game).future));
      }
      return games;
    });

/// Provide context for a single game.
final eventGameProvider = FutureProvider.family<GameContext, EventGame>((
  final ref,
  final game,
) async {
  final db = ref.watch(databaseProvider);
  final player1 = await db.managers.players
      .filter((f) => f.id.equals(game.player1Id))
      .getSingle();
  final player2 = await db.managers.players
      .filter((f) => f.id.equals(game.player2Id))
      .getSingle();
  final sets = await ref.watch(gameSetsProvider(game).future);
  return GameContext(
    event: await db.managers.ladderEvents
        .filter((f) => f.id.equals(game.eventId))
        .getSingle(),
    game: game,
    player1: player1,
    player2: player2,
    sets: sets,
  );
});

/// Provide all the games the given player has played.
final playerGamesProvider = FutureProvider.family<List<EventGame>, Player>((
  final ref,
  final player,
) async {
  final db = ref.watch(databaseProvider);
  final reset = await ref.watch(
    pointsResetProvider(PlayerDivision(id: player.divisionId, name: '')).future,
  );
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
  final playerId = player.id;
  final db = ref.watch(databaseProvider);
  final reset = await ref.watch(
    pointsResetProvider(PlayerDivision(id: player.divisionId, name: '')).future,
  );
  final games = await db.managers.eventGames.filter((f) {
    final playerIdMatchExpression =
        f.player1Id.id.equals(playerId) | f.player2Id.id.equals(playerId);
    if (reset == null) {
      return playerIdMatchExpression;
    }
    return playerIdMatchExpression & f.eventId.when.isAfterOrOn(reset.when);
  }).get();
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
});

/// Provide all divisions.
final playerDivisionsProvider = FutureProvider<List<PlayerDivision>>((
  ref,
) async {
  final db = ref.watch(databaseProvider);
  final divisions = await db.managers.playerDivisions
      .orderBy((o) => o.name.asc())
      .get();
  if (divisions.isEmpty) {
    return [
      await db.managers.playerDivisions.createReturning(
        (o) => o(name: 'Default Division'),
      ),
    ];
  }
  return divisions;
});
