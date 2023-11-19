import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'game_online_socket_model.freezed.dart';
part 'game_online_socket_model.g.dart';

@unfreezed
class GameOnlineSocketModel extends Equatable with _$GameOnlineSocketModel {

  GameOnlineSocketModel._();

  factory GameOnlineSocketModel({
    required String socketId,
    required bool isLeader,
    @Default(false) bool readyStatus,
  }) = _GameOnlineSocketModel;

  factory GameOnlineSocketModel.fromJson(Map<String, Object?> json) => _$GameOnlineSocketModelFromJson(json);

  @override
  List<Object?> get props => [
    socketId,
  ];

}