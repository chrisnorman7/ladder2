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

/// All the events which have happened.
final ladderEventsProvider =
    FutureProvider.family<List<LadderEvent>, PlayerDivision>((
      ref,
      division,
    ) async {
      final db = ref.watch(databaseProvider);
      final events = await db.managers.ladderEvents
          .filter((f) => f.divisionId.id.equals(division.id))
          .orderBy((o) => o.when.asc())
          .get();
      return events
          .where((event) => division.lastPointsReset.isBefore(event.when))
          .toList();
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
  final division = await db.managers.playerDivisions
      .filter((f) => f.id.equals(player.divisionId))
      .getSingle();
  final events = await ref.watch(ladderEventsProvider(division).future);
  final eventIds = events.map((event) => event.id);
  final games = await db.managers.eventGames
      .filter(
        (f) =>
            f.player1Id.id.equals(player.id) | f.player2Id.id.equals(player.id),
      )
      .get();
  return games.where((game) => eventIds.contains(game.eventId)).toList();
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
  final games = await ref.watch(playerGamesProvider(player).future);
  var points = 0;
  print('Games for $player:');
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
