// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exported_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExportedEvent _$ExportedEventFromJson(Map<String, dynamic> json) =>
    ExportedEvent(
      event: json['event'] as Map<String, dynamic>,
      games: (json['games'] as List<dynamic>)
          .map((e) => ExportedGame.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExportedEventToJson(ExportedEvent instance) =>
    <String, dynamic>{'event': instance.event, 'games': instance.games};
