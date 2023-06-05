import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simrecicla/models/recycler/machine.dart';
import 'package:simrecicla/models/recycler/machine_port.dart';
import 'package:simrecicla/models/recycler/rotatable_icon_data.dart';

part 'machine_definition.freezed.dart';

@freezed
class MachineDefinition with _$MachineDefinition {
  const factory MachineDefinition({
    required String id,
    required String name,
    required List<RotatableIconData> icons,
    required String description,
    required List<MachineInput> inputs,
    required List<MachineOutput> outputs,
  }) = _MachineDefinition;
  const MachineDefinition._();

  IconData get icon => icons.first.icon;

  List<Machine> getMachineVersions() {
    final machines = <Machine>[];
    final ports = [...inputs, ...outputs];
    final machine = Machine(
      id: id,
      name: name,
      icon: icons.first,
      description: description,
      ports: {},
    );
    switch (ports.length) {
      case 1:
        machines.add(
          machine.copyWith(
            ports: {AxisDirection.up: ports[0]},
          ),
        );
      case 2:
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.down: ports[1],
            },
          ),
        );
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[1],
            },
            icon: icons[min(1, icons.length - 1)],
          ),
        );
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.right: ports[1],
            },
            icon: icons[min(2, icons.length - 1)],
          ),
        );
      case 3:
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[1],
              AxisDirection.right: ports[2],
            },
          ),
        );
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[2],
              AxisDirection.right: ports[1],
            },
            icon: icons[min(1, icons.length - 1)],
          ),
        );
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.right: ports[1],
              AxisDirection.down: ports[2],
            },
            icon: icons[min(2, icons.length - 1)],
          ),
        );
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[1],
              AxisDirection.down: ports[2],
            },
            icon: icons[min(3, icons.length - 1)],
          ),
        );
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.right: ports[2],
              AxisDirection.down: ports[1],
            },
            icon: icons[min(4, icons.length - 1)],
          ),
        );
        machines.add(
          machine.copyWith(
            ports: {
              AxisDirection.up: ports[0],
              AxisDirection.left: ports[2],
              AxisDirection.down: ports[1],
            },
            icon: icons[min(5, icons.length - 1)],
          ),
        );
      case 4:
        if (inputs.length == 3) {
          machines.add(
            machine.copyWith(
              ports: {
                AxisDirection.up: ports[0],
                AxisDirection.left: ports[1],
                AxisDirection.right: ports[2],
                AxisDirection.down: ports[3],
              },
            ),
          );
        } else {
          machines.add(
            machine.copyWith(
              ports: {
                AxisDirection.up: ports[0],
                AxisDirection.left: ports[1],
                AxisDirection.right: ports[2],
                AxisDirection.down: ports[3],
              },
            ),
          );
          machines.add(
            machine.copyWith(
              ports: {
                AxisDirection.up: ports[0],
                AxisDirection.left: ports[1],
                AxisDirection.right: ports[3],
                AxisDirection.down: ports[2],
              },
              icon: icons[min(1, icons.length - 1)],
            ),
          );
          machines.add(
            machine.copyWith(
              ports: {
                AxisDirection.up: ports[0],
                AxisDirection.left: ports[2],
                AxisDirection.right: ports[1],
                AxisDirection.down: ports[3],
              },
              icon: icons[min(2, icons.length - 1)],
            ),
          );
          machines.add(
            machine.copyWith(
              description: description,
              ports: {
                AxisDirection.up: ports[0],
                AxisDirection.left: ports[2],
                AxisDirection.right: ports[3],
                AxisDirection.down: ports[1],
              },
              icon: icons[min(3, icons.length - 1)],
            ),
          );
          machines.add(
            machine.copyWith(
              ports: {
                AxisDirection.up: ports[0],
                AxisDirection.left: ports[3],
                AxisDirection.right: ports[1],
                AxisDirection.down: ports[2],
              },
              icon: icons[min(3, icons.length - 1)],
            ),
          );
          machines.add(
            machine.copyWith(
              ports: {
                AxisDirection.up: ports[0],
                AxisDirection.left: ports[3],
                AxisDirection.right: ports[2],
                AxisDirection.down: ports[1],
              },
              icon: icons[min(4, icons.length - 1)],
            ),
          );
        }
      default:
        throw Exception();
    }

    return machines;
  }
}
