// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'machine_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MachineOutput _$MachineOutputFromJson(Map<String, dynamic> json) {
  return _MachineOutput.fromJson(json);
}

/// @nodoc
class _$MachineOutputTearOff {
  const _$MachineOutputTearOff();

  _MachineOutput call({required String id}) {
    return _MachineOutput(
      id: id,
    );
  }

  MachineOutput fromJson(Map<String, Object?> json) {
    return MachineOutput.fromJson(json);
  }
}

/// @nodoc
const $MachineOutput = _$MachineOutputTearOff();

/// @nodoc
mixin _$MachineOutput {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MachineOutputCopyWith<MachineOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineOutputCopyWith<$Res> {
  factory $MachineOutputCopyWith(
          MachineOutput value, $Res Function(MachineOutput) then) =
      _$MachineOutputCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$MachineOutputCopyWithImpl<$Res>
    implements $MachineOutputCopyWith<$Res> {
  _$MachineOutputCopyWithImpl(this._value, this._then);

  final MachineOutput _value;
  // ignore: unused_field
  final $Res Function(MachineOutput) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MachineOutputCopyWith<$Res>
    implements $MachineOutputCopyWith<$Res> {
  factory _$MachineOutputCopyWith(
          _MachineOutput value, $Res Function(_MachineOutput) then) =
      __$MachineOutputCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$MachineOutputCopyWithImpl<$Res>
    extends _$MachineOutputCopyWithImpl<$Res>
    implements _$MachineOutputCopyWith<$Res> {
  __$MachineOutputCopyWithImpl(
      _MachineOutput _value, $Res Function(_MachineOutput) _then)
      : super(_value, (v) => _then(v as _MachineOutput));

  @override
  _MachineOutput get _value => super._value as _MachineOutput;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_MachineOutput(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MachineOutput extends _MachineOutput {
  const _$_MachineOutput({required this.id}) : super._();

  factory _$_MachineOutput.fromJson(Map<String, dynamic> json) =>
      _$$_MachineOutputFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'MachineOutput(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MachineOutput &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$MachineOutputCopyWith<_MachineOutput> get copyWith =>
      __$MachineOutputCopyWithImpl<_MachineOutput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MachineOutputToJson(this);
  }
}

abstract class _MachineOutput extends MachineOutput {
  const factory _MachineOutput({required String id}) = _$_MachineOutput;
  const _MachineOutput._() : super._();

  factory _MachineOutput.fromJson(Map<String, dynamic> json) =
      _$_MachineOutput.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$MachineOutputCopyWith<_MachineOutput> get copyWith =>
      throw _privateConstructorUsedError;
}
