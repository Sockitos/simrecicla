import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/data/recycler_data.dart';
import 'package:simtech/models/grid.dart';
import 'package:simtech/models/machine.dart';
import 'package:simtech/models/machine_graph.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';

part 'grid_screen_model.freezed.dart';

@freezed
class GridScreenModel with _$GridScreenModel {
  const factory GridScreenModel({
    required Grid<Machine> grid,
    @Default(<MachineOutputId, MachineInputId?>{})
        Map<MachineOutputId, MachineInputId?> connections,
    @Default(false) bool showFeedOptions,
    @Default(true) bool useDefaultFeed,
    @Default(defaultWeight) double feedWeight,
    @Default(defaultSample) MaterialSample feedSample,
    @Default(null) String? machineIOInfo,
    required MachineGraph graph,
    @Default(false) bool showResults,
  }) = _GridScreenModel;
}
