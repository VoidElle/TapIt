// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_online_lobby_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameOnlineLobbyModel _$GameOnlineLobbyModelFromJson(Map<String, dynamic> json) {
  return _GameOnlineLobbyModel.fromJson(json);
}

/// @nodoc
mixin _$GameOnlineLobbyModel {
  String get lobbyId => throw _privateConstructorUsedError;
  set lobbyId(String value) => throw _privateConstructorUsedError;
  List<GameOnlineSocketModel> get sockets => throw _privateConstructorUsedError;
  set sockets(List<GameOnlineSocketModel> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameOnlineLobbyModelCopyWith<GameOnlineLobbyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameOnlineLobbyModelCopyWith<$Res> {
  factory $GameOnlineLobbyModelCopyWith(GameOnlineLobbyModel value,
          $Res Function(GameOnlineLobbyModel) then) =
      _$GameOnlineLobbyModelCopyWithImpl<$Res, GameOnlineLobbyModel>;
  @useResult
  $Res call({String lobbyId, List<GameOnlineSocketModel> sockets});
}

/// @nodoc
class _$GameOnlineLobbyModelCopyWithImpl<$Res,
        $Val extends GameOnlineLobbyModel>
    implements $GameOnlineLobbyModelCopyWith<$Res> {
  _$GameOnlineLobbyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lobbyId = null,
    Object? sockets = null,
  }) {
    return _then(_value.copyWith(
      lobbyId: null == lobbyId
          ? _value.lobbyId
          : lobbyId // ignore: cast_nullable_to_non_nullable
              as String,
      sockets: null == sockets
          ? _value.sockets
          : sockets // ignore: cast_nullable_to_non_nullable
              as List<GameOnlineSocketModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameOnlineLobbyModelCopyWith<$Res>
    implements $GameOnlineLobbyModelCopyWith<$Res> {
  factory _$$_GameOnlineLobbyModelCopyWith(_$_GameOnlineLobbyModel value,
          $Res Function(_$_GameOnlineLobbyModel) then) =
      __$$_GameOnlineLobbyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lobbyId, List<GameOnlineSocketModel> sockets});
}

/// @nodoc
class __$$_GameOnlineLobbyModelCopyWithImpl<$Res>
    extends _$GameOnlineLobbyModelCopyWithImpl<$Res, _$_GameOnlineLobbyModel>
    implements _$$_GameOnlineLobbyModelCopyWith<$Res> {
  __$$_GameOnlineLobbyModelCopyWithImpl(_$_GameOnlineLobbyModel _value,
      $Res Function(_$_GameOnlineLobbyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lobbyId = null,
    Object? sockets = null,
  }) {
    return _then(_$_GameOnlineLobbyModel(
      lobbyId: null == lobbyId
          ? _value.lobbyId
          : lobbyId // ignore: cast_nullable_to_non_nullable
              as String,
      sockets: null == sockets
          ? _value.sockets
          : sockets // ignore: cast_nullable_to_non_nullable
              as List<GameOnlineSocketModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameOnlineLobbyModel extends _GameOnlineLobbyModel {
  _$_GameOnlineLobbyModel({required this.lobbyId, this.sockets = const []})
      : super._();

  factory _$_GameOnlineLobbyModel.fromJson(Map<String, dynamic> json) =>
      _$$_GameOnlineLobbyModelFromJson(json);

  @override
  String lobbyId;
  @override
  @JsonKey()
  List<GameOnlineSocketModel> sockets;

  @override
  String toString() {
    return 'GameOnlineLobbyModel(lobbyId: $lobbyId, sockets: $sockets)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameOnlineLobbyModelCopyWith<_$_GameOnlineLobbyModel> get copyWith =>
      __$$_GameOnlineLobbyModelCopyWithImpl<_$_GameOnlineLobbyModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameOnlineLobbyModelToJson(
      this,
    );
  }
}

abstract class _GameOnlineLobbyModel extends GameOnlineLobbyModel {
  factory _GameOnlineLobbyModel(
      {required String lobbyId,
      List<GameOnlineSocketModel> sockets}) = _$_GameOnlineLobbyModel;
  _GameOnlineLobbyModel._() : super._();

  factory _GameOnlineLobbyModel.fromJson(Map<String, dynamic> json) =
      _$_GameOnlineLobbyModel.fromJson;

  @override
  String get lobbyId;
  set lobbyId(String value);
  @override
  List<GameOnlineSocketModel> get sockets;
  set sockets(List<GameOnlineSocketModel> value);
  @override
  @JsonKey(ignore: true)
  _$$_GameOnlineLobbyModelCopyWith<_$_GameOnlineLobbyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
