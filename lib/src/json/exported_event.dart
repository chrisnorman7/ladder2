import 'package:json_annotation/json_annotation.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/game_context.dart';
import 'package:ladder2/src/json/exported_division.dart';
import 'package:ladder2/src/json/exported_game.dart';

part 'exported_event.g.dart';

/// An exported event.
@JsonSerializable()
class ExportedEvent {
  /// Create an instance.
  const ExportedEvent({required this.event, required this.games});

  /// Create an instance from a JSON object.
  factory ExportedEvent.fromJson(Map<String, dynamic> json) =>
      _$ExportedEventFromJson(json);

  /// The event to store data for.
  final JsonMap event;

  /// Get the actual event.
  LadderEvent getEvent() => LadderEvent.fromJson(event);

  /// The games in this event.
  final List<ExportedGame> games;

  /// Get the games for this event.
  List<GameContext> getGames(final List<Player> players) {
    final event = getEvent();
    return games.map((game) {
      final eventGame = EventGame.fromJson(game.game);
      return GameContext(
        event: event,
        game: eventGame,
        player1: players.firstWhere((p) => p.id == eventGame.player1Id),
        player2: players.firstWhere((p) => p.id == eventGame.player2Id),
        sets: game.sets.map(GameSet.fromJson).toList(),
      );
    }).toList();
  }

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ExportedEventToJson(this);
}
