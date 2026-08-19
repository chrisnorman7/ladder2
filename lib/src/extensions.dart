import 'package:drift/drift.dart';
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
    players.removeWhere((player) => player.deactivated != null);
    if (players.length < 2) {
      throw UnsupportedError(
        // ignore: lines_longer_than_80_chars
        'At least 2 active players must be present in a division in order to create games.',
      );
    }
    final games = roundRobinGames(players.map((player) => player.id).toList());
    for (final game in games) {
      final count = await db.managers.eventGames
          .filter(
            (f) =>
                f.eventId.id.equals(id) &
                f.player1Id.id.equals(game.player1) &
                f.player2Id.id.equals(game.player2),
          )
          .count();
      if (count == 0) {
        await db.managers.eventGames.create(
          (o) =>
              o(eventId: id, player1Id: game.player1, player2Id: game.player2),
        );
      }
    }
    ref.invalidate(eventGamesProvider(this));
  }
}

/// Useful extensions on [DateTime]s.
extension DateTimeX on DateTime {
  /// Return `this` [DateTime], but at midnight.
  DateTime get midnight => DateTime(year, month, day);

  /// Returns `true` if `this` [DateTime] is on the same day as [other].
  bool isSameDayAs(final DateTime other) =>
      other.year == year && other.month == month && other.day == day;
}
