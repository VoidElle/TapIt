// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_online_socket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameOnlineSocketModel _$$_GameOnlineSocketModelFromJson(
        Map<String, dynamic> json) =>
    _$_GameOnlineSocketModel(
      socketId: json['socketId'] as String,
      isLeader: json['isLeader'] as bool,
      readyStatus: json['readyStatus'] as bool? ?? false,
    );

Map<String, dynamic> _$$_GameOnlineSocketModelToJson(
        _$_GameOnlineSocketModel instance) =>
    <String, dynamic>{
      'socketId': instance.socketId,
      'isLeader': instance.isLeader,
      'readyStatus': instance.readyStatus,
    };
