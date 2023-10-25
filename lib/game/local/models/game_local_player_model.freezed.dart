// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_local_player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameLocalPlayerModel _$GameLocalPlayerModelFromJson(Map<String, dynamic> json) {
  return _GameLocalPlayerModel.fromJson(json);
}

/// @nodoc
mixin _$GameLocalPlayerModel {
  int get colorValue => throw _privateConstructorUsedError;
  set colorValue(int value) => throw _privateConstructorUsedError;
  int get percentageValue => throw _privateConstructorUsedError;
  set percentageValue(int value) => throw _privateConstructorUsedError;
  bool get readyStatus => throw _privateConstructorUsedError;
  set readyStatus(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameLocalPlayerModelCopyWith<GameLocalPlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameLocalPlayerModelCopyWith<$Res> {
  factory $GameLocalPlayerModelCopyWith(GameLocalPlayerModel value,
          $Res Function(GameLocalPlayerModel) then) =
      _$GameLocalPlayerModelCopyWithImpl<$Res, GameLocalPlayerModel>;
  @useResult
  $Res call({int colorValue, int percentageValue, bool readyStatus});
}

/// @nodoc
class _$GameLocalPlayerModelCopyWithImpl<$Res,
        $Val extends GameLocalPlayerModel>
    implements $GameLocalPlayerModelCopyWith<$Res> {
  _$GameLocalPlayerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorValue = null,
    Object? percentageValue = null,
    Object? readyStatus = null,
  }) {
    return _then(_value.copyWith(
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
}

/// @nodoc
abstract class _$$_GameLocalPlayerModelCopyWith<$Res>
    implements $GameLocalPlayerModelCopyWith<$Res> {
  factory _$$_GameLocalPlayerModelCopyWith(_$_GameLocalPlayerModel value,
          $Res Function(_$_GameLocalPlayerModel) then) =
      __$$_GameLocalPlayerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int colorValue, int percentageValue, bool readyStatus});
}

/// @nodoc
class __$$_GameLocalPlayerModelCopyWithImpl<$Res>
    extends _$GameLocalPlayerModelCopyWithImpl<$Res, _$_GameLocalPlayerModel>
    implements _$$_GameLocalPlayerModelCopyWith<$Res> {
  __$$_GameLocalPlayerModelCopyWithImpl(_$_GameLocalPlayerModel _value,
      $Res Function(_$_GameLocalPlayerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorValue = null,
    Object? percentageValue = null,
    Object? readyStatus = null,
  }) {
    return _then(_$_GameLocalPlayerModel(
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
class _$_GameLocalPlayerModel implements _GameLocalPlayerModel {
  _$_GameLocalPlayerModel(
      {required this.colorValue,
      this.percentageValue = 50,
      this.readyStatus = false});

  factory _$_GameLocalPlayerModel.fromJson(Map<String, dynamic> json) =>
      _$$_GameLocalPlayerModelFromJson(json);

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
    return 'GameLocalPlayerModel(colorValue: $colorValue, percentageValue: $percentageValue, readyStatus: $readyStatus)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameLocalPlayerModelCopyWith<_$_GameLocalPlayerModel> get copyWith =>
      __$$_GameLocalPlayerModelCopyWithImpl<_$_GameLocalPlayerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameLocalPlayerModelToJson(
      this,
    );
  }
}

abstract class _GameLocalPlayerModel implements GameLocalPlayerModel {
  factory _GameLocalPlayerModel(
      {required int colorValue,
      int percentageValue,
      bool readyStatus}) = _$_GameLocalPlayerModel;

  factory _GameLocalPlayerModel.fromJson(Map<String, dynamic> json) =
      _$_GameLocalPlayerModel.fromJson;

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
  _$$_GameLocalPlayerModelCopyWith<_$_GameLocalPlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
