// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_socket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GlobalSocketModel {
  socket_io.Socket? get socket => throw _privateConstructorUsedError;
  set socket(socket_io.Socket? value) => throw _privateConstructorUsedError;
  GameOnlineSocketStatus get gameOnlineSocketStatus =>
      throw _privateConstructorUsedError;
  set gameOnlineSocketStatus(GameOnlineSocketStatus value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalSocketModelCopyWith<GlobalSocketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSocketModelCopyWith<$Res> {
  factory $GlobalSocketModelCopyWith(
          GlobalSocketModel value, $Res Function(GlobalSocketModel) then) =
      _$GlobalSocketModelCopyWithImpl<$Res, GlobalSocketModel>;
  @useResult
  $Res call(
      {socket_io.Socket? socket,
      GameOnlineSocketStatus gameOnlineSocketStatus});
}

/// @nodoc
class _$GlobalSocketModelCopyWithImpl<$Res, $Val extends GlobalSocketModel>
    implements $GlobalSocketModelCopyWith<$Res> {
  _$GlobalSocketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socket = freezed,
    Object? gameOnlineSocketStatus = null,
  }) {
    return _then(_value.copyWith(
      socket: freezed == socket
          ? _value.socket
          : socket // ignore: cast_nullable_to_non_nullable
              as socket_io.Socket?,
      gameOnlineSocketStatus: null == gameOnlineSocketStatus
          ? _value.gameOnlineSocketStatus
          : gameOnlineSocketStatus // ignore: cast_nullable_to_non_nullable
              as GameOnlineSocketStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GlobalSocketModelCopyWith<$Res>
    implements $GlobalSocketModelCopyWith<$Res> {
  factory _$$_GlobalSocketModelCopyWith(_$_GlobalSocketModel value,
          $Res Function(_$_GlobalSocketModel) then) =
      __$$_GlobalSocketModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {socket_io.Socket? socket,
      GameOnlineSocketStatus gameOnlineSocketStatus});
}

/// @nodoc
class __$$_GlobalSocketModelCopyWithImpl<$Res>
    extends _$GlobalSocketModelCopyWithImpl<$Res, _$_GlobalSocketModel>
    implements _$$_GlobalSocketModelCopyWith<$Res> {
  __$$_GlobalSocketModelCopyWithImpl(
      _$_GlobalSocketModel _value, $Res Function(_$_GlobalSocketModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socket = freezed,
    Object? gameOnlineSocketStatus = null,
  }) {
    return _then(_$_GlobalSocketModel(
      socket: freezed == socket
          ? _value.socket
          : socket // ignore: cast_nullable_to_non_nullable
              as socket_io.Socket?,
      gameOnlineSocketStatus: null == gameOnlineSocketStatus
          ? _value.gameOnlineSocketStatus
          : gameOnlineSocketStatus // ignore: cast_nullable_to_non_nullable
              as GameOnlineSocketStatus,
    ));
  }
}

/// @nodoc

class _$_GlobalSocketModel extends _GlobalSocketModel {
  _$_GlobalSocketModel(
      {this.socket = null,
      this.gameOnlineSocketStatus = GameOnlineSocketStatus.toInit})
      : super._();

  @override
  @JsonKey()
  socket_io.Socket? socket;
  @override
  @JsonKey()
  GameOnlineSocketStatus gameOnlineSocketStatus;

  @override
  String toString() {
    return 'GlobalSocketModel(socket: $socket, gameOnlineSocketStatus: $gameOnlineSocketStatus)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalSocketModelCopyWith<_$_GlobalSocketModel> get copyWith =>
      __$$_GlobalSocketModelCopyWithImpl<_$_GlobalSocketModel>(
          this, _$identity);
}

abstract class _GlobalSocketModel extends GlobalSocketModel {
  factory _GlobalSocketModel(
      {socket_io.Socket? socket,
      GameOnlineSocketStatus gameOnlineSocketStatus}) = _$_GlobalSocketModel;
  _GlobalSocketModel._() : super._();

  @override
  socket_io.Socket? get socket;
  set socket(socket_io.Socket? value);
  @override
  GameOnlineSocketStatus get gameOnlineSocketStatus;
  set gameOnlineSocketStatus(GameOnlineSocketStatus value);
  @override
  @JsonKey(ignore: true)
  _$$_GlobalSocketModelCopyWith<_$_GlobalSocketModel> get copyWith =>
      throw _privateConstructorUsedError;
}
