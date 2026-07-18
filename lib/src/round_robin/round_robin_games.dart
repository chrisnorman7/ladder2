import 'package:ladder2/src/round_robin/round_robin_game.dart';

/// Returns a list of games for a round robin event.
List<RoundRobinGame<T>> roundRobinGames<T>(
  final List<T> players, {
  final bool jumpy = false,
}) {
  if (players.length < 2) {
    throw StateError('At least 2 players must be provided.');
  }
  if (players.length == 2) {
    return [RoundRobinGame(player1: players.first, player2: players.last)];
  }
  final unorderedGames = <RoundRobinGame<T>>[];
  for (var i = 0; i < players.length - 1; i++) {
    final player1 = players[i];
    for (var j = i + 1; j < players.length; j++) {
      final player2 = players[j];
      unorderedGames.add(RoundRobinGame(player1: player1, player2: player2));
    }
  }
  final games = [unorderedGames.removeAt(0)];
  var popLast = true;
  while (unorderedGames.isNotEmpty) {
    final lastGame = games.last;
    RoundRobinGame<T>? game;
    for (var i = 0; i < unorderedGames.length; i++) {
      final potential = unorderedGames[i];
      if (!lastGame.players.contains(potential.player1) &&
          !lastGame.players.contains(potential.player2)) {
        game = unorderedGames.removeAt(i);
        break;
      }
    }
    if (game == null) {
      if (popLast || !jumpy) {
        popLast = false;
        game = unorderedGames.removeLast();
      } else {
        popLast = true;
        game = unorderedGames.removeAt(0);
      }
    }
    games.add(game);
  }
  return games;
}
