import 'package:directed_graph/directed_graph.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simtech/constants/machines_icons.dart';
import 'package:simtech/models/grid.dart';
import 'package:simtech/models/machine.dart';
import 'package:simtech/models/machine_graph.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';
import 'package:simtech/models/rotatable_icon_data.dart';
import 'package:simtech/services/recycler_service.dart';
import 'package:simtech/ui/screens/recycler/grid_screen_model.dart';

final gridScreenSNProvider =
    StateNotifierProvider.autoDispose<GridScreenNotifier, GridScreenModel>(
  (ref) => throw UnimplementedError(),
);

class GridScreenNotifier extends StateNotifier<GridScreenModel> {
  GridScreenNotifier({
    required double feedWeight,
    required MaterialSample feedSample,
  }) : super(
          GridScreenModel(
            feedWeight: feedWeight,
            feedSample: feedSample,
            grid: Grid<Machine>(13, 14)
              ..setCell(
                6,
                0,
                cell: Machine(
                  id: 'feed',
                  name: 'feed',
                  icon: MachinesIcons.entrada.toRotatable(),
                  description: 'feed',
                  ports: {
                    AxisDirection.down: MachineOutput(
                      id: 'feed',
                      description: '',
                      type: MachineOutputType.one,
                      materialConversion: feedSample.map(
                        pm: (_) => const MaterialSample.pm(
                          ecal: 1,
                          filmePlastico: 1,
                          pet: 1,
                          petOleo: 1,
                          pead: 1,
                          plasticosMistos: 1,
                          metaisFerrosos: 1,
                          metaisNaoFerrosos: 1,
                          naoRecuperaveis: 1,
                        ),
                        pc: (_) => const MaterialSample.pc(
                          papel: 1,
                          cartao: 1,
                          jornaisRevistas: 1,
                          naoRecuperaveis: 1,
                        ),
                      ),
                    ),
                  },
                  isFixed: true,
                ),
              ),
            connections: {const MachineOutputId('feed0', 'feed'): null},
            graph: MachineGraph(graph: DirectedGraph({'feed0': {}})),
          ),
        );

  final Map<String, int> indexes = {};

  void removeMachine(Machine machine) {
    if (machine.isFixed) return;
    final newGrid = state.grid..remove(machine);
    final newConnections = <MachineOutputId, MachineInputId?>{
      for (final c in state.connections.entries
          .where((e) => e.key.machineId != machine.id0))
        if (c.value?.machineId == machine.id0) c.key: null else c.key: c.value,
    };
    state = state.copyWith(
      grid: newGrid,
      connections: newConnections,
      graph: RecyclerService.buildGraph(
        feedSample: state.feedSample.mulAll(state.feedWeight),
        machines: newGrid.getData(),
        connections: newConnections,
      ),
    );
  }

  void setMachine(int x, int y, {required Machine machine}) {
    if (machine.isFixed || y == 0) return;
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
          .where((e) => e.key.machineId != newMachine.id0))
        if (c.value?.machineId == newMachine.id0)
          c.key: null
        else
          c.key: c.value,
    };
    for (final direction in AxisDirection.values) {
      final port = newMachine.ports[direction];
      final otherMachine = state.grid.getCellFromDirection(x, y, direction);
      final otherPort = otherMachine?.ports[direction.reverse()];
      if (port is MachineInput) {
        final portId = MachineInputId(newMachine.id0, port.id);
        if (otherPort is MachineOutput) {
          final otherPortId = MachineOutputId(otherMachine!.id0, otherPort.id);
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
    state = state.copyWith(
      grid: newGrid,
      connections: newConnections,
      graph: RecyclerService.buildGraph(
        feedSample: state.feedSample.mulAll(state.feedWeight),
        machines: newGrid.getData(),
        connections: newConnections,
      ),
    );
  }

  void showFeedOptions() => state = state.copyWith(showFeedOptions: true);
  void hideFeedOptions() => state = state.copyWith(showFeedOptions: false);
  void setFeedOptions({
    required bool useDefault,
    required double weight,
    required MaterialSample sample,
  }) =>
      state = state.copyWith(
        useDefaultFeed: useDefault,
        feedWeight: weight,
        feedSample: sample,
        graph: RecyclerService.buildGraph(
          feedSample: sample.mulAll(weight),
          machines: state.grid.getData(),
          connections: state.connections,
        ),
      );

  void showMachineIOInfo(String machineId) =>
      state = state.copyWith(machineIOInfo: machineId);
  void hideMachineIOInfo() => state = state.copyWith(machineIOInfo: null);

  void showResults() => state = state.copyWith(showResults: true);
  void hideResults() => state = state.copyWith(showResults: false);
}
