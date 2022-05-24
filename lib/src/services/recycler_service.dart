import 'dart:developer';

import 'package:directed_graph/directed_graph.dart';
import 'package:simtech/src/data/recycler_data.dart';
import 'package:simtech/src/models/machine.dart';
import 'package:simtech/src/models/machine_definition.dart';
import 'package:simtech/src/models/material_sample.dart';
import 'package:simtech/src/ui/screens/recycler/grid_screen_model.dart';

class RecyclerService {
  static List<MachineDefinition> getMachines() => machines;
  static void runSimulation({
    required List<Machine> machines,
    required Map<MachineOutputId, MachineInputId?> connections,
  }) {
    int comparator(String s1, String s2) => s1.compareTo(s2);

    final edges = <String, Set<String>>{};

    for (final entry in connections.entries) {
      edges.update(
        entry.key.item1,
        (value) => {
          ...value,
          if (entry.value?.item1 != null) entry.value!.item1,
        },
        ifAbsent: () => {
          if (entry.value?.item1 != null) entry.value!.item1,
        },
      );
    }

    final graph = DirectedGraph<String>(
      edges,
      comparator: comparator,
    );

    final calculationOrder = graph.topologicalOrdering!;

    if (calculationOrder.first != 'FEED') log('OOPS');

    final outputs = <MachineOutputId, MaterialSample>{
      const MachineOutputId('FEED', 'FEED'): const MaterialSample(
        madeira: 100,
        argila: 100,
        ferro: 100,
      ),
    };
    for (final machineId in calculationOrder) {
      log(machineId);
      if (machineId == 'FEED') continue;
      final machine = machines.firstWhere((m) => m.id == machineId);
      var machineInputTotal =
          const MaterialSample(madeira: 0, argila: 0, ferro: 0);
      for (final input in machine.inputs) {
        final outputId = connections.keys.firstWhere(
          (key) => connections[key] == MachineInputId(machineId, input.id),
        );
        final outputMaterial = outputs[outputId]!;
        machineInputTotal = MaterialSample(
          madeira: machineInputTotal.madeira + outputMaterial.madeira,
          argila: machineInputTotal.argila + outputMaterial.argila,
          ferro: machineInputTotal.ferro + outputMaterial.ferro,
        );
      }

      if (machine.outputs.isEmpty) {
        log('${machine.name}: $machineInputTotal');
      } else {
        for (final output in machine.outputs) {
          outputs[MachineOutputId(machineId, output.id)] = MaterialSample(
            madeira:
                machineInputTotal.madeira * output.materialConversion.madeira,
            argila: machineInputTotal.argila * output.materialConversion.argila,
            ferro: machineInputTotal.ferro * output.materialConversion.ferro,
          );
        }
      }
    }
  }
}
