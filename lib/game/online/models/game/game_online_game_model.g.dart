// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_online_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameOnlineGameModel _$$_GameOnlineGameModelFromJson(
        Map<String, dynamic> json) =>
    _$_GameOnlineGameModel(
      lobbyId: json['lobbyId'] as String,
      sockets: (json['sockets'] as List<dynamic>?)
              ?.map((e) =>
                  GameOnlineSocketModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_GameOnlineGameModelToJson(
        _$_GameOnlineGameModel instance) =>
    <String, dynamic>{
      'lobbyId': instance.lobbyId,
      'sockets': instance.sockets,
    };
