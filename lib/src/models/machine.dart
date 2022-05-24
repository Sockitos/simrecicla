import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/src/models/machine_port.dart';

part 'machine.freezed.dart';

@freezed
class Machine with _$Machine {
  const factory Machine({
    required String id,
    @Default(0) int index,
    required String name,
    required IconData icon,
    required String description,
    required Map<AxisDirection, MachinePort?> ports,
    @Default(false) bool isFixed,
  }) = _Machine;
  const Machine._();

  String get id0 => '$id$index';

  MachinePort? get topPort => ports[AxisDirection.up];
  MachinePort? get leftPort => ports[AxisDirection.left];
  MachinePort? get bottomPort => ports[AxisDirection.down];
  MachinePort? get rightPort => ports[AxisDirection.right];

  List<MachineInput> get inputs =>
      List<MachineInput>.from(ports.values.whereType<MachineInput>());
  List<MachineOutput> get outputs =>
      List<MachineOutput>.from(ports.values.whereType<MachineOutput>());

  Machine rotate() {
    return copyWith(
      ports: {
        AxisDirection.up: ports[AxisDirection.left],
        AxisDirection.left: ports[AxisDirection.down],
        AxisDirection.down: ports[AxisDirection.right],
        AxisDirection.right: ports[AxisDirection.up],
      },
    );
  }

  bool isCompatible(AxisDirection direction, Machine? other) {
    if (other == null) return true;
    if (id0 == other.id0) return true;
    final port = ports[direction];
    final otherPort = other.ports[direction.reverse()];
    return _portsAreCompatible(port, otherPort);
  }

  bool _portsAreCompatible(MachinePort? port1, MachinePort? port2) {
    if (port1 is MachineInput) {
      return true;
    } else if (port1 is MachineOutput) {
      return port2 is MachineInput;
    } else {
      return port2 == null || port2 is MachineInput;
    }
  }
}

extension AxisDirectionX on AxisDirection {
  AxisDirection reverse() {
    switch (this) {
      case AxisDirection.up:
        return AxisDirection.down;
      case AxisDirection.left:
        return AxisDirection.right;
      case AxisDirection.down:
        return AxisDirection.up;
      case AxisDirection.right:
        return AxisDirection.left;
    }
  }
}
