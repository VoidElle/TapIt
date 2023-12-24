import 'package:json_annotation/json_annotation.dart';

import '../player/game_online_player_model.dart';

part 'game_online_game_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GameOnlineGameModel {

  final String lobbyId;

  List<GameOnlinePlayerModel> players;

  GameOnlineGameModel({
    required this.lobbyId,
    this.players = const <GameOnlinePlayerModel>[],
  });

  factory GameOnlineGameModel.fromJson(Map<String, dynamic> json) => _$GameOnlineGameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameOnlineGameModelToJson(this);

}