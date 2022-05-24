import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/src/models/grid.dart';
import 'package:simtech/src/models/machine.dart';
import 'package:tuple/tuple.dart';

part 'grid_screen_model.freezed.dart';

typedef MachineOutputId = Tuple2<String, String>;
typedef MachineInputId = Tuple2<String, String>;

@freezed
class GridScreenModel with _$GridScreenModel {
  const factory GridScreenModel({
    required Grid<Machine> grid,
    @Default(<MachineOutputId, MachineInputId?>{})
        Map<MachineOutputId, MachineInputId?> connections,
  }) = _Answer;
}
