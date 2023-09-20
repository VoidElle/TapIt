// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_local_player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameLocalPlayerModel _$$_GameLocalPlayerModelFromJson(
        Map<String, dynamic> json) =>
    _$_GameLocalPlayerModel(
      colorValue: json['colorValue'] as int,
      percentageValue: json['percentageValue'] as int? ?? 50,
      readyStatus: json['readyStatus'] as bool? ?? false,
    );

Map<String, dynamic> _$$_GameLocalPlayerModelToJson(
        _$_GameLocalPlayerModel instance) =>
    <String, dynamic>{
      'colorValue': instance.colorValue,
      'percentageValue': instance.percentageValue,
      'readyStatus': instance.readyStatus,
    };
