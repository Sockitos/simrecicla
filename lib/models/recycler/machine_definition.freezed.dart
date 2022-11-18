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
  List<RotatableIconData> get icons => throw _privateConstructorUsedError;
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
      _$MachineDefinitionCopyWithImpl<$Res, MachineDefinition>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<RotatableIconData> icons,
      String description,
      List<MachineInput> inputs,
      List<MachineOutput> outputs});
}

/// @nodoc
class _$MachineDefinitionCopyWithImpl<$Res, $Val extends MachineDefinition>
    implements $MachineDefinitionCopyWith<$Res> {
  _$MachineDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icons = null,
    Object? description = null,
    Object? inputs = null,
    Object? outputs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icons: null == icons
          ? _value.icons
          : icons // ignore: cast_nullable_to_non_nullable
              as List<RotatableIconData>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      inputs: null == inputs
          ? _value.inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<MachineInput>,
      outputs: null == outputs
          ? _value.outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<MachineOutput>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MachineDefinitionCopyWith<$Res>
    implements $MachineDefinitionCopyWith<$Res> {
  factory _$$_MachineDefinitionCopyWith(_$_MachineDefinition value,
          $Res Function(_$_MachineDefinition) then) =
      __$$_MachineDefinitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<RotatableIconData> icons,
      String description,
      List<MachineInput> inputs,
      List<MachineOutput> outputs});
}

/// @nodoc
class __$$_MachineDefinitionCopyWithImpl<$Res>
    extends _$MachineDefinitionCopyWithImpl<$Res, _$_MachineDefinition>
    implements _$$_MachineDefinitionCopyWith<$Res> {
  __$$_MachineDefinitionCopyWithImpl(
      _$_MachineDefinition _value, $Res Function(_$_MachineDefinition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icons = null,
    Object? description = null,
    Object? inputs = null,
    Object? outputs = null,
  }) {
    return _then(_$_MachineDefinition(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icons: null == icons
          ? _value._icons
          : icons // ignore: cast_nullable_to_non_nullable
              as List<RotatableIconData>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      inputs: null == inputs
          ? _value._inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<MachineInput>,
      outputs: null == outputs
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
      required final List<RotatableIconData> icons,
      required this.description,
      required final List<MachineInput> inputs,
      required final List<MachineOutput> outputs})
      : _icons = icons,
        _inputs = inputs,
        _outputs = outputs,
        super._();

  @override
  final String id;
  @override
  final String name;
  final List<RotatableIconData> _icons;
  @override
  List<RotatableIconData> get icons {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_icons);
  }

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
    return 'MachineDefinition(id: $id, name: $name, icons: $icons, description: $description, inputs: $inputs, outputs: $outputs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MachineDefinition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._icons, _icons) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._inputs, _inputs) &&
            const DeepCollectionEquality().equals(other._outputs, _outputs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_icons),
      description,
      const DeepCollectionEquality().hash(_inputs),
      const DeepCollectionEquality().hash(_outputs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MachineDefinitionCopyWith<_$_MachineDefinition> get copyWith =>
      __$$_MachineDefinitionCopyWithImpl<_$_MachineDefinition>(
          this, _$identity);
}

abstract class _MachineDefinition extends MachineDefinition {
  const factory _MachineDefinition(
      {required final String id,
      required final String name,
      required final List<RotatableIconData> icons,
      required final String description,
      required final List<MachineInput> inputs,
      required final List<MachineOutput> outputs}) = _$_MachineDefinition;
  const _MachineDefinition._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  List<RotatableIconData> get icons;
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
