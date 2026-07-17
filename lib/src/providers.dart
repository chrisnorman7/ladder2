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

/// Hold a reference to a [game] and its players.
class GamePlayers {
  /// Create an instance.
  const GamePlayers({
    required this.game,
    required this.player1,
    required this.player2,
    required this.sets,
  });

  /// The game to use.
  final EventGame game;

  /// The [game]'s player 1.
  final Player player1;

  /// The [game]'s player 2.
  final Player player2;

  /// The sets for this game.
  final List<GameSet> sets;
}

/// Provide all games for the given event.
final eventGamesProvider =
    FutureProvider.family<List<GamePlayers>, LadderEvent>((
      ref,
      final event,
    ) async {
      final db = ref.watch(databaseProvider);
      final rows = await db.managers.eventGames
          .filter((f) => f.eventId.id.equals(event.id))
          .orderBy((o) => o.id.asc())
          .get();
      final games = <GamePlayers>[];
      final players = <int, Player>{};
      for (final game in rows) {
        final player1 =
            players[game.player1Id] ??
            await db.managers.players
                .filter((f) => f.id.equals(game.player1Id))
                .getSingle();
        players[player1.id] = player1;
        final player2 =
            players[game.player2Id] ??
            await db.managers.players
                .filter((f) => f.id.equals(game.player2Id))
                .getSingle();
        players[player2.id] = player2;
        final sets = await ref.watch(gameSetsProvider(game).future);
        games.add(
          GamePlayers(
            game: game,
            player1: player1,
            player2: player2,
            sets: sets,
          ),
        );
      }
      return games;
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
