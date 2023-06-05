// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GridScreenModel {
  GridType get type => throw _privateConstructorUsedError;
  Grid<Machine> get grid => throw _privateConstructorUsedError;
  Map<MachineOutputId, MachineInputId?> get connections =>
      throw _privateConstructorUsedError;
  bool get useDefaultFeed => throw _privateConstructorUsedError;
  double get feedWeight => throw _privateConstructorUsedError;
  MaterialSample get feedSample => throw _privateConstructorUsedError;
  MachineGraph get graph => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GridScreenModelCopyWith<GridScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridScreenModelCopyWith<$Res> {
  factory $GridScreenModelCopyWith(
          GridScreenModel value, $Res Function(GridScreenModel) then) =
      _$GridScreenModelCopyWithImpl<$Res, GridScreenModel>;
  @useResult
  $Res call(
      {GridType type,
      Grid<Machine> grid,
      Map<MachineOutputId, MachineInputId?> connections,
      bool useDefaultFeed,
      double feedWeight,
      MaterialSample feedSample,
      MachineGraph graph});

  $MaterialSampleCopyWith<$Res> get feedSample;
  $MachineGraphCopyWith<$Res> get graph;
}

/// @nodoc
class _$GridScreenModelCopyWithImpl<$Res, $Val extends GridScreenModel>
    implements $GridScreenModelCopyWith<$Res> {
  _$GridScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? grid = null,
    Object? connections = null,
    Object? useDefaultFeed = null,
    Object? feedWeight = null,
    Object? feedSample = null,
    Object? graph = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GridType,
      grid: null == grid
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as Grid<Machine>,
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<MachineOutputId, MachineInputId?>,
      useDefaultFeed: null == useDefaultFeed
          ? _value.useDefaultFeed
          : useDefaultFeed // ignore: cast_nullable_to_non_nullable
              as bool,
      feedWeight: null == feedWeight
          ? _value.feedWeight
          : feedWeight // ignore: cast_nullable_to_non_nullable
              as double,
      feedSample: null == feedSample
          ? _value.feedSample
          : feedSample // ignore: cast_nullable_to_non_nullable
              as MaterialSample,
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as MachineGraph,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialSampleCopyWith<$Res> get feedSample {
    return $MaterialSampleCopyWith<$Res>(_value.feedSample, (value) {
      return _then(_value.copyWith(feedSample: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MachineGraphCopyWith<$Res> get graph {
    return $MachineGraphCopyWith<$Res>(_value.graph, (value) {
      return _then(_value.copyWith(graph: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GridScreenModelCopyWith<$Res>
    implements $GridScreenModelCopyWith<$Res> {
  factory _$$_GridScreenModelCopyWith(
          _$_GridScreenModel value, $Res Function(_$_GridScreenModel) then) =
      __$$_GridScreenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GridType type,
      Grid<Machine> grid,
      Map<MachineOutputId, MachineInputId?> connections,
      bool useDefaultFeed,
      double feedWeight,
      MaterialSample feedSample,
      MachineGraph graph});

  @override
  $MaterialSampleCopyWith<$Res> get feedSample;
  @override
  $MachineGraphCopyWith<$Res> get graph;
}

/// @nodoc
class __$$_GridScreenModelCopyWithImpl<$Res>
    extends _$GridScreenModelCopyWithImpl<$Res, _$_GridScreenModel>
    implements _$$_GridScreenModelCopyWith<$Res> {
  __$$_GridScreenModelCopyWithImpl(
      _$_GridScreenModel _value, $Res Function(_$_GridScreenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? grid = null,
    Object? connections = null,
    Object? useDefaultFeed = null,
    Object? feedWeight = null,
    Object? feedSample = null,
    Object? graph = null,
  }) {
    return _then(_$_GridScreenModel(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GridType,
      grid: null == grid
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as Grid<Machine>,
      connections: null == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<MachineOutputId, MachineInputId?>,
      useDefaultFeed: null == useDefaultFeed
          ? _value.useDefaultFeed
          : useDefaultFeed // ignore: cast_nullable_to_non_nullable
              as bool,
      feedWeight: null == feedWeight
          ? _value.feedWeight
          : feedWeight // ignore: cast_nullable_to_non_nullable
              as double,
      feedSample: null == feedSample
          ? _value.feedSample
          : feedSample // ignore: cast_nullable_to_non_nullable
              as MaterialSample,
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as MachineGraph,
    ));
  }
}

/// @nodoc

class _$_GridScreenModel extends _GridScreenModel with DiagnosticableTreeMixin {
  const _$_GridScreenModel(
      {required this.type,
      required this.grid,
      final Map<MachineOutputId, MachineInputId?> connections =
          const <MachineOutputId, MachineInputId?>{},
      this.useDefaultFeed = true,
      required this.feedWeight,
      required this.feedSample,
      required this.graph})
      : _connections = connections,
        super._();

  @override
  final GridType type;
  @override
  final Grid<Machine> grid;
  final Map<MachineOutputId, MachineInputId?> _connections;
  @override
  @JsonKey()
  Map<MachineOutputId, MachineInputId?> get connections {
    if (_connections is EqualUnmodifiableMapView) return _connections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_connections);
  }

  @override
  @JsonKey()
  final bool useDefaultFeed;
  @override
  final double feedWeight;
  @override
  final MaterialSample feedSample;
  @override
  final MachineGraph graph;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GridScreenModel(type: $type, grid: $grid, connections: $connections, useDefaultFeed: $useDefaultFeed, feedWeight: $feedWeight, feedSample: $feedSample, graph: $graph)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GridScreenModel'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('grid', grid))
      ..add(DiagnosticsProperty('connections', connections))
      ..add(DiagnosticsProperty('useDefaultFeed', useDefaultFeed))
      ..add(DiagnosticsProperty('feedWeight', feedWeight))
      ..add(DiagnosticsProperty('feedSample', feedSample))
      ..add(DiagnosticsProperty('graph', graph));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GridScreenModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.grid, grid) || other.grid == grid) &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections) &&
            (identical(other.useDefaultFeed, useDefaultFeed) ||
                other.useDefaultFeed == useDefaultFeed) &&
            (identical(other.feedWeight, feedWeight) ||
                other.feedWeight == feedWeight) &&
            (identical(other.feedSample, feedSample) ||
                other.feedSample == feedSample) &&
            (identical(other.graph, graph) || other.graph == graph));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      grid,
      const DeepCollectionEquality().hash(_connections),
      useDefaultFeed,
      feedWeight,
      feedSample,
      graph);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GridScreenModelCopyWith<_$_GridScreenModel> get copyWith =>
      __$$_GridScreenModelCopyWithImpl<_$_GridScreenModel>(this, _$identity);
}

abstract class _GridScreenModel extends GridScreenModel {
  const factory _GridScreenModel(
      {required final GridType type,
      required final Grid<Machine> grid,
      final Map<MachineOutputId, MachineInputId?> connections,
      final bool useDefaultFeed,
      required final double feedWeight,
      required final MaterialSample feedSample,
      required final MachineGraph graph}) = _$_GridScreenModel;
  const _GridScreenModel._() : super._();

  @override
  GridType get type;
  @override
  Grid<Machine> get grid;
  @override
  Map<MachineOutputId, MachineInputId?> get connections;
  @override
  bool get useDefaultFeed;
  @override
  double get feedWeight;
  @override
  MaterialSample get feedSample;
  @override
  MachineGraph get graph;
  @override
  @JsonKey(ignore: true)
  _$$_GridScreenModelCopyWith<_$_GridScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
