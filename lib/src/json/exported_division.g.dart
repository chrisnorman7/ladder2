// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exported_division.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExportedDivision _$ExportedDivisionFromJson(Map<String, dynamic> json) =>
    ExportedDivision(
      division: json['division'] as Map<String, dynamic>,
      players: (json['players'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      events: (json['events'] as List<dynamic>)
          .map((e) => ExportedEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExportedDivisionToJson(ExportedDivision instance) =>
    <String, dynamic>{
      'division': instance.division,
      'players': instance.players,
      'events': instance.events,
    };
