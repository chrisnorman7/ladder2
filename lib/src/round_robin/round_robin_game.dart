/// A game in a round robin event.
class RoundRobinGame<T> {
  /// Create an instance.
  const RoundRobinGame({required this.player1, required this.player2});

  /// Player 1.
  final T player1;

  /// Player 2.
  final T player2;

  /// Returns the players for this game.
  List<T> get players => [player1, player2];
}
