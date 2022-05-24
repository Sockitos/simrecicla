import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/src/models/material_sample.dart';

part 'machine_port.freezed.dart';
part 'machine_port.g.dart';

@freezed
class MachinePort with _$MachinePort {
  const factory MachinePort.input({required String id}) = MachineInput;
  const factory MachinePort.output({
    required String id,
    @Default(MaterialSample(argila: 0, madeira: 0, ferro: 0))
        MaterialSample materialConversion,
  }) = MachineOutput;

  factory MachinePort.fromJson(Map<String, dynamic> json) =>
      _$MachinePortFromJson(json);
}
