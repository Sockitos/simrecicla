// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine_graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MachineGraph {
  DirectedGraph<String> get graph => throw _privateConstructorUsedError;
  bool get isValidated => throw _privateConstructorUsedError;
  Map<String, MaterialSample> get inputs => throw _privateConstructorUsedError;
  Map<MachineOutputId, MaterialSample> get outputs =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MachineGraphCopyWith<MachineGraph> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineGraphCopyWith<$Res> {
  factory $MachineGraphCopyWith(
          MachineGraph value, $Res Function(MachineGraph) then) =
      _$MachineGraphCopyWithImpl<$Res, MachineGraph>;
  @useResult
  $Res call(
      {DirectedGraph<String> graph,
      bool isValidated,
      Map<String, MaterialSample> inputs,
      Map<MachineOutputId, MaterialSample> outputs});
}

/// @nodoc
class _$MachineGraphCopyWithImpl<$Res, $Val extends MachineGraph>
    implements $MachineGraphCopyWith<$Res> {
  _$MachineGraphCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? graph = null,
    Object? isValidated = null,
    Object? inputs = null,
    Object? outputs = null,
  }) {
    return _then(_value.copyWith(
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as DirectedGraph<String>,
      isValidated: null == isValidated
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      inputs: null == inputs
          ? _value.inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as Map<String, MaterialSample>,
      outputs: null == outputs
          ? _value.outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as Map<MachineOutputId, MaterialSample>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MachineGraphCopyWith<$Res>
    implements $MachineGraphCopyWith<$Res> {
  factory _$$_MachineGraphCopyWith(
          _$_MachineGraph value, $Res Function(_$_MachineGraph) then) =
      __$$_MachineGraphCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DirectedGraph<String> graph,
      bool isValidated,
      Map<String, MaterialSample> inputs,
      Map<MachineOutputId, MaterialSample> outputs});
}

/// @nodoc
class __$$_MachineGraphCopyWithImpl<$Res>
    extends _$MachineGraphCopyWithImpl<$Res, _$_MachineGraph>
    implements _$$_MachineGraphCopyWith<$Res> {
  __$$_MachineGraphCopyWithImpl(
      _$_MachineGraph _value, $Res Function(_$_MachineGraph) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? graph = null,
    Object? isValidated = null,
    Object? inputs = null,
    Object? outputs = null,
  }) {
    return _then(_$_MachineGraph(
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as DirectedGraph<String>,
      isValidated: null == isValidated
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      inputs: null == inputs
          ? _value._inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as Map<String, MaterialSample>,
      outputs: null == outputs
          ? _value._outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as Map<MachineOutputId, MaterialSample>,
    ));
  }
}

/// @nodoc

class _$_MachineGraph extends _MachineGraph {
  const _$_MachineGraph(
      {required this.graph,
      this.isValidated = false,
      final Map<String, MaterialSample> inputs =
          const <String, MaterialSample>{},
      final Map<MachineOutputId, MaterialSample> outputs =
          const <MachineOutputId, MaterialSample>{}})
      : _inputs = inputs,
        _outputs = outputs,
        super._();

  @override
  final DirectedGraph<String> graph;
  @override
  @JsonKey()
  final bool isValidated;
  final Map<String, MaterialSample> _inputs;
  @override
  @JsonKey()
  Map<String, MaterialSample> get inputs {
    if (_inputs is EqualUnmodifiableMapView) return _inputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_inputs);
  }

  final Map<MachineOutputId, MaterialSample> _outputs;
  @override
  @JsonKey()
  Map<MachineOutputId, MaterialSample> get outputs {
    if (_outputs is EqualUnmodifiableMapView) return _outputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_outputs);
  }

  @override
  String toString() {
    return 'MachineGraph(graph: $graph, isValidated: $isValidated, inputs: $inputs, outputs: $outputs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MachineGraph &&
            const DeepCollectionEquality().equals(other.graph, graph) &&
            (identical(other.isValidated, isValidated) ||
                other.isValidated == isValidated) &&
            const DeepCollectionEquality().equals(other._inputs, _inputs) &&
            const DeepCollectionEquality().equals(other._outputs, _outputs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(graph),
      isValidated,
      const DeepCollectionEquality().hash(_inputs),
      const DeepCollectionEquality().hash(_outputs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MachineGraphCopyWith<_$_MachineGraph> get copyWith =>
      __$$_MachineGraphCopyWithImpl<_$_MachineGraph>(this, _$identity);
}

abstract class _MachineGraph extends MachineGraph {
  const factory _MachineGraph(
      {required final DirectedGraph<String> graph,
      final bool isValidated,
      final Map<String, MaterialSample> inputs,
      final Map<MachineOutputId, MaterialSample> outputs}) = _$_MachineGraph;
  const _MachineGraph._() : super._();

  @override
  DirectedGraph<String> get graph;
  @override
  bool get isValidated;
  @override
  Map<String, MaterialSample> get inputs;
  @override
  Map<MachineOutputId, MaterialSample> get outputs;
  @override
  @JsonKey(ignore: true)
  _$$_MachineGraphCopyWith<_$_MachineGraph> get copyWith =>
      throw _privateConstructorUsedError;
}
