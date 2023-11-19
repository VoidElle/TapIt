import 'package:freezed_annotation/freezed_annotation.dart';

import '../socket/game_online_socket_model.dart';

part 'game_online_game_model.freezed.dart';
part 'game_online_game_model.g.dart';

@unfreezed
class GameOnlineGameModel with _$GameOnlineGameModel {

  GameOnlineGameModel._();

  factory GameOnlineGameModel({
    required String lobbyId,
    @Default([]) List<GameOnlineSocketModel> sockets,
  }) = _GameOnlineGameModel;

  factory GameOnlineGameModel.fromJson(Map<String, Object?> json) => _$GameOnlineGameModelFromJson(json);


}