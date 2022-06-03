import 'package:collection/collection.dart';
import 'package:directed_graph/directed_graph.dart';
import 'package:simtech/data/recycler_data.dart';
import 'package:simtech/models/machine.dart';
import 'package:simtech/models/machine_definition.dart';
import 'package:simtech/models/machine_graph.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';

class RecyclerService {
  static List<MachineDefinition> getMachines() => machines;

  static MachineGraph buildGraph({
    required MaterialSample feedSample,
    required List<Machine> machines,
    required Map<MachineOutputId, MachineInputId?> connections,
  }) {
    int comparator(String s1, String s2) => s1.compareTo(s2);

    final edges = <String, Set<String>>{};

    for (final entry in connections.entries) {
      edges.update(
        entry.key.machineId,
        (value) => {
          ...value,
          if (entry.value?.machineId != null) entry.value!.machineId,
        },
        ifAbsent: () => {
          if (entry.value?.machineId != null) entry.value!.machineId,
        },
      );
    }

    final graph = DirectedGraph<String>(
      edges,
      comparator: comparator,
    );

    final vertices = graph.vertices.toSet();
    final validVertices = graph.reachableVertices('feed0')..add('feed0');
    final invalidVertices = vertices.difference(validVertices);
    invalidVertices.forEach(graph.remove);

    var isValid = true;
    for (final machineId in graph.vertices) {
      final machine = machines.firstWhere((m) => m.id0 == machineId);
      var machineIsValid = true;
      for (final output in machine.outputs) {
        final outputId = MachineOutputId(machineId, output.id);
        if (connections[outputId] == null) {
          machineIsValid = false;
          break;
        }
      }
      if (!machineIsValid) {
        isValid = false;
        break;
      }
    }

    final calculationOrder = graph.topologicalOrdering!;

    final inputs = <String, MaterialSample>{};
    final outputs = <MachineOutputId, MaterialSample>{
      const MachineOutputId('feed0', 'feed'): feedSample,
    };
    for (final machineId in calculationOrder) {
      if (machineId == 'feed0') continue;
      final machine = machines.firstWhere((m) => m.id0 == machineId);
      var machineInputTotal = const MaterialSample();
      for (final input in machine.inputs) {
        final outputId = connections.keys.firstWhereOrNull(
          (key) => connections[key] == MachineInputId(machineId, input.id),
        );
        if (outputId == null) continue;
        final outputMaterial = outputs[outputId] ?? const MaterialSample();
        machineInputTotal = machineInputTotal + outputMaterial;
      }
      inputs[machineId] = machineInputTotal;

      for (final output in machine.outputs) {
        outputs[MachineOutputId(machineId, output.id)] =
            machineInputTotal * output.materialConversion;
      }
    }

    return MachineGraph(
      graph: graph,
      isValidated: isValid,
      inputs: inputs,
      outputs: outputs,
    );
  }
}
