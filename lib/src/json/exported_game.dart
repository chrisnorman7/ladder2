import 'package:json_annotation/json_annotation.dart';
import 'package:ladder2/src/json/exported_division.dart';

part 'exported_game.g.dart';

/// An exported game.
@JsonSerializable()
class ExportedGame {
  /// Create an instance.
  const ExportedGame({required this.game, required this.sets});

  /// Create an instance from a JSON object.
  factory ExportedGame.fromJson(Map<String, dynamic> json) =>
      _$ExportedGameFromJson(json);

  /// The game to use.
  final JsonMap game;

  /// The sets in this game.
  final List<JsonMap> sets;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ExportedGameToJson(this);
}
