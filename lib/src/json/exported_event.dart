import 'package:json_annotation/json_annotation.dart';
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

  /// The games in this event.
  final List<ExportedGame> games;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ExportedEventToJson(this);
}
