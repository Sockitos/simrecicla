// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialSample _$MaterialSampleFromJson(Map<String, dynamic> json) {
  return _MaterialSample.fromJson(json);
}

/// @nodoc
mixin _$MaterialSample {
  double get argila => throw _privateConstructorUsedError;
  double get madeira => throw _privateConstructorUsedError;
  double get ferro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialSampleCopyWith<MaterialSample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialSampleCopyWith<$Res> {
  factory $MaterialSampleCopyWith(
          MaterialSample value, $Res Function(MaterialSample) then) =
      _$MaterialSampleCopyWithImpl<$Res>;
  $Res call({double argila, double madeira, double ferro});
}

/// @nodoc
class _$MaterialSampleCopyWithImpl<$Res>
    implements $MaterialSampleCopyWith<$Res> {
  _$MaterialSampleCopyWithImpl(this._value, this._then);

  final MaterialSample _value;
  // ignore: unused_field
  final $Res Function(MaterialSample) _then;

  @override
  $Res call({
    Object? argila = freezed,
    Object? madeira = freezed,
    Object? ferro = freezed,
  }) {
    return _then(_value.copyWith(
      argila: argila == freezed
          ? _value.argila
          : argila // ignore: cast_nullable_to_non_nullable
              as double,
      madeira: madeira == freezed
          ? _value.madeira
          : madeira // ignore: cast_nullable_to_non_nullable
              as double,
      ferro: ferro == freezed
          ? _value.ferro
          : ferro // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_MaterialSampleCopyWith<$Res>
    implements $MaterialSampleCopyWith<$Res> {
  factory _$$_MaterialSampleCopyWith(
          _$_MaterialSample value, $Res Function(_$_MaterialSample) then) =
      __$$_MaterialSampleCopyWithImpl<$Res>;
  @override
  $Res call({double argila, double madeira, double ferro});
}

/// @nodoc
class __$$_MaterialSampleCopyWithImpl<$Res>
    extends _$MaterialSampleCopyWithImpl<$Res>
    implements _$$_MaterialSampleCopyWith<$Res> {
  __$$_MaterialSampleCopyWithImpl(
      _$_MaterialSample _value, $Res Function(_$_MaterialSample) _then)
      : super(_value, (v) => _then(v as _$_MaterialSample));

  @override
  _$_MaterialSample get _value => super._value as _$_MaterialSample;

  @override
  $Res call({
    Object? argila = freezed,
    Object? madeira = freezed,
    Object? ferro = freezed,
  }) {
    return _then(_$_MaterialSample(
      argila: argila == freezed
          ? _value.argila
          : argila // ignore: cast_nullable_to_non_nullable
              as double,
      madeira: madeira == freezed
          ? _value.madeira
          : madeira // ignore: cast_nullable_to_non_nullable
              as double,
      ferro: ferro == freezed
          ? _value.ferro
          : ferro // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialSample implements _MaterialSample {
  const _$_MaterialSample(
      {required this.argila, required this.madeira, required this.ferro});

  factory _$_MaterialSample.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialSampleFromJson(json);

  @override
  final double argila;
  @override
  final double madeira;
  @override
  final double ferro;

  @override
  String toString() {
    return 'MaterialSample(argila: $argila, madeira: $madeira, ferro: $ferro)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialSample &&
            const DeepCollectionEquality().equals(other.argila, argila) &&
            const DeepCollectionEquality().equals(other.madeira, madeira) &&
            const DeepCollectionEquality().equals(other.ferro, ferro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(argila),
      const DeepCollectionEquality().hash(madeira),
      const DeepCollectionEquality().hash(ferro));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialSampleCopyWith<_$_MaterialSample> get copyWith =>
      __$$_MaterialSampleCopyWithImpl<_$_MaterialSample>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialSampleToJson(this);
  }
}

abstract class _MaterialSample implements MaterialSample {
  const factory _MaterialSample(
      {required final double argila,
      required final double madeira,
      required final double ferro}) = _$_MaterialSample;

  factory _MaterialSample.fromJson(Map<String, dynamic> json) =
      _$_MaterialSample.fromJson;

  @override
  double get argila => throw _privateConstructorUsedError;
  @override
  double get madeira => throw _privateConstructorUsedError;
  @override
  double get ferro => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialSampleCopyWith<_$_MaterialSample> get copyWith =>
      throw _privateConstructorUsedError;
}
