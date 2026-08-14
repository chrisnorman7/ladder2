// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exported_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExportedGame _$ExportedGameFromJson(Map<String, dynamic> json) => ExportedGame(
  game: json['game'] as Map<String, dynamic>,
  sets: (json['sets'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$ExportedGameToJson(ExportedGame instance) =>
    <String, dynamic>{'game': instance.game, 'sets': instance.sets};
