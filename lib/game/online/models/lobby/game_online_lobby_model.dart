import 'package:freezed_annotation/freezed_annotation.dart';

import '../socket/game_online_socket_model.dart';

part 'game_online_lobby_model.freezed.dart';
part 'game_online_lobby_model.g.dart';

@unfreezed
class GameOnlineLobbyModel with _$GameOnlineLobbyModel {

  GameOnlineLobbyModel._();

  factory GameOnlineLobbyModel({
    required String lobbyId,
    @Default([]) List<GameOnlineSocketModel> sockets,
  }) = _GameOnlineLobbyModel;

  factory GameOnlineLobbyModel.fromJson(Map<String, Object?> json) => _$GameOnlineLobbyModelFromJson(json);


}