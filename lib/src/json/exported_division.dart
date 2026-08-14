import 'package:json_annotation/json_annotation.dart';
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

  /// The players in this division.
  final List<JsonMap> players;

  /// The events for this division.
  final List<ExportedEvent> events;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ExportedDivisionToJson(this);
}
