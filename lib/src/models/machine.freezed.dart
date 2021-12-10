// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'machine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Machine _$MachineFromJson(Map<String, dynamic> json) {
  return _Machine.fromJson(json);
}

/// @nodoc
class _$MachineTearOff {
  const _$MachineTearOff();

  _Machine call(
      {required String name,
      required String description,
      @JsonKey(name: 'input_count') required int inputCount,
      required List<MachineOutput> outputs}) {
    return _Machine(
      name: name,
      description: description,
      inputCount: inputCount,
      outputs: outputs,
    );
  }

  Machine fromJson(Map<String, Object?> json) {
    return Machine.fromJson(json);
  }
}

/// @nodoc
const $Machine = _$MachineTearOff();

/// @nodoc
mixin _$Machine {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'input_count')
  int get inputCount => throw _privateConstructorUsedError;
  List<MachineOutput> get outputs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MachineCopyWith<Machine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineCopyWith<$Res> {
  factory $MachineCopyWith(Machine value, $Res Function(Machine) then) =
      _$MachineCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String description,
      @JsonKey(name: 'input_count') int inputCount,
      List<MachineOutput> outputs});
}

/// @nodoc
class _$MachineCopyWithImpl<$Res> implements $MachineCopyWith<$Res> {
  _$MachineCopyWithImpl(this._value, this._then);

  final Machine _value;
  // ignore: unused_field
  final $Res Function(Machine) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? inputCount = freezed,
    Object? outputs = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      inputCount: inputCount == freezed
          ? _value.inputCount
          : inputCount // ignore: cast_nullable_to_non_nullable
              as int,
      outputs: outputs == freezed
          ? _value.outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<MachineOutput>,
    ));
  }
}

/// @nodoc
abstract class _$MachineCopyWith<$Res> implements $MachineCopyWith<$Res> {
  factory _$MachineCopyWith(_Machine value, $Res Function(_Machine) then) =
      __$MachineCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String description,
      @JsonKey(name: 'input_count') int inputCount,
      List<MachineOutput> outputs});
}

/// @nodoc
class __$MachineCopyWithImpl<$Res> extends _$MachineCopyWithImpl<$Res>
    implements _$MachineCopyWith<$Res> {
  __$MachineCopyWithImpl(_Machine _value, $Res Function(_Machine) _then)
      : super(_value, (v) => _then(v as _Machine));

  @override
  _Machine get _value => super._value as _Machine;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? inputCount = freezed,
    Object? outputs = freezed,
  }) {
    return _then(_Machine(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      inputCount: inputCount == freezed
          ? _value.inputCount
          : inputCount // ignore: cast_nullable_to_non_nullable
              as int,
      outputs: outputs == freezed
          ? _value.outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<MachineOutput>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Machine extends _Machine {
  const _$_Machine(
      {required this.name,
      required this.description,
      @JsonKey(name: 'input_count') required this.inputCount,
      required this.outputs})
      : super._();

  factory _$_Machine.fromJson(Map<String, dynamic> json) =>
      _$$_MachineFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'input_count')
  final int inputCount;
  @override
  final List<MachineOutput> outputs;

  @override
  String toString() {
    return 'Machine(name: $name, description: $description, inputCount: $inputCount, outputs: $outputs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Machine &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.inputCount, inputCount) ||
                other.inputCount == inputCount) &&
            const DeepCollectionEquality().equals(other.outputs, outputs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description, inputCount,
      const DeepCollectionEquality().hash(outputs));

  @JsonKey(ignore: true)
  @override
  _$MachineCopyWith<_Machine> get copyWith =>
      __$MachineCopyWithImpl<_Machine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MachineToJson(this);
  }
}

abstract class _Machine extends Machine {
  const factory _Machine(
      {required String name,
      required String description,
      @JsonKey(name: 'input_count') required int inputCount,
      required List<MachineOutput> outputs}) = _$_Machine;
  const _Machine._() : super._();

  factory _Machine.fromJson(Map<String, dynamic> json) = _$_Machine.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'input_count')
  int get inputCount;
  @override
  List<MachineOutput> get outputs;
  @override
  @JsonKey(ignore: true)
  _$MachineCopyWith<_Machine> get copyWith =>
      throw _privateConstructorUsedError;
}
