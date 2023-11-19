import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:tapit/game/online/models/socket/game_online_socket_model.dart';

part 'game_online_player_model.freezed.dart';
part 'game_online_player_model.g.dart';

@unfreezed
class GameOnlinePlayerModel with _$GameOnlinePlayerModel {

  GameOnlinePlayerModel._();

  factory GameOnlinePlayerModel({
    required GameOnlineSocketModel gameOnlineSocketModel,
    required int colorValue,
    @Default(50) int percentageValue,
    @Default(false) bool readyStatus,
  }) = _GameOnlinePlayerModel;

  factory GameOnlinePlayerModel.fromJson(Map<String, Object?> json) => _$GameOnlinePlayerModelFromJson(json);

}