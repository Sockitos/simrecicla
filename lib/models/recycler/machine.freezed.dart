// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  RotatableIconData get icon => throw _privateConstructorUsedError;
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
      _$MachineCopyWithImpl<$Res, Machine>;
  @useResult
  $Res call(
      {String id,
      int index,
      String name,
      RotatableIconData icon,
      String description,
      Map<AxisDirection, MachinePort?> ports,
      bool isFixed});
}

/// @nodoc
class _$MachineCopyWithImpl<$Res, $Val extends Machine>
    implements $MachineCopyWith<$Res> {
  _$MachineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? name = null,
    Object? icon = null,
    Object? description = null,
    Object? ports = null,
    Object? isFixed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as RotatableIconData,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ports: null == ports
          ? _value.ports
          : ports // ignore: cast_nullable_to_non_nullable
              as Map<AxisDirection, MachinePort?>,
      isFixed: null == isFixed
          ? _value.isFixed
          : isFixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MachineCopyWith<$Res> implements $MachineCopyWith<$Res> {
  factory _$$_MachineCopyWith(
          _$_Machine value, $Res Function(_$_Machine) then) =
      __$$_MachineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int index,
      String name,
      RotatableIconData icon,
      String description,
      Map<AxisDirection, MachinePort?> ports,
      bool isFixed});
}

/// @nodoc
class __$$_MachineCopyWithImpl<$Res>
    extends _$MachineCopyWithImpl<$Res, _$_Machine>
    implements _$$_MachineCopyWith<$Res> {
  __$$_MachineCopyWithImpl(_$_Machine _value, $Res Function(_$_Machine) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? name = null,
    Object? icon = null,
    Object? description = null,
    Object? ports = null,
    Object? isFixed = null,
  }) {
    return _then(_$_Machine(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as RotatableIconData,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ports: null == ports
          ? _value._ports
          : ports // ignore: cast_nullable_to_non_nullable
              as Map<AxisDirection, MachinePort?>,
      isFixed: null == isFixed
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
  final RotatableIconData icon;
  @override
  final String description;
  final Map<AxisDirection, MachinePort?> _ports;
  @override
  Map<AxisDirection, MachinePort?> get ports {
    if (_ports is EqualUnmodifiableMapView) return _ports;
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._ports, _ports) &&
            (identical(other.isFixed, isFixed) || other.isFixed == isFixed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index, name, icon,
      description, const DeepCollectionEquality().hash(_ports), isFixed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MachineCopyWith<_$_Machine> get copyWith =>
      __$$_MachineCopyWithImpl<_$_Machine>(this, _$identity);
}

abstract class _Machine extends Machine {
  const factory _Machine(
      {required final String id,
      final int index,
      required final String name,
      required final RotatableIconData icon,
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
  RotatableIconData get icon;
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
