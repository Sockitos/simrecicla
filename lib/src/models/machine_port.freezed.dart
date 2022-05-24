// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'machine_port.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MachinePort _$MachinePortFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'input':
      return MachineInput.fromJson(json);
    case 'output':
      return MachineOutput.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MachinePort',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MachinePort {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) input,
    required TResult Function(String id, MaterialSample materialConversion)
        output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, MaterialSample materialConversion)? output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, MaterialSample materialConversion)? output,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MachineInput value) input,
    required TResult Function(MachineOutput value) output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MachineInput value)? input,
    TResult Function(MachineOutput value)? output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MachineInput value)? input,
    TResult Function(MachineOutput value)? output,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MachinePortCopyWith<MachinePort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachinePortCopyWith<$Res> {
  factory $MachinePortCopyWith(
          MachinePort value, $Res Function(MachinePort) then) =
      _$MachinePortCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$MachinePortCopyWithImpl<$Res> implements $MachinePortCopyWith<$Res> {
  _$MachinePortCopyWithImpl(this._value, this._then);

  final MachinePort _value;
  // ignore: unused_field
  final $Res Function(MachinePort) _then;

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
abstract class _$$MachineInputCopyWith<$Res>
    implements $MachinePortCopyWith<$Res> {
  factory _$$MachineInputCopyWith(
          _$MachineInput value, $Res Function(_$MachineInput) then) =
      __$$MachineInputCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$$MachineInputCopyWithImpl<$Res> extends _$MachinePortCopyWithImpl<$Res>
    implements _$$MachineInputCopyWith<$Res> {
  __$$MachineInputCopyWithImpl(
      _$MachineInput _value, $Res Function(_$MachineInput) _then)
      : super(_value, (v) => _then(v as _$MachineInput));

  @override
  _$MachineInput get _value => super._value as _$MachineInput;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$MachineInput(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineInput implements MachineInput {
  const _$MachineInput({required this.id, final String? $type})
      : $type = $type ?? 'input';

  factory _$MachineInput.fromJson(Map<String, dynamic> json) =>
      _$$MachineInputFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MachinePort.input(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineInput &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$MachineInputCopyWith<_$MachineInput> get copyWith =>
      __$$MachineInputCopyWithImpl<_$MachineInput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) input,
    required TResult Function(String id, MaterialSample materialConversion)
        output,
  }) {
    return input(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, MaterialSample materialConversion)? output,
  }) {
    return input?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, MaterialSample materialConversion)? output,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MachineInput value) input,
    required TResult Function(MachineOutput value) output,
  }) {
    return input(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MachineInput value)? input,
    TResult Function(MachineOutput value)? output,
  }) {
    return input?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MachineInput value)? input,
    TResult Function(MachineOutput value)? output,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineInputToJson(this);
  }
}

abstract class MachineInput implements MachinePort {
  const factory MachineInput({required final String id}) = _$MachineInput;

  factory MachineInput.fromJson(Map<String, dynamic> json) =
      _$MachineInput.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$MachineInputCopyWith<_$MachineInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MachineOutputCopyWith<$Res>
    implements $MachinePortCopyWith<$Res> {
  factory _$$MachineOutputCopyWith(
          _$MachineOutput value, $Res Function(_$MachineOutput) then) =
      __$$MachineOutputCopyWithImpl<$Res>;
  @override
  $Res call({String id, MaterialSample materialConversion});

  $MaterialSampleCopyWith<$Res> get materialConversion;
}

/// @nodoc
class __$$MachineOutputCopyWithImpl<$Res>
    extends _$MachinePortCopyWithImpl<$Res>
    implements _$$MachineOutputCopyWith<$Res> {
  __$$MachineOutputCopyWithImpl(
      _$MachineOutput _value, $Res Function(_$MachineOutput) _then)
      : super(_value, (v) => _then(v as _$MachineOutput));

  @override
  _$MachineOutput get _value => super._value as _$MachineOutput;

  @override
  $Res call({
    Object? id = freezed,
    Object? materialConversion = freezed,
  }) {
    return _then(_$MachineOutput(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      materialConversion: materialConversion == freezed
          ? _value.materialConversion
          : materialConversion // ignore: cast_nullable_to_non_nullable
              as MaterialSample,
    ));
  }

  @override
  $MaterialSampleCopyWith<$Res> get materialConversion {
    return $MaterialSampleCopyWith<$Res>(_value.materialConversion, (value) {
      return _then(_value.copyWith(materialConversion: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineOutput implements MachineOutput {
  const _$MachineOutput(
      {required this.id,
      this.materialConversion =
          const MaterialSample(argila: 0, madeira: 0, ferro: 0),
      final String? $type})
      : $type = $type ?? 'output';

  factory _$MachineOutput.fromJson(Map<String, dynamic> json) =>
      _$$MachineOutputFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final MaterialSample materialConversion;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MachinePort.output(id: $id, materialConversion: $materialConversion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineOutput &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.materialConversion, materialConversion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(materialConversion));

  @JsonKey(ignore: true)
  @override
  _$$MachineOutputCopyWith<_$MachineOutput> get copyWith =>
      __$$MachineOutputCopyWithImpl<_$MachineOutput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) input,
    required TResult Function(String id, MaterialSample materialConversion)
        output,
  }) {
    return output(id, materialConversion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, MaterialSample materialConversion)? output,
  }) {
    return output?.call(id, materialConversion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, MaterialSample materialConversion)? output,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output(id, materialConversion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MachineInput value) input,
    required TResult Function(MachineOutput value) output,
  }) {
    return output(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MachineInput value)? input,
    TResult Function(MachineOutput value)? output,
  }) {
    return output?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MachineInput value)? input,
    TResult Function(MachineOutput value)? output,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineOutputToJson(this);
  }
}

abstract class MachineOutput implements MachinePort {
  const factory MachineOutput(
      {required final String id,
      final MaterialSample materialConversion}) = _$MachineOutput;

  factory MachineOutput.fromJson(Map<String, dynamic> json) =
      _$MachineOutput.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  MaterialSample get materialConversion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$MachineOutputCopyWith<_$MachineOutput> get copyWith =>
      throw _privateConstructorUsedError;
}
