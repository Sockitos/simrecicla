import 'package:flutter/material.dart';
import 'package:simtech/models/machine_definition.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';

const defaultWeight = 6000.0;

const defaultSample = MaterialSample(
  ecal: 0.1144,
  filmePlastico: 0.1584,
  pet: 0.1198,
  petOleo: 0.0038,
  pead: 0.1169,
  plasticosMistos: 0.1880,
  metaisFerrosos: 0.0244,
  metaisNaoFerrosos: 0.0065,
  naoRecuperaveis: 0.2678,
);

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
    outputs: [
      MachineOutput(
        id: 'out',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 1,
          filmePlastico: 1,
          pet: 1,
          petOleo: 1,
          pead: 1,
          plasticosMistos: 1,
          metaisFerrosos: 1,
          metaisNaoFerrosos: 1,
          naoRecuperaveis: 1,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'in')],
  ),
  MachineDefinition(
    id: 'JC',
    name: 'Junção de Caudais',
    icon: Icons.merge_outlined,
    description: '',
    outputs: [
      MachineOutput(
        id: 'JC',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 1,
          filmePlastico: 1,
          pet: 1,
          petOleo: 1,
          pead: 1,
          plasticosMistos: 1,
          metaisFerrosos: 1,
          metaisNaoFerrosos: 1,
          naoRecuperaveis: 1,
        ),
      ),
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
    outputs: [
      MachineOutput(
        id: 'BO_P',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 1,
          filmePlastico: 1,
          pet: 1,
          petOleo: 1,
          pead: 1,
          plasticosMistos: 1,
          metaisFerrosos: 1,
          metaisNaoFerrosos: 1,
          naoRecuperaveis: 1,
        ),
      )
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'COM',
    name: 'Compactador',
    icon: Icons.expand_outlined,
    description: '',
    outputs: [
      MachineOutput(
        id: 'COM_P',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 1,
          filmePlastico: 1,
          pet: 1,
          petOleo: 1,
          pead: 1,
          plasticosMistos: 1,
          metaisFerrosos: 1,
          metaisNaoFerrosos: 1,
          naoRecuperaveis: 1,
        ),
      )
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'DC',
    name: 'Crivo de Discos',
    icon: Icons.album_outlined,
    description: '',
    outputs: [
      MachineOutput(
        id: 'DS_CB_OS',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 0.5,
          filmePlastico: 0.5,
          pet: 0.5,
          petOleo: 0.5,
          pead: 0.5,
          plasticosMistos: 0.5,
          metaisFerrosos: 0.5,
          metaisNaoFerrosos: 0.5,
          naoRecuperaveis: 0.5,
        ),
      ),
      MachineOutput(
        id: 'DS_CB_US',
        type: MachineOutputType.two,
        materialConversion: MaterialSample(
          ecal: 0.5,
          filmePlastico: 0.5,
          pet: 0.5,
          petOleo: 0.5,
          pead: 0.5,
          plasticosMistos: 0.5,
          metaisFerrosos: 0.5,
          metaisNaoFerrosos: 0.5,
          naoRecuperaveis: 0.5,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'MG',
    name: 'Separador Magnético',
    icon: Icons.swap_horiz_outlined,
    description: '',
    outputs: [
      MachineOutput(
        id: 'MG_MAG',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 0.5,
          filmePlastico: 0.5,
          pet: 0.5,
          petOleo: 0.5,
          pead: 0.5,
          plasticosMistos: 0.5,
          metaisFerrosos: 0.5,
          metaisNaoFerrosos: 0.5,
          naoRecuperaveis: 0.5,
        ),
      ),
      MachineOutput(
        id: 'MG_NMAG',
        type: MachineOutputType.two,
        materialConversion: MaterialSample(
          ecal: 0.5,
          filmePlastico: 0.5,
          pet: 0.5,
          petOleo: 0.5,
          pead: 0.5,
          plasticosMistos: 0.5,
          metaisFerrosos: 0.5,
          metaisNaoFerrosos: 0.5,
          naoRecuperaveis: 0.5,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'ECS',
    name: 'Separador de Focault',
    icon: Icons.swap_horiz_outlined,
    description: '',
    outputs: [
      MachineOutput(
        id: 'ECS_COND',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 0.5,
          filmePlastico: 0.5,
          pet: 0.5,
          petOleo: 0.5,
          pead: 0.5,
          plasticosMistos: 0.5,
          metaisFerrosos: 0.5,
          metaisNaoFerrosos: 0.5,
          naoRecuperaveis: 0.5,
        ),
      ),
      MachineOutput(
        id: 'ECS_NCOND',
        type: MachineOutputType.two,
        materialConversion: MaterialSample(
          ecal: 0.5,
          filmePlastico: 0.5,
          pet: 0.5,
          petOleo: 0.5,
          pead: 0.5,
          plasticosMistos: 0.5,
          metaisFerrosos: 0.5,
          metaisNaoFerrosos: 0.5,
          naoRecuperaveis: 0.5,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'OS',
    name: 'Separador Ótico (PET & ECAL)',
    icon: Icons.visibility_outlined,
    description: '',
    outputs: [
      MachineOutput(
        id: 'OS_PETECAL_PET',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 0.33,
          filmePlastico: 0.33,
          pet: 0.33,
          petOleo: 0.33,
          pead: 0.33,
          plasticosMistos: 0.33,
          metaisFerrosos: 0.33,
          metaisNaoFerrosos: 0.33,
          naoRecuperaveis: 0.33,
        ),
      ),
      MachineOutput(
        id: 'OS_PETECAL_ECAL',
        type: MachineOutputType.two,
        materialConversion: MaterialSample(
          ecal: 0.33,
          filmePlastico: 0.33,
          pet: 0.33,
          petOleo: 0.33,
          pead: 0.33,
          plasticosMistos: 0.33,
          metaisFerrosos: 0.33,
          metaisNaoFerrosos: 0.33,
          naoRecuperaveis: 0.33,
        ),
      ),
      MachineOutput(
        id: 'OS_PETECAL_NB',
        type: MachineOutputType.three,
        materialConversion: MaterialSample(
          ecal: 0.34,
          filmePlastico: 0.34,
          pet: 0.34,
          petOleo: 0.34,
          pead: 0.34,
          plasticosMistos: 0.34,
          metaisFerrosos: 0.34,
          metaisNaoFerrosos: 0.34,
          naoRecuperaveis: 0.34,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'ECS',
    name: 'Separador de Ótico (PEAD & MISTOS)',
    icon: Icons.visibility_outlined,
    description: '',
    outputs: [
      MachineOutput(
        id: 'ECS_COND',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 0.5,
          filmePlastico: 0.5,
          pet: 0.5,
          petOleo: 0.5,
          pead: 0.5,
          plasticosMistos: 0.5,
          metaisFerrosos: 0.5,
          metaisNaoFerrosos: 0.5,
          naoRecuperaveis: 0.5,
        ),
      ),
      MachineOutput(
        id: 'ECS_NCOND',
        type: MachineOutputType.two,
        materialConversion: MaterialSample(
          ecal: 0.5,
          filmePlastico: 0.5,
          pet: 0.5,
          petOleo: 0.5,
          pead: 0.5,
          plasticosMistos: 0.5,
          metaisFerrosos: 0.5,
          metaisNaoFerrosos: 0.5,
          naoRecuperaveis: 0.5,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'BS',
    name: 'Separador Balístico',
    icon: Icons.swap_horiz_outlined,
    description: '',
    outputs: [
      MachineOutput(
        id: 'BS_PCK_2D',
        type: MachineOutputType.one,
        materialConversion: MaterialSample(
          ecal: 0.33,
          filmePlastico: 0.33,
          pet: 0.33,
          petOleo: 0.33,
          pead: 0.33,
          plasticosMistos: 0.33,
          metaisFerrosos: 0.33,
          metaisNaoFerrosos: 0.33,
          naoRecuperaveis: 0.33,
        ),
      ),
      MachineOutput(
        id: 'BS_PCK_F',
        type: MachineOutputType.two,
        materialConversion: MaterialSample(
          ecal: 0.33,
          filmePlastico: 0.33,
          pet: 0.33,
          petOleo: 0.33,
          pead: 0.33,
          plasticosMistos: 0.33,
          metaisFerrosos: 0.33,
          metaisNaoFerrosos: 0.33,
          naoRecuperaveis: 0.33,
        ),
      ),
      MachineOutput(
        id: 'BS_PCK_3D',
        type: MachineOutputType.three,
        materialConversion: MaterialSample(
          ecal: 0.34,
          filmePlastico: 0.34,
          pet: 0.34,
          petOleo: 0.34,
          pead: 0.34,
          plasticosMistos: 0.34,
          metaisFerrosos: 0.34,
          metaisNaoFerrosos: 0.34,
          naoRecuperaveis: 0.34,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
];