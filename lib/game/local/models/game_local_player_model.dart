import 'package:json_annotation/json_annotation.dart';

part 'game_local_player_model.g.dart';

@JsonSerializable()
class GameLocalPlayerModel {

  final int colorValue;

  int percentageValue;
  bool readyStatus;

  GameLocalPlayerModel({
    required this.colorValue,
    this.percentageValue = 50,
    this.readyStatus = false,
  });

  factory GameLocalPlayerModel.fromJson(Map<String, dynamic> json) => _$GameLocalPlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameLocalPlayerModelToJson(this);

  void resetState() {
    percentageValue = 50;
    readyStatus = false;
  }

}