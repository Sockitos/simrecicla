// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'grid_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GridScreenModel {
  Grid<Machine> get grid => throw _privateConstructorUsedError;
  Map<Tuple2<String, String>, Tuple2<String, String>?> get connections =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GridScreenModelCopyWith<GridScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridScreenModelCopyWith<$Res> {
  factory $GridScreenModelCopyWith(
          GridScreenModel value, $Res Function(GridScreenModel) then) =
      _$GridScreenModelCopyWithImpl<$Res>;
  $Res call(
      {Grid<Machine> grid,
      Map<Tuple2<String, String>, Tuple2<String, String>?> connections});
}

/// @nodoc
class _$GridScreenModelCopyWithImpl<$Res>
    implements $GridScreenModelCopyWith<$Res> {
  _$GridScreenModelCopyWithImpl(this._value, this._then);

  final GridScreenModel _value;
  // ignore: unused_field
  final $Res Function(GridScreenModel) _then;

  @override
  $Res call({
    Object? grid = freezed,
    Object? connections = freezed,
  }) {
    return _then(_value.copyWith(
      grid: grid == freezed
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as Grid<Machine>,
      connections: connections == freezed
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<Tuple2<String, String>, Tuple2<String, String>?>,
    ));
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res>
    implements $GridScreenModelCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {Grid<Machine> grid,
      Map<Tuple2<String, String>, Tuple2<String, String>?> connections});
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res> extends _$GridScreenModelCopyWithImpl<$Res>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, (v) => _then(v as _$_Answer));

  @override
  _$_Answer get _value => super._value as _$_Answer;

  @override
  $Res call({
    Object? grid = freezed,
    Object? connections = freezed,
  }) {
    return _then(_$_Answer(
      grid: grid == freezed
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as Grid<Machine>,
      connections: connections == freezed
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<Tuple2<String, String>, Tuple2<String, String>?>,
    ));
  }
}

/// @nodoc

class _$_Answer implements _Answer {
  const _$_Answer(
      {required this.grid,
      final Map<Tuple2<String, String>, Tuple2<String, String>?> connections =
          const <MachineOutputId, MachineInputId?>{}})
      : _connections = connections;

  @override
  final Grid<Machine> grid;
  final Map<Tuple2<String, String>, Tuple2<String, String>?> _connections;
  @override
  @JsonKey()
  Map<Tuple2<String, String>, Tuple2<String, String>?> get connections {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_connections);
  }

  @override
  String toString() {
    return 'GridScreenModel(grid: $grid, connections: $connections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            const DeepCollectionEquality().equals(other.grid, grid) &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(grid),
      const DeepCollectionEquality().hash(_connections));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);
}

abstract class _Answer implements GridScreenModel {
  const factory _Answer(
      {required final Grid<Machine> grid,
      final Map<Tuple2<String, String>, Tuple2<String, String>?>
          connections}) = _$_Answer;

  @override
  Grid<Machine> get grid => throw _privateConstructorUsedError;
  @override
  Map<Tuple2<String, String>, Tuple2<String, String>?> get connections =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
