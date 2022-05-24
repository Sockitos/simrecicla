import 'package:flutter/material.dart';
import 'package:simtech/src/models/machine_definition.dart';
import 'package:simtech/src/models/machine_port.dart';

const machines = <MachineDefinition>[
  MachineDefinition(
    id: 'F',
    name: 'Produto Final',
    icon: Icons.flag_outlined,
    description: '',
    outputs: [],
    inputs: [MachineInput(id: 'final')],
  ),
  MachineDefinition(
    id: 'P',
    name: 'Passadeira',
    icon: Icons.double_arrow_outlined,
    description: '',
    outputs: [MachineOutput(id: 'out')],
    inputs: [MachineInput(id: 'in')],
  ),
  MachineDefinition(
    id: 'JC',
    name: 'Junção de Caudais',
    icon: Icons.merge_outlined,
    description: '',
    outputs: [
      MachineOutput(id: 'JC'),
    ],
    inputs: [
      MachineInput(id: 'feed1'),
      MachineInput(id: 'feed2'),
      MachineInput(id: 'feed3'),
    ],
  ),
  MachineDefinition(
    id: 'BO',
    name: 'Abre-Sacos',
    icon: Icons.shopping_bag_outlined,
    description: '',
    outputs: [MachineOutput(id: 'BO_P')],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'COM',
    name: 'Compactador',
    icon: Icons.expand_outlined,
    description: '',
    outputs: [MachineOutput(id: 'COM_P')],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'DC',
    name: 'Crivo de Discos',
    icon: Icons.album_outlined,
    description: '',
    outputs: [
      MachineOutput(id: 'DS_CB_OS'),
      MachineOutput(id: 'DS_CB_US'),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'MG',
    name: 'Separador Magnético',
    icon: Icons.swap_horiz_outlined,
    description: '',
    outputs: [
      MachineOutput(id: 'MG_MAG'),
      MachineOutput(id: 'MG_NMAG'),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'ECS',
    name: 'Separador de Focault',
    icon: Icons.swap_horiz_outlined,
    description: '',
    outputs: [
      MachineOutput(id: 'ECS_COND'),
      MachineOutput(id: 'ECS_NCOND'),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'OS',
    name: 'Separador Ótico (PET & ECAL)',
    icon: Icons.visibility_outlined,
    description: '',
    outputs: [
      MachineOutput(id: 'OS_PETECAL_PET'),
      MachineOutput(id: 'OS_PETECAL_ECAL'),
      MachineOutput(id: 'OS_PETECAL_NB'),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'ECS',
    name: 'Separador de Ótico (PEAD & MISTOS)',
    icon: Icons.visibility_outlined,
    description: '',
    outputs: [
      MachineOutput(id: 'ECS_COND'),
      MachineOutput(id: 'ECS_NCOND'),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'BS',
    name: 'Separador Balístico',
    icon: Icons.swap_horiz_outlined,
    description: '',
    outputs: [
      MachineOutput(id: 'BS_PCK_2D'),
      MachineOutput(id: 'BS_PCK_F'),
      MachineOutput(id: 'BS_PCK_3D'),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
];
