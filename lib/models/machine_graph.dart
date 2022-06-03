import 'package:directed_graph/directed_graph.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';

part 'machine_graph.freezed.dart';

@freezed
class MachineGraph with _$MachineGraph {
  const factory MachineGraph({
    required DirectedGraph<String> graph,
    @Default(false) bool isValidated,
    @Default(<String, MaterialSample>{}) Map<String, MaterialSample> inputs,
    @Default(<MachineOutputId, MaterialSample>{})
        Map<MachineOutputId, MaterialSample> outputs,
  }) = _MachineGraph;
}
