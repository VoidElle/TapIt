import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_online_socket_model.g.dart';

@JsonSerializable()
@immutable
class GameOnlineSocketModel {

  final String socketId;
  final bool isLeader;
  final int order;

  const GameOnlineSocketModel({
    required this.socketId,
    required this.isLeader,
    required this.order,
  });

  factory GameOnlineSocketModel.fromJson(Map<String, dynamic> json) => _$GameOnlineSocketModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameOnlineSocketModelToJson(this);

}