import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/providers.dart';
import 'package:ladder2/src/round_robin/round_robin_games.dart';

/// Useful extension methods on ladder events.
extension LadderEventX on LadderEvent {
  /// Populate this event with games.
  Future<void> populateGames(final WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    final division = await db.managers.playerDivisions
        .filter((f) => f.id.equals(divisionId))
        .getSingle();
    final players = await ref.read(playersProvider(division).future);
    if (players.length < 2) {
      throw UnsupportedError(
        // ignore: lines_longer_than_80_chars
        'At least 2 players must be present in a division in order to create games.',
      );
    }
    final games = roundRobinGames(players.map((player) => player.id).toList());
    for (final game in games) {
      await db.managers.eventGames.create(
        (o) => o(eventId: id, player1Id: game.player1, player2Id: game.player2),
      );
    }
    ref.invalidate(eventGamesProvider(this));
  }
}
