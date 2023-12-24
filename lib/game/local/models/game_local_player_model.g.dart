// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_local_player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameLocalPlayerModel _$GameLocalPlayerModelFromJson(
        Map<String, dynamic> json) =>
    GameLocalPlayerModel(
      colorValue: json['colorValue'] as int,
      percentageValue: json['percentageValue'] as int? ?? 50,
      readyStatus: json['readyStatus'] as bool? ?? false,
    );

Map<String, dynamic> _$GameLocalPlayerModelToJson(
        GameLocalPlayerModel instance) =>
    <String, dynamic>{
      'colorValue': instance.colorValue,
      'percentageValue': instance.percentageValue,
      'readyStatus': instance.readyStatus,
    };
