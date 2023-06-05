// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine_port.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MachinePort {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) input,
    required TResult Function(String id, String description,
            MachineOutputType type, MaterialSample materialConversion)
        output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? input,
    TResult? Function(String id, String description, MachineOutputType type,
            MaterialSample materialConversion)?
        output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, String description, MachineOutputType type,
            MaterialSample materialConversion)?
        output,
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
    TResult? Function(MachineInput value)? input,
    TResult? Function(MachineOutput value)? output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MachineInput value)? input,
    TResult Function(MachineOutput value)? output,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MachinePortCopyWith<MachinePort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachinePortCopyWith<$Res> {
  factory $MachinePortCopyWith(
          MachinePort value, $Res Function(MachinePort) then) =
      _$MachinePortCopyWithImpl<$Res, MachinePort>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MachinePortCopyWithImpl<$Res, $Val extends MachinePort>
    implements $MachinePortCopyWith<$Res> {
  _$MachinePortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MachineInputCopyWith<$Res>
    implements $MachinePortCopyWith<$Res> {
  factory _$$MachineInputCopyWith(
          _$MachineInput value, $Res Function(_$MachineInput) then) =
      __$$MachineInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MachineInputCopyWithImpl<$Res>
    extends _$MachinePortCopyWithImpl<$Res, _$MachineInput>
    implements _$$MachineInputCopyWith<$Res> {
  __$$MachineInputCopyWithImpl(
      _$MachineInput _value, $Res Function(_$MachineInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MachineInput(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MachineInput implements MachineInput {
  const _$MachineInput({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MachinePort.input(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineInput &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineInputCopyWith<_$MachineInput> get copyWith =>
      __$$MachineInputCopyWithImpl<_$MachineInput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) input,
    required TResult Function(String id, String description,
            MachineOutputType type, MaterialSample materialConversion)
        output,
  }) {
    return input(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? input,
    TResult? Function(String id, String description, MachineOutputType type,
            MaterialSample materialConversion)?
        output,
  }) {
    return input?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, String description, MachineOutputType type,
            MaterialSample materialConversion)?
        output,
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
    TResult? Function(MachineInput value)? input,
    TResult? Function(MachineOutput value)? output,
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
}

abstract class MachineInput implements MachinePort {
  const factory MachineInput({required final String id}) = _$MachineInput;

  @override
  String get id;
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
  @useResult
  $Res call(
      {String id,
      String description,
      MachineOutputType type,
      MaterialSample materialConversion});

  $MaterialSampleCopyWith<$Res> get materialConversion;
}

/// @nodoc
class __$$MachineOutputCopyWithImpl<$Res>
    extends _$MachinePortCopyWithImpl<$Res, _$MachineOutput>
    implements _$$MachineOutputCopyWith<$Res> {
  __$$MachineOutputCopyWithImpl(
      _$MachineOutput _value, $Res Function(_$MachineOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? type = null,
    Object? materialConversion = null,
  }) {
    return _then(_$MachineOutput(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MachineOutputType,
      materialConversion: null == materialConversion
          ? _value.materialConversion
          : materialConversion // ignore: cast_nullable_to_non_nullable
              as MaterialSample,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialSampleCopyWith<$Res> get materialConversion {
    return $MaterialSampleCopyWith<$Res>(_value.materialConversion, (value) {
      return _then(_value.copyWith(materialConversion: value));
    });
  }
}

/// @nodoc

class _$MachineOutput implements MachineOutput {
  const _$MachineOutput(
      {required this.id,
      required this.description,
      required this.type,
      required this.materialConversion});

  @override
  final String id;
  @override
  final String description;
  @override
  final MachineOutputType type;
  @override
  final MaterialSample materialConversion;

  @override
  String toString() {
    return 'MachinePort.output(id: $id, description: $description, type: $type, materialConversion: $materialConversion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineOutput &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.materialConversion, materialConversion) ||
                other.materialConversion == materialConversion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, type, materialConversion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineOutputCopyWith<_$MachineOutput> get copyWith =>
      __$$MachineOutputCopyWithImpl<_$MachineOutput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) input,
    required TResult Function(String id, String description,
            MachineOutputType type, MaterialSample materialConversion)
        output,
  }) {
    return output(id, description, type, materialConversion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? input,
    TResult? Function(String id, String description, MachineOutputType type,
            MaterialSample materialConversion)?
        output,
  }) {
    return output?.call(id, description, type, materialConversion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? input,
    TResult Function(String id, String description, MachineOutputType type,
            MaterialSample materialConversion)?
        output,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output(id, description, type, materialConversion);
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
    TResult? Function(MachineInput value)? input,
    TResult? Function(MachineOutput value)? output,
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
}

abstract class MachineOutput implements MachinePort {
  const factory MachineOutput(
      {required final String id,
      required final String description,
      required final MachineOutputType type,
      required final MaterialSample materialConversion}) = _$MachineOutput;

  @override
  String get id;
  String get description;
  MachineOutputType get type;
  MaterialSample get materialConversion;
  @override
  @JsonKey(ignore: true)
  _$$MachineOutputCopyWith<_$MachineOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MachineInputId {
  String get machineId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MachineInputIdCopyWith<MachineInputId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineInputIdCopyWith<$Res> {
  factory $MachineInputIdCopyWith(
          MachineInputId value, $Res Function(MachineInputId) then) =
      _$MachineInputIdCopyWithImpl<$Res, MachineInputId>;
  @useResult
  $Res call({String machineId, String id});
}

/// @nodoc
class _$MachineInputIdCopyWithImpl<$Res, $Val extends MachineInputId>
    implements $MachineInputIdCopyWith<$Res> {
  _$MachineInputIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machineId = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      machineId: null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MachineInputIdCopyWith<$Res>
    implements $MachineInputIdCopyWith<$Res> {
  factory _$$_MachineInputIdCopyWith(
          _$_MachineInputId value, $Res Function(_$_MachineInputId) then) =
      __$$_MachineInputIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String machineId, String id});
}

/// @nodoc
class __$$_MachineInputIdCopyWithImpl<$Res>
    extends _$MachineInputIdCopyWithImpl<$Res, _$_MachineInputId>
    implements _$$_MachineInputIdCopyWith<$Res> {
  __$$_MachineInputIdCopyWithImpl(
      _$_MachineInputId _value, $Res Function(_$_MachineInputId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machineId = null,
    Object? id = null,
  }) {
    return _then(_$_MachineInputId(
      null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MachineInputId implements _MachineInputId {
  const _$_MachineInputId(this.machineId, this.id);

  @override
  final String machineId;
  @override
  final String id;

  @override
  String toString() {
    return 'MachineInputId(machineId: $machineId, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MachineInputId &&
            (identical(other.machineId, machineId) ||
                other.machineId == machineId) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, machineId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MachineInputIdCopyWith<_$_MachineInputId> get copyWith =>
      __$$_MachineInputIdCopyWithImpl<_$_MachineInputId>(this, _$identity);
}

abstract class _MachineInputId implements MachineInputId {
  const factory _MachineInputId(final String machineId, final String id) =
      _$_MachineInputId;

  @override
  String get machineId;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_MachineInputIdCopyWith<_$_MachineInputId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MachineOutputId {
  String get machineId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MachineOutputIdCopyWith<MachineOutputId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineOutputIdCopyWith<$Res> {
  factory $MachineOutputIdCopyWith(
          MachineOutputId value, $Res Function(MachineOutputId) then) =
      _$MachineOutputIdCopyWithImpl<$Res, MachineOutputId>;
  @useResult
  $Res call({String machineId, String id});
}

/// @nodoc
class _$MachineOutputIdCopyWithImpl<$Res, $Val extends MachineOutputId>
    implements $MachineOutputIdCopyWith<$Res> {
  _$MachineOutputIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machineId = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      machineId: null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MachineOutputIdCopyWith<$Res>
    implements $MachineOutputIdCopyWith<$Res> {
  factory _$$_MachineOutputIdCopyWith(
          _$_MachineOutputId value, $Res Function(_$_MachineOutputId) then) =
      __$$_MachineOutputIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String machineId, String id});
}

/// @nodoc
class __$$_MachineOutputIdCopyWithImpl<$Res>
    extends _$MachineOutputIdCopyWithImpl<$Res, _$_MachineOutputId>
    implements _$$_MachineOutputIdCopyWith<$Res> {
  __$$_MachineOutputIdCopyWithImpl(
      _$_MachineOutputId _value, $Res Function(_$_MachineOutputId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machineId = null,
    Object? id = null,
  }) {
    return _then(_$_MachineOutputId(
      null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MachineOutputId implements _MachineOutputId {
  const _$_MachineOutputId(this.machineId, this.id);

  @override
  final String machineId;
  @override
  final String id;

  @override
  String toString() {
    return 'MachineOutputId(machineId: $machineId, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MachineOutputId &&
            (identical(other.machineId, machineId) ||
                other.machineId == machineId) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, machineId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MachineOutputIdCopyWith<_$_MachineOutputId> get copyWith =>
      __$$_MachineOutputIdCopyWithImpl<_$_MachineOutputId>(this, _$identity);
}

abstract class _MachineOutputId implements MachineOutputId {
  const factory _MachineOutputId(final String machineId, final String id) =
      _$_MachineOutputId;

  @override
  String get machineId;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_MachineOutputIdCopyWith<_$_MachineOutputId> get copyWith =>
      throw _privateConstructorUsedError;
}
