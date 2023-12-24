import 'package:json_annotation/json_annotation.dart';

import '../socket/game_online_socket_model.dart';

part 'game_online_player_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GameOnlinePlayerModel {

  final GameOnlineSocketModel gameOnlineSocketModel;
  final int colorValue;

  int percentageValue;
  bool readyStatus;

  GameOnlinePlayerModel({
    required this.gameOnlineSocketModel,
    required this.colorValue,
    this.percentageValue = 50,
    this.readyStatus = false,
  });

  factory GameOnlinePlayerModel.fromJson(Map<String, dynamic> json) => _$GameOnlinePlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameOnlinePlayerModelToJson(this);

}