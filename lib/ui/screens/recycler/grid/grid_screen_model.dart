import 'package:directed_graph/directed_graph.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simrecicla/constants/machines_icons.dart';
import 'package:simrecicla/data/recycler_data.dart';
import 'package:simrecicla/models/recycler/grid.dart';
import 'package:simrecicla/models/recycler/machine.dart';
import 'package:simrecicla/models/recycler/machine_graph.dart';
import 'package:simrecicla/models/recycler/machine_port.dart';
import 'package:simrecicla/models/recycler/material_sample.dart';
import 'package:simrecicla/models/recycler/rotatable_icon_data.dart';
import 'package:simrecicla/services/recycler_service.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/draggable_machine.dart';
import 'package:simrecicla/ui/screens/recycler/grid/grid_screen.dart';

part 'grid_screen_model.freezed.dart';

final gridScreenSNProvider =
    StateNotifierProvider.autoDispose<GridScreenNotifier, GridScreenModel>(
  (ref) => GridScreenNotifier(type: ref.watch(typeProvider)),
  dependencies: [typeProvider],
);

@freezed
class GridScreenModel with _$GridScreenModel {
  const factory GridScreenModel({
    required GridType type,
    required Grid<Machine> grid,
    @Default(<MachineOutputId, MachineInputId?>{})
    Map<MachineOutputId, MachineInputId?> connections,
    @Default(true) bool useDefaultFeed,
    required double feedWeight,
    required MaterialSample feedSample,
    required MachineGraph graph,
  }) = _GridScreenModel;
  const GridScreenModel._();

  factory GridScreenModel.pc() => GridScreenModel(
        type: GridType.pc,
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
                AxisDirection.down: const MachineOutput(
                  id: 'feed',
                  description: '',
                  type: MachineOutputType.one,
                  materialConversion: MaterialSample.pc(
                    papel: 1,
                    cartao: 1,
                    jornaisRevistas: 1,
                    naoRecuperaveis: 1,
                  ),
                ),
              },
              isFixed: true,
            ),
          ),
        feedWeight: RecyclerData.defaultWeight,
        feedSample: RecyclerData.defaultSamplePC,
        connections: {const MachineOutputId('feed0', 'feed'): null},
        graph: MachineGraph(graph: DirectedGraph({'feed0': {}})),
      );

  factory GridScreenModel.pm() => GridScreenModel(
        type: GridType.pm,
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
                AxisDirection.down: const MachineOutput(
                  id: 'feed',
                  description: '',
                  type: MachineOutputType.one,
                  materialConversion: MaterialSample.pm(
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
                ),
              },
              isFixed: true,
            ),
          ),
        feedWeight: RecyclerData.defaultWeight,
        feedSample: RecyclerData.defaultSamplePM,
        connections: {const MachineOutputId('feed0', 'feed'): null},
        graph: MachineGraph(graph: DirectedGraph({'feed0': {}})),
      );

  double get defaultWeight => RecyclerData.defaultWeight;
  MaterialSample get defaultSample => type == GridType.pc
      ? RecyclerData.defaultSamplePC
      : RecyclerData.defaultSamplePM;

  MachineState getMachineState(String machineId) =>
      graph.graph.vertices.contains(machineId)
          ? graph.isValidated
              ? MachineState.validated
              : MachineState.connected
          : MachineState.disconnected;
}

class GridScreenNotifier extends StateNotifier<GridScreenModel> {
  GridScreenNotifier({
    required GridType type,
  }) : super(type == GridType.pc ? GridScreenModel.pc() : GridScreenModel.pm());

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
}
