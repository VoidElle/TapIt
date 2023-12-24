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
      order: json['order'] as int,
    );

Map<String, dynamic> _$$_GameOnlineSocketModelToJson(
        _$_GameOnlineSocketModel instance) =>
    <String, dynamic>{
      'socketId': instance.socketId,
      'isLeader': instance.isLeader,
      'order': instance.order,
    };
