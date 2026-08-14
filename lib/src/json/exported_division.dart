import 'package:json_annotation/json_annotation.dart';
import 'package:ladder2/src/database/database.dart';
import 'package:ladder2/src/json/exported_event.dart';

part 'exported_division.g.dart';

/// The type of a JSON blob.
typedef JsonMap = Map<String, dynamic>;

/// An exported team.
@JsonSerializable()
class ExportedDivision {
  /// Create an instance.
  const ExportedDivision({
    required this.division,
    required this.players,
    required this.events,
  });

  /// Create an instance from a JSON object.
  factory ExportedDivision.fromJson(Map<String, dynamic> json) =>
      _$ExportedDivisionFromJson(json);

  /// The division that has been exported.
  final JsonMap division;

  /// Get a new division.
  PlayerDivision getDivision() => PlayerDivision.fromJson(division);

  /// The players in this division.
  final List<JsonMap> players;

  /// Get the players for this division.
  List<Player> getPlayers() => players.map(Player.fromJson).toList();

  /// The events for this division.
  final List<ExportedEvent> events;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ExportedDivisionToJson(this);
}
