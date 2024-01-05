// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bmi_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BmiData {
// 身長
  double get height => throw _privateConstructorUsedError; // 体重
  double get weight => throw _privateConstructorUsedError; // 結果(BMI)
  double get result => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BmiDataCopyWith<BmiData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BmiDataCopyWith<$Res> {
  factory $BmiDataCopyWith(BmiData value, $Res Function(BmiData) then) =
      _$BmiDataCopyWithImpl<$Res, BmiData>;
  @useResult
  $Res call({double height, double weight, double result});
}

/// @nodoc
class _$BmiDataCopyWithImpl<$Res, $Val extends BmiData>
    implements $BmiDataCopyWith<$Res> {
  _$BmiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BmiDataCopyWith<$Res> implements $BmiDataCopyWith<$Res> {
  factory _$$_BmiDataCopyWith(
          _$_BmiData value, $Res Function(_$_BmiData) then) =
      __$$_BmiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double height, double weight, double result});
}

/// @nodoc
class __$$_BmiDataCopyWithImpl<$Res>
    extends _$BmiDataCopyWithImpl<$Res, _$_BmiData>
    implements _$$_BmiDataCopyWith<$Res> {
  __$$_BmiDataCopyWithImpl(_$_BmiData _value, $Res Function(_$_BmiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? result = null,
  }) {
    return _then(_$_BmiData(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_BmiData implements _BmiData {
  const _$_BmiData(
      {required this.height, required this.weight, required this.result});

// 身長
  @override
  final double height;
// 体重
  @override
  final double weight;
// 結果(BMI)
  @override
  final double result;

  @override
  String toString() {
    return 'BmiData(height: $height, weight: $weight, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BmiData &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, height, weight, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BmiDataCopyWith<_$_BmiData> get copyWith =>
      __$$_BmiDataCopyWithImpl<_$_BmiData>(this, _$identity);
}

abstract class _BmiData implements BmiData {
  const factory _BmiData(
      {required final double height,
      required final double weight,
      required final double result}) = _$_BmiData;

  @override // 身長
  double get height;
  @override // 体重
  double get weight;
  @override // 結果(BMI)
  double get result;
  @override
  @JsonKey(ignore: true)
  _$$_BmiDataCopyWith<_$_BmiData> get copyWith =>
      throw _privateConstructorUsedError;
}
