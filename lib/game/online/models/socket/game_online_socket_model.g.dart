// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_online_socket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameOnlineSocketModel _$GameOnlineSocketModelFromJson(
        Map<String, dynamic> json) =>
    GameOnlineSocketModel(
      socketId: json['socketId'] as String,
      isLeader: json['isLeader'] as bool,
      order: json['order'] as int,
    );

Map<String, dynamic> _$GameOnlineSocketModelToJson(
        GameOnlineSocketModel instance) =>
    <String, dynamic>{
      'socketId': instance.socketId,
      'isLeader': instance.isLeader,
      'order': instance.order,
    };
