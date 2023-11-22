import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tapit/game/online/models/player/game_online_player_model.dart';

part 'game_online_game_model.freezed.dart';
part 'game_online_game_model.g.dart';

@unfreezed
class GameOnlineGameModel with _$GameOnlineGameModel {

  GameOnlineGameModel._();

  factory GameOnlineGameModel({
    required String lobbyId,
    @Default([]) List<GameOnlinePlayerModel> players,
  }) = _GameOnlineGameModel;

  factory GameOnlineGameModel.fromJson(Map<String, Object?> json) => _$GameOnlineGameModelFromJson(json);

}