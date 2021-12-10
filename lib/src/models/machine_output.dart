import 'package:freezed_annotation/freezed_annotation.dart';

part 'machine_output.freezed.dart';
part 'machine_output.g.dart';

@freezed
class MachineOutput with _$MachineOutput {
  const factory MachineOutput({
    required String id,
  }) = _MachineOutput;
  const MachineOutput._();

  factory MachineOutput.fromJson(Map<String, dynamic> json) =>
      _$MachineOutputFromJson(json);
}
