// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedOptionsModel {
  bool get useDefault => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  MaterialSample get sample => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedOptionsModelCopyWith<FeedOptionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedOptionsModelCopyWith<$Res> {
  factory $FeedOptionsModelCopyWith(
          FeedOptionsModel value, $Res Function(FeedOptionsModel) then) =
      _$FeedOptionsModelCopyWithImpl<$Res, FeedOptionsModel>;
  @useResult
  $Res call({bool useDefault, double weight, MaterialSample sample});

  $MaterialSampleCopyWith<$Res> get sample;
}

/// @nodoc
class _$FeedOptionsModelCopyWithImpl<$Res, $Val extends FeedOptionsModel>
    implements $FeedOptionsModelCopyWith<$Res> {
  _$FeedOptionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useDefault = null,
    Object? weight = null,
    Object? sample = null,
  }) {
    return _then(_value.copyWith(
      useDefault: null == useDefault
          ? _value.useDefault
          : useDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      sample: null == sample
          ? _value.sample
          : sample // ignore: cast_nullable_to_non_nullable
              as MaterialSample,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialSampleCopyWith<$Res> get sample {
    return $MaterialSampleCopyWith<$Res>(_value.sample, (value) {
      return _then(_value.copyWith(sample: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeedOptionsModelCopyWith<$Res>
    implements $FeedOptionsModelCopyWith<$Res> {
  factory _$$_FeedOptionsModelCopyWith(
          _$_FeedOptionsModel value, $Res Function(_$_FeedOptionsModel) then) =
      __$$_FeedOptionsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool useDefault, double weight, MaterialSample sample});

  @override
  $MaterialSampleCopyWith<$Res> get sample;
}

/// @nodoc
class __$$_FeedOptionsModelCopyWithImpl<$Res>
    extends _$FeedOptionsModelCopyWithImpl<$Res, _$_FeedOptionsModel>
    implements _$$_FeedOptionsModelCopyWith<$Res> {
  __$$_FeedOptionsModelCopyWithImpl(
      _$_FeedOptionsModel _value, $Res Function(_$_FeedOptionsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useDefault = null,
    Object? weight = null,
    Object? sample = null,
  }) {
    return _then(_$_FeedOptionsModel(
      useDefault: null == useDefault
          ? _value.useDefault
          : useDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      sample: null == sample
          ? _value.sample
          : sample // ignore: cast_nullable_to_non_nullable
              as MaterialSample,
    ));
  }
}

/// @nodoc

class _$_FeedOptionsModel implements _FeedOptionsModel {
  const _$_FeedOptionsModel(
      {this.useDefault = false, required this.weight, required this.sample});

  @override
  @JsonKey()
  final bool useDefault;
  @override
  final double weight;
  @override
  final MaterialSample sample;

  @override
  String toString() {
    return 'FeedOptionsModel(useDefault: $useDefault, weight: $weight, sample: $sample)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedOptionsModel &&
            (identical(other.useDefault, useDefault) ||
                other.useDefault == useDefault) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.sample, sample) || other.sample == sample));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useDefault, weight, sample);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedOptionsModelCopyWith<_$_FeedOptionsModel> get copyWith =>
      __$$_FeedOptionsModelCopyWithImpl<_$_FeedOptionsModel>(this, _$identity);
}

abstract class _FeedOptionsModel implements FeedOptionsModel {
  const factory _FeedOptionsModel(
      {final bool useDefault,
      required final double weight,
      required final MaterialSample sample}) = _$_FeedOptionsModel;

  @override
  bool get useDefault;
  @override
  double get weight;
  @override
  MaterialSample get sample;
  @override
  @JsonKey(ignore: true)
  _$$_FeedOptionsModelCopyWith<_$_FeedOptionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
