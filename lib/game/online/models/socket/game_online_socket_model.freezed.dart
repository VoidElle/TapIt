// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_online_socket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameOnlineSocketModel _$GameOnlineSocketModelFromJson(
    Map<String, dynamic> json) {
  return _GameOnlineSocketModel.fromJson(json);
}

/// @nodoc
mixin _$GameOnlineSocketModel {
  String get socketId => throw _privateConstructorUsedError;
  set socketId(String value) => throw _privateConstructorUsedError;
  bool get isLeader => throw _privateConstructorUsedError;
  set isLeader(bool value) => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  set order(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameOnlineSocketModelCopyWith<GameOnlineSocketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameOnlineSocketModelCopyWith<$Res> {
  factory $GameOnlineSocketModelCopyWith(GameOnlineSocketModel value,
          $Res Function(GameOnlineSocketModel) then) =
      _$GameOnlineSocketModelCopyWithImpl<$Res, GameOnlineSocketModel>;
  @useResult
  $Res call({String socketId, bool isLeader, int order});
}

/// @nodoc
class _$GameOnlineSocketModelCopyWithImpl<$Res,
        $Val extends GameOnlineSocketModel>
    implements $GameOnlineSocketModelCopyWith<$Res> {
  _$GameOnlineSocketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socketId = null,
    Object? isLeader = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      socketId: null == socketId
          ? _value.socketId
          : socketId // ignore: cast_nullable_to_non_nullable
              as String,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameOnlineSocketModelCopyWith<$Res>
    implements $GameOnlineSocketModelCopyWith<$Res> {
  factory _$$_GameOnlineSocketModelCopyWith(_$_GameOnlineSocketModel value,
          $Res Function(_$_GameOnlineSocketModel) then) =
      __$$_GameOnlineSocketModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String socketId, bool isLeader, int order});
}

/// @nodoc
class __$$_GameOnlineSocketModelCopyWithImpl<$Res>
    extends _$GameOnlineSocketModelCopyWithImpl<$Res, _$_GameOnlineSocketModel>
    implements _$$_GameOnlineSocketModelCopyWith<$Res> {
  __$$_GameOnlineSocketModelCopyWithImpl(_$_GameOnlineSocketModel _value,
      $Res Function(_$_GameOnlineSocketModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socketId = null,
    Object? isLeader = null,
    Object? order = null,
  }) {
    return _then(_$_GameOnlineSocketModel(
      socketId: null == socketId
          ? _value.socketId
          : socketId // ignore: cast_nullable_to_non_nullable
              as String,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameOnlineSocketModel extends _GameOnlineSocketModel {
  _$_GameOnlineSocketModel(
      {required this.socketId, required this.isLeader, required this.order})
      : super._();

  factory _$_GameOnlineSocketModel.fromJson(Map<String, dynamic> json) =>
      _$$_GameOnlineSocketModelFromJson(json);

  @override
  String socketId;
  @override
  bool isLeader;
  @override
  int order;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameOnlineSocketModelCopyWith<_$_GameOnlineSocketModel> get copyWith =>
      __$$_GameOnlineSocketModelCopyWithImpl<_$_GameOnlineSocketModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameOnlineSocketModelToJson(
      this,
    );
  }
}

abstract class _GameOnlineSocketModel extends GameOnlineSocketModel {
  factory _GameOnlineSocketModel(
      {required String socketId,
      required bool isLeader,
      required int order}) = _$_GameOnlineSocketModel;
  _GameOnlineSocketModel._() : super._();

  factory _GameOnlineSocketModel.fromJson(Map<String, dynamic> json) =
      _$_GameOnlineSocketModel.fromJson;

  @override
  String get socketId;
  set socketId(String value);
  @override
  bool get isLeader;
  set isLeader(bool value);
  @override
  int get order;
  set order(int value);
  @override
  @JsonKey(ignore: true)
  _$$_GameOnlineSocketModelCopyWith<_$_GameOnlineSocketModel> get copyWith =>
      throw _privateConstructorUsedError;
}
