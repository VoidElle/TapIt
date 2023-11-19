// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_online_player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameOnlinePlayerModel _$GameOnlinePlayerModelFromJson(
    Map<String, dynamic> json) {
  return _GameOnlinePlayerModel.fromJson(json);
}

/// @nodoc
mixin _$GameOnlinePlayerModel {
  GameOnlineSocketModel get gameOnlineSocketModel =>
      throw _privateConstructorUsedError;
  set gameOnlineSocketModel(GameOnlineSocketModel value) =>
      throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;
  set colorValue(int value) => throw _privateConstructorUsedError;
  int get percentageValue => throw _privateConstructorUsedError;
  set percentageValue(int value) => throw _privateConstructorUsedError;
  bool get readyStatus => throw _privateConstructorUsedError;
  set readyStatus(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameOnlinePlayerModelCopyWith<GameOnlinePlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameOnlinePlayerModelCopyWith<$Res> {
  factory $GameOnlinePlayerModelCopyWith(GameOnlinePlayerModel value,
          $Res Function(GameOnlinePlayerModel) then) =
      _$GameOnlinePlayerModelCopyWithImpl<$Res, GameOnlinePlayerModel>;
  @useResult
  $Res call(
      {GameOnlineSocketModel gameOnlineSocketModel,
      int colorValue,
      int percentageValue,
      bool readyStatus});

  $GameOnlineSocketModelCopyWith<$Res> get gameOnlineSocketModel;
}

/// @nodoc
class _$GameOnlinePlayerModelCopyWithImpl<$Res,
        $Val extends GameOnlinePlayerModel>
    implements $GameOnlinePlayerModelCopyWith<$Res> {
  _$GameOnlinePlayerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameOnlineSocketModel = null,
    Object? colorValue = null,
    Object? percentageValue = null,
    Object? readyStatus = null,
  }) {
    return _then(_value.copyWith(
      gameOnlineSocketModel: null == gameOnlineSocketModel
          ? _value.gameOnlineSocketModel
          : gameOnlineSocketModel // ignore: cast_nullable_to_non_nullable
              as GameOnlineSocketModel,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
      percentageValue: null == percentageValue
          ? _value.percentageValue
          : percentageValue // ignore: cast_nullable_to_non_nullable
              as int,
      readyStatus: null == readyStatus
          ? _value.readyStatus
          : readyStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameOnlineSocketModelCopyWith<$Res> get gameOnlineSocketModel {
    return $GameOnlineSocketModelCopyWith<$Res>(_value.gameOnlineSocketModel,
        (value) {
      return _then(_value.copyWith(gameOnlineSocketModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameOnlinePlayerModelCopyWith<$Res>
    implements $GameOnlinePlayerModelCopyWith<$Res> {
  factory _$$_GameOnlinePlayerModelCopyWith(_$_GameOnlinePlayerModel value,
          $Res Function(_$_GameOnlinePlayerModel) then) =
      __$$_GameOnlinePlayerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GameOnlineSocketModel gameOnlineSocketModel,
      int colorValue,
      int percentageValue,
      bool readyStatus});

  @override
  $GameOnlineSocketModelCopyWith<$Res> get gameOnlineSocketModel;
}

/// @nodoc
class __$$_GameOnlinePlayerModelCopyWithImpl<$Res>
    extends _$GameOnlinePlayerModelCopyWithImpl<$Res, _$_GameOnlinePlayerModel>
    implements _$$_GameOnlinePlayerModelCopyWith<$Res> {
  __$$_GameOnlinePlayerModelCopyWithImpl(_$_GameOnlinePlayerModel _value,
      $Res Function(_$_GameOnlinePlayerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameOnlineSocketModel = null,
    Object? colorValue = null,
    Object? percentageValue = null,
    Object? readyStatus = null,
  }) {
    return _then(_$_GameOnlinePlayerModel(
      gameOnlineSocketModel: null == gameOnlineSocketModel
          ? _value.gameOnlineSocketModel
          : gameOnlineSocketModel // ignore: cast_nullable_to_non_nullable
              as GameOnlineSocketModel,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
      percentageValue: null == percentageValue
          ? _value.percentageValue
          : percentageValue // ignore: cast_nullable_to_non_nullable
              as int,
      readyStatus: null == readyStatus
          ? _value.readyStatus
          : readyStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameOnlinePlayerModel extends _GameOnlinePlayerModel {
  _$_GameOnlinePlayerModel(
      {required this.gameOnlineSocketModel,
      required this.colorValue,
      this.percentageValue = 50,
      this.readyStatus = false})
      : super._();

  factory _$_GameOnlinePlayerModel.fromJson(Map<String, dynamic> json) =>
      _$$_GameOnlinePlayerModelFromJson(json);

  @override
  GameOnlineSocketModel gameOnlineSocketModel;
  @override
  int colorValue;
  @override
  @JsonKey()
  int percentageValue;
  @override
  @JsonKey()
  bool readyStatus;

  @override
  String toString() {
    return 'GameOnlinePlayerModel(gameOnlineSocketModel: $gameOnlineSocketModel, colorValue: $colorValue, percentageValue: $percentageValue, readyStatus: $readyStatus)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameOnlinePlayerModelCopyWith<_$_GameOnlinePlayerModel> get copyWith =>
      __$$_GameOnlinePlayerModelCopyWithImpl<_$_GameOnlinePlayerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameOnlinePlayerModelToJson(
      this,
    );
  }
}

abstract class _GameOnlinePlayerModel extends GameOnlinePlayerModel {
  factory _GameOnlinePlayerModel(
      {required GameOnlineSocketModel gameOnlineSocketModel,
      required int colorValue,
      int percentageValue,
      bool readyStatus}) = _$_GameOnlinePlayerModel;
  _GameOnlinePlayerModel._() : super._();

  factory _GameOnlinePlayerModel.fromJson(Map<String, dynamic> json) =
      _$_GameOnlinePlayerModel.fromJson;

  @override
  GameOnlineSocketModel get gameOnlineSocketModel;
  set gameOnlineSocketModel(GameOnlineSocketModel value);
  @override
  int get colorValue;
  set colorValue(int value);
  @override
  int get percentageValue;
  set percentageValue(int value);
  @override
  bool get readyStatus;
  set readyStatus(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_GameOnlinePlayerModelCopyWith<_$_GameOnlinePlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
