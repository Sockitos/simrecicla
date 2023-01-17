import 'package:directed_graph/directed_graph.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simrecicla/models/recycler/machine_port.dart';
import 'package:simrecicla/models/recycler/material_sample.dart';

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
  const MachineGraph._();

  List<String> get connectedMachines => graph.vertices.toList();

  Map<int, MaterialSample> get products => Map.fromEntries(
        inputs.entries.where((e) => e.key[0] == 'F').map(
              (e) => MapEntry(int.parse(e.key.substring(1)), e.value),
            ),
      );

  MaterialSample calculateProduct() => products.values.fold<MaterialSample>(
        const MaterialSample(),
        (sum, p) {
          final compositions = p.divAll(p.sum());
          final candidate = compositions.getCandidate(0.9);
          return candidate != null
              ? sum +
                  MaterialSample(materials: {candidate: p.getValue(candidate)})
              : sum;
        },
      );
}
