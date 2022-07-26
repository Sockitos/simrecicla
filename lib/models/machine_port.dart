import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/models/material_sample.dart';

part 'machine_port.freezed.dart';

enum MachineOutputType {
  one,
  two,
  three,
}

@freezed
class MachinePort with _$MachinePort {
  const factory MachinePort.input({required String id}) = MachineInput;
  const factory MachinePort.output({
    required String id,
    required String description,
    required MachineOutputType type,
    required MaterialSample materialConversion,
  }) = MachineOutput;
}

@freezed
class MachineInputId with _$MachineInputId {
  const factory MachineInputId(
    String machineId,
    String id,
  ) = _MachineInputId;
}

@freezed
class MachineOutputId with _$MachineOutputId {
  const factory MachineOutputId(
    String machineId,
    String id,
  ) = _MachineOutputId;
}
