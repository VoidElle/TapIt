// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_online_lobby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameOnlineLobbyModel _$$_GameOnlineLobbyModelFromJson(
        Map<String, dynamic> json) =>
    _$_GameOnlineLobbyModel(
      lobbyId: json['lobbyId'] as String,
      sockets: (json['sockets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_GameOnlineLobbyModelToJson(
        _$_GameOnlineLobbyModel instance) =>
    <String, dynamic>{
      'lobbyId': instance.lobbyId,
      'sockets': instance.sockets,
    };
