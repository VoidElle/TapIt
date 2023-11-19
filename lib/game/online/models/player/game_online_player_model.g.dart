// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_online_player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameOnlinePlayerModel _$$_GameOnlinePlayerModelFromJson(
        Map<String, dynamic> json) =>
    _$_GameOnlinePlayerModel(
      gameOnlineSocketModel: GameOnlineSocketModel.fromJson(
          json['gameOnlineSocketModel'] as Map<String, dynamic>),
      colorValue: json['colorValue'] as int,
      percentageValue: json['percentageValue'] as int? ?? 50,
      readyStatus: json['readyStatus'] as bool? ?? false,
    );

Map<String, dynamic> _$$_GameOnlinePlayerModelToJson(
        _$_GameOnlinePlayerModel instance) =>
    <String, dynamic>{
      'gameOnlineSocketModel': instance.gameOnlineSocketModel,
      'colorValue': instance.colorValue,
      'percentageValue': instance.percentageValue,
      'readyStatus': instance.readyStatus,
    };
