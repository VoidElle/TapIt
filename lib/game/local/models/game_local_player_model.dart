import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_local_player_model.freezed.dart';
part 'game_local_player_model.g.dart';

@unfreezed
class GameLocalPlayerModel with _$GameLocalPlayerModel {

  factory GameLocalPlayerModel({
    required int colorValue,
    @Default(50) int percentageValue,
    @Default(false) bool readyStatus,
  }) = _GameLocalPlayerModel;

  factory GameLocalPlayerModel.fromJson(Map<String, Object?> json) => _$GameLocalPlayerModelFromJson(json);

}