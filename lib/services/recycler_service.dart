import 'package:collection/collection.dart';
import 'package:directed_graph/directed_graph.dart';
import 'package:simtech/models/recycler/machine.dart';
import 'package:simtech/models/recycler/machine_graph.dart';
import 'package:simtech/models/recycler/machine_port.dart';
import 'package:simtech/models/recycler/material_sample.dart';

class RecyclerService {
  const RecyclerService._();

  static MachineGraph buildGraph({
    required MaterialSample feedSample,
    required List<Machine> machines,
    required Map<MachineOutputId, MachineInputId?> connections,
  }) {
    final edges = <String, Set<String>>{};
    for (final entry in connections.entries) {
      final outputId = entry.key;
      final inputId = entry.value;
      edges.update(
        outputId.machineId,
        (value) => {
          ...value,
          if (inputId?.machineId != null) inputId!.machineId,
        },
        ifAbsent: () => {
          if (inputId?.machineId != null) inputId!.machineId,
        },
      );
    }
    final graph = DirectedGraph<String>(
      edges,
      comparator: (a, b) => a.compareTo(b),
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

    final calculationOrder = graph.topologicalOrdering;
    if (calculationOrder == null) isValid = false;

    if (!isValid) {
      return MachineGraph(
        graph: graph,
        isValidated: isValid,
      );
    }

    final inputs = <String, MaterialSample>{};
    final outputs = <MachineOutputId, MaterialSample>{
      const MachineOutputId('feed0', 'feed'): feedSample,
    };
    for (final machineId in calculationOrder!) {
      if (machineId == 'feed0') continue;
      final machine = machines.firstWhere((m) => m.id0 == machineId);
      MaterialSample? machineInputTotal;

      for (final input in machine.inputs) {
        final outputId = connections.keys.firstWhereOrNull(
          (key) => connections[key] == MachineInputId(machineId, input.id),
        );
        if (outputId == null) continue;
        final outputMaterial = outputs[outputId];
        if (outputMaterial != null) {
          if (machineInputTotal == null) {
            machineInputTotal = outputMaterial;
          } else {
            machineInputTotal += outputMaterial;
          }
        }
      }
      if (machineInputTotal != null) {
        inputs[machineId] = machineInputTotal;
        for (final output in machine.outputs) {
          outputs[MachineOutputId(machineId, output.id)] =
              machineInputTotal * output.materialConversion;
        }
      }
    }

    return MachineGraph(
      graph: graph,
      isValidated: isValid,
      inputs: inputs,
    );
  }
}
