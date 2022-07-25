// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'machine_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MachineDefinition {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<MachineInput> get inputs => throw _privateConstructorUsedError;
  List<MachineOutput> get outputs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MachineDefinitionCopyWith<MachineDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineDefinitionCopyWith<$Res> {
  factory $MachineDefinitionCopyWith(
          MachineDefinition value, $Res Function(MachineDefinition) then) =
      _$MachineDefinitionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      IconData icon,
      String description,
      List<MachineInput> inputs,
      List<MachineOutput> outputs});
}

/// @nodoc
class _$MachineDefinitionCopyWithImpl<$Res>
    implements $MachineDefinitionCopyWith<$Res> {
  _$MachineDefinitionCopyWithImpl(this._value, this._then);

  final MachineDefinition _value;
  // ignore: unused_field
  final $Res Function(MachineDefinition) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? description = freezed,
    Object? inputs = freezed,
    Object? outputs = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      inputs: inputs == freezed
          ? _value.inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<MachineInput>,
      outputs: outputs == freezed
          ? _value.outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<MachineOutput>,
    ));
  }
}

/// @nodoc
abstract class _$$_MachineDefinitionCopyWith<$Res>
    implements $MachineDefinitionCopyWith<$Res> {
  factory _$$_MachineDefinitionCopyWith(_$_MachineDefinition value,
          $Res Function(_$_MachineDefinition) then) =
      __$$_MachineDefinitionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      IconData icon,
      String description,
      List<MachineInput> inputs,
      List<MachineOutput> outputs});
}

/// @nodoc
class __$$_MachineDefinitionCopyWithImpl<$Res>
    extends _$MachineDefinitionCopyWithImpl<$Res>
    implements _$$_MachineDefinitionCopyWith<$Res> {
  __$$_MachineDefinitionCopyWithImpl(
      _$_MachineDefinition _value, $Res Function(_$_MachineDefinition) _then)
      : super(_value, (v) => _then(v as _$_MachineDefinition));

  @override
  _$_MachineDefinition get _value => super._value as _$_MachineDefinition;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? description = freezed,
    Object? inputs = freezed,
    Object? outputs = freezed,
  }) {
    return _then(_$_MachineDefinition(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      inputs: inputs == freezed
          ? _value._inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<MachineInput>,
      outputs: outputs == freezed
          ? _value._outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<MachineOutput>,
    ));
  }
}

/// @nodoc

class _$_MachineDefinition extends _MachineDefinition {
  const _$_MachineDefinition(
      {required this.id,
      required this.name,
      required this.icon,
      required this.description,
      required final List<MachineInput> inputs,
      required final List<MachineOutput> outputs})
      : _inputs = inputs,
        _outputs = outputs,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final IconData icon;
  @override
  final String description;
  final List<MachineInput> _inputs;
  @override
  List<MachineInput> get inputs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputs);
  }

  final List<MachineOutput> _outputs;
  @override
  List<MachineOutput> get outputs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outputs);
  }

  @override
  String toString() {
    return 'MachineDefinition(id: $id, name: $name, icon: $icon, description: $description, inputs: $inputs, outputs: $outputs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MachineDefinition &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other._inputs, _inputs) &&
            const DeepCollectionEquality().equals(other._outputs, _outputs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_inputs),
      const DeepCollectionEquality().hash(_outputs));

  @JsonKey(ignore: true)
  @override
  _$$_MachineDefinitionCopyWith<_$_MachineDefinition> get copyWith =>
      __$$_MachineDefinitionCopyWithImpl<_$_MachineDefinition>(
          this, _$identity);
}

abstract class _MachineDefinition extends MachineDefinition {
  const factory _MachineDefinition(
      {required final String id,
      required final String name,
      required final IconData icon,
      required final String description,
      required final List<MachineInput> inputs,
      required final List<MachineOutput> outputs}) = _$_MachineDefinition;
  const _MachineDefinition._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  IconData get icon;
  @override
  String get description;
  @override
  List<MachineInput> get inputs;
  @override
  List<MachineOutput> get outputs;
  @override
  @JsonKey(ignore: true)
  _$$_MachineDefinitionCopyWith<_$_MachineDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}
