// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_online_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameOnlineGameModel _$GameOnlineGameModelFromJson(Map<String, dynamic> json) =>
    GameOnlineGameModel(
      lobbyId: json['lobbyId'] as String,
      players: (json['players'] as List<dynamic>?)
              ?.map((e) =>
                  GameOnlinePlayerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GameOnlinePlayerModel>[],
    );

Map<String, dynamic> _$GameOnlineGameModelToJson(
        GameOnlineGameModel instance) =>
    <String, dynamic>{
      'lobbyId': instance.lobbyId,
      'players': instance.players.map((e) => e.toJson()).toList(),
    };
