// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_online_game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameOnlineGameModel _$GameOnlineGameModelFromJson(Map<String, dynamic> json) {
  return _GameOnlineGameModel.fromJson(json);
}

/// @nodoc
mixin _$GameOnlineGameModel {
  String get lobbyId => throw _privateConstructorUsedError;
  set lobbyId(String value) => throw _privateConstructorUsedError;
  List<GameOnlineSocketModel> get sockets => throw _privateConstructorUsedError;
  set sockets(List<GameOnlineSocketModel> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameOnlineGameModelCopyWith<GameOnlineGameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameOnlineGameModelCopyWith<$Res> {
  factory $GameOnlineGameModelCopyWith(
          GameOnlineGameModel value, $Res Function(GameOnlineGameModel) then) =
      _$GameOnlineGameModelCopyWithImpl<$Res, GameOnlineGameModel>;
  @useResult
  $Res call({String lobbyId, List<GameOnlineSocketModel> sockets});
}

/// @nodoc
class _$GameOnlineGameModelCopyWithImpl<$Res, $Val extends GameOnlineGameModel>
    implements $GameOnlineGameModelCopyWith<$Res> {
  _$GameOnlineGameModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_GameOnlineGameModelCopyWith<$Res>
    implements $GameOnlineGameModelCopyWith<$Res> {
  factory _$$_GameOnlineGameModelCopyWith(_$_GameOnlineGameModel value,
          $Res Function(_$_GameOnlineGameModel) then) =
      __$$_GameOnlineGameModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lobbyId, List<GameOnlineSocketModel> sockets});
}

/// @nodoc
class __$$_GameOnlineGameModelCopyWithImpl<$Res>
    extends _$GameOnlineGameModelCopyWithImpl<$Res, _$_GameOnlineGameModel>
    implements _$$_GameOnlineGameModelCopyWith<$Res> {
  __$$_GameOnlineGameModelCopyWithImpl(_$_GameOnlineGameModel _value,
      $Res Function(_$_GameOnlineGameModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lobbyId = null,
    Object? sockets = null,
  }) {
    return _then(_$_GameOnlineGameModel(
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
class _$_GameOnlineGameModel extends _GameOnlineGameModel {
  _$_GameOnlineGameModel({required this.lobbyId, this.sockets = const []})
      : super._();

  factory _$_GameOnlineGameModel.fromJson(Map<String, dynamic> json) =>
      _$$_GameOnlineGameModelFromJson(json);

  @override
  String lobbyId;
  @override
  @JsonKey()
  List<GameOnlineSocketModel> sockets;

  @override
  String toString() {
    return 'GameOnlineGameModel(lobbyId: $lobbyId, sockets: $sockets)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameOnlineGameModelCopyWith<_$_GameOnlineGameModel> get copyWith =>
      __$$_GameOnlineGameModelCopyWithImpl<_$_GameOnlineGameModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameOnlineGameModelToJson(
      this,
    );
  }
}

abstract class _GameOnlineGameModel extends GameOnlineGameModel {
  factory _GameOnlineGameModel(
      {required String lobbyId,
      List<GameOnlineSocketModel> sockets}) = _$_GameOnlineGameModel;
  _GameOnlineGameModel._() : super._();

  factory _GameOnlineGameModel.fromJson(Map<String, dynamic> json) =
      _$_GameOnlineGameModel.fromJson;

  @override
  String get lobbyId;
  set lobbyId(String value);
  @override
  List<GameOnlineSocketModel> get sockets;
  set sockets(List<GameOnlineSocketModel> value);
  @override
  @JsonKey(ignore: true)
  _$$_GameOnlineGameModelCopyWith<_$_GameOnlineGameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
