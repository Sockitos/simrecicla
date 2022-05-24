import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simtech/src/models/grid.dart';
import 'package:simtech/src/models/machine.dart';
import 'package:simtech/src/models/machine_port.dart';
import 'package:simtech/src/ui/screens/recycler/grid_screen_model.dart';

final gridScreenSNProvider =
    StateNotifierProvider.autoDispose<GridScreenNotifier, GridScreenModel>(
        (ref) {
  return GridScreenNotifier();
});

class GridScreenNotifier extends StateNotifier<GridScreenModel> {
  GridScreenNotifier()
      : super(
          GridScreenModel(
            grid: Grid<Machine>(13, 13)
              ..setCell(
                6,
                0,
                cell: const Machine(
                  id: 'feed',
                  name: 'feed',
                  icon: Icons.stream_outlined,
                  description: 'feed',
                  ports: {AxisDirection.down: MachineOutput(id: 'feed')},
                  isFixed: true,
                ),
              ),
            connections: {const MachineOutputId('feed0', 'feed'): null},
          ),
        );

  final Map<String, int> indexes = {};

  void removeMachine(Machine machine) {
    if (machine.isFixed) return;
    final newGrid = state.grid..remove(machine);
    final newConnections = <MachineOutputId, MachineInputId?>{
      for (final c
          in state.connections.entries.where((e) => e.key.item1 != machine.id0))
        if (c.value?.item1 == machine.id0) c.key: null else c.key: c.value,
    };
    state = state.copyWith(
      grid: newGrid,
      connections: newConnections,
    );
  }

  void setMachine(int x, int y, {required Machine machine}) {
    if (machine.isFixed) return;
    if (indexes[machine.id] == null) indexes[machine.id] = 0;
    if (machine.index == 0) indexes[machine.id] = indexes[machine.id]! + 1;
    final newMachine = machine.index == 0
        ? machine.copyWith(
            index: indexes[machine.id]!,
          )
        : machine;
    final newGrid = state.grid
      ..remove(newMachine)
      ..setCell(x, y, cell: newMachine);
    var newConnections = <MachineOutputId, MachineInputId?>{
      for (final c in state.connections.entries
          .where((e) => e.key.item1 != newMachine.id0))
        if (c.value?.item1 == newMachine.id0) c.key: null else c.key: c.value,
    };
    for (final direction in AxisDirection.values) {
      final port = newMachine.ports[direction];
      final otherMachine = state.grid.getCellFromDirection(x, y, direction);
      final otherPort = otherMachine?.ports[direction.reverse()];
      if (port is MachineInput) {
        final portId = MachineInputId(newMachine.id0, port.id);
        if (otherPort is MachineOutput) {
          final otherPortId = MachineInputId(otherMachine!.id0, otherPort.id);
          newConnections = {
            ...newConnections,
            otherPortId: portId,
          };
        }
      } else if (port is MachineOutput) {
        final portId = MachineOutputId(newMachine.id0, port.id);
        newConnections = {
          ...newConnections,
          portId: null,
        };
        if (otherPort is MachineInput) {
          final otherPortId = MachineInputId(otherMachine!.id0, otherPort.id);
          newConnections = {
            ...newConnections,
            portId: otherPortId,
          };
        }
      }
    }
    state = GridScreenModel(grid: newGrid, connections: newConnections);
  }
}
