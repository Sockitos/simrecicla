import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/src/models/machine_output.dart';

part 'machine.freezed.dart';
part 'machine.g.dart';

@freezed
class Machine with _$Machine {
  const factory Machine({
    required String name,
    required String description,
    @JsonKey(name: 'input_count') required int inputCount,
    required List<MachineOutput> outputs,
  }) = _Machine;
  const Machine._();

  factory Machine.fromJson(Map<String, dynamic> json) =>
      _$MachineFromJson(json);
}
