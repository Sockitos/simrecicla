// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'machine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Machine {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<AxisDirection, MachinePort?> get ports =>
      throw _privateConstructorUsedError;
  bool get isFixed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MachineCopyWith<Machine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineCopyWith<$Res> {
  factory $MachineCopyWith(Machine value, $Res Function(Machine) then) =
      _$MachineCopyWithImpl<$Res>;
  $Res call(
      {String id,
      int index,
      String name,
      IconData icon,
      String description,
      Map<AxisDirection, MachinePort?> ports,
      bool isFixed});
}

/// @nodoc
class _$MachineCopyWithImpl<$Res> implements $MachineCopyWith<$Res> {
  _$MachineCopyWithImpl(this._value, this._then);

  final Machine _value;
  // ignore: unused_field
  final $Res Function(Machine) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? index = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? description = freezed,
    Object? ports = freezed,
    Object? isFixed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
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
      ports: ports == freezed
          ? _value.ports
          : ports // ignore: cast_nullable_to_non_nullable
              as Map<AxisDirection, MachinePort?>,
      isFixed: isFixed == freezed
          ? _value.isFixed
          : isFixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MachineCopyWith<$Res> implements $MachineCopyWith<$Res> {
  factory _$$_MachineCopyWith(
          _$_Machine value, $Res Function(_$_Machine) then) =
      __$$_MachineCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      int index,
      String name,
      IconData icon,
      String description,
      Map<AxisDirection, MachinePort?> ports,
      bool isFixed});
}

/// @nodoc
class __$$_MachineCopyWithImpl<$Res> extends _$MachineCopyWithImpl<$Res>
    implements _$$_MachineCopyWith<$Res> {
  __$$_MachineCopyWithImpl(_$_Machine _value, $Res Function(_$_Machine) _then)
      : super(_value, (v) => _then(v as _$_Machine));

  @override
  _$_Machine get _value => super._value as _$_Machine;

  @override
  $Res call({
    Object? id = freezed,
    Object? index = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? description = freezed,
    Object? ports = freezed,
    Object? isFixed = freezed,
  }) {
    return _then(_$_Machine(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
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
      ports: ports == freezed
          ? _value._ports
          : ports // ignore: cast_nullable_to_non_nullable
              as Map<AxisDirection, MachinePort?>,
      isFixed: isFixed == freezed
          ? _value.isFixed
          : isFixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Machine extends _Machine {
  const _$_Machine(
      {required this.id,
      this.index = 0,
      required this.name,
      required this.icon,
      required this.description,
      required final Map<AxisDirection, MachinePort?> ports,
      this.isFixed = false})
      : _ports = ports,
        super._();

  @override
  final String id;
  @override
  @JsonKey()
  final int index;
  @override
  final String name;
  @override
  final IconData icon;
  @override
  final String description;
  final Map<AxisDirection, MachinePort?> _ports;
  @override
  Map<AxisDirection, MachinePort?> get ports {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ports);
  }

  @override
  @JsonKey()
  final bool isFixed;

  @override
  String toString() {
    return 'Machine(id: $id, index: $index, name: $name, icon: $icon, description: $description, ports: $ports, isFixed: $isFixed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Machine &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other._ports, _ports) &&
            const DeepCollectionEquality().equals(other.isFixed, isFixed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_ports),
      const DeepCollectionEquality().hash(isFixed));

  @JsonKey(ignore: true)
  @override
  _$$_MachineCopyWith<_$_Machine> get copyWith =>
      __$$_MachineCopyWithImpl<_$_Machine>(this, _$identity);
}

abstract class _Machine extends Machine {
  const factory _Machine(
      {required final String id,
      final int index,
      required final String name,
      required final IconData icon,
      required final String description,
      required final Map<AxisDirection, MachinePort?> ports,
      final bool isFixed}) = _$_Machine;
  const _Machine._() : super._();

  @override
  String get id;
  @override
  int get index;
  @override
  String get name;
  @override
  IconData get icon;
  @override
  String get description;
  @override
  Map<AxisDirection, MachinePort?> get ports;
  @override
  bool get isFixed;
  @override
  @JsonKey(ignore: true)
  _$$_MachineCopyWith<_$_Machine> get copyWith =>
      throw _privateConstructorUsedError;
}
