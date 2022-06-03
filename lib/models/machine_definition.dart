import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/models/machine.dart';
import 'package:simtech/models/machine_port.dart';

part 'machine_definition.freezed.dart';
// part 'machine_definition.g.dart';

@freezed
class MachineDefinition with _$MachineDefinition {
  const factory MachineDefinition({
    required String id,
    required String name,
    required IconData icon,
    required String description,
    required List<MachineInput> inputs,
    required List<MachineOutput> outputs,
  }) = _MachineDefinition;
  const MachineDefinition._();

  // factory MachineDefinition.fromJson(Map<String, dynamic> json) =>
  //     _$MachineDefinitionFromJson(json);

  List<Machine> getMachineVersions() {
    final machines = <Machine>[];
    final ports = [...inputs, ...outputs];
    switch (ports.length) {
      case 1:
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {AxisDirection.up: ports[0]},
          ),
        );
        break;
      case 2:
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.right: ports[1],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[1],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.down: ports[1],
            },
          ),
        );
        break;
      case 3:
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[1],
              AxisDirection.right: ports[2],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[2],
              AxisDirection.right: ports[1],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[1],
              AxisDirection.left: ports[0],
              AxisDirection.right: ports[2],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[1],
              AxisDirection.left: ports[2],
              AxisDirection.right: ports[0],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[2],
              AxisDirection.left: ports[0],
              AxisDirection.right: ports[1],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[2],
              AxisDirection.left: ports[1],
              AxisDirection.right: ports[0],
            },
          ),
        );
        break;
      case 4:
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[1],
              AxisDirection.right: ports[2],
              AxisDirection.down: ports[3],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[1],
              AxisDirection.right: ports[3],
              AxisDirection.down: ports[2],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[2],
              AxisDirection.right: ports[1],
              AxisDirection.down: ports[3],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[2],
              AxisDirection.right: ports[3],
              AxisDirection.down: ports[1],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[3],
              AxisDirection.right: ports[1],
              AxisDirection.down: ports[2],
            },
          ),
        );
        machines.add(
          Machine(
            id: id,
            name: name,
            icon: icon,
            description: description,
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[3],
              AxisDirection.right: ports[2],
              AxisDirection.down: ports[1],
            },
          ),
        );
        break;
      default:
        throw Exception();
    }

    return machines;
  }
}
