import 'package:flutter/material.dart';
import 'package:simtech/models/machine_definition.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';

const defaultWeight = 6000.0;

const defaultSamplePM = MaterialSamplePM(
  ecal: 0.0690,
  filmePlastico: 0.0935,
  pet: 0.1158,
  petOleo: 0.0158,
  pead: 0.0593,
  plasticosMistos: 0.2370,
  metaisFerrosos: 0.0440,
  metaisNaoFerrosos: 0.0143,
  naoRecuperaveis: 0.3514,
);

const machinesPM = <MachineDefinition>[
  MachineDefinition(
    id: 'F',
    name: 'Produto Final',
    icon: Icons.flag_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [],
    inputs: [MachineInput(id: 'final')],
  ),
  MachineDefinition(
    id: 'P',
    name: 'Passadeira',
    icon: Icons.double_arrow_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'out',
        description: '',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
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
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'JC',
        description: '',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
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
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'BO_P',
        description: '',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
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
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'COM_P',
        description: '',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
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
    id: 'MG',
    name: 'Separador Magnético',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'MG_MAG',
        description: 'Fluxo de materiais Magnéticos',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
          ecal: 0.0064,
          filmePlastico: 0.0136,
          pet: 0.0034,
          petOleo: 0.0100,
          pead: 0.0011,
          plasticosMistos: 0.0072,
          metaisFerrosos: 0.9484,
          metaisNaoFerrosos: 0.0014,
          naoRecuperaveis: 0.0066,
        ),
      ),
      MachineOutput(
        id: 'MG_NMAG',
        description: 'Fluxo de materiais Não-Magnéticos',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePM(
          ecal: 0.9936,
          filmePlastico: 0.9864,
          pet: 0.9966,
          petOleo: 0.9900,
          pead: 0.9989,
          plasticosMistos: 0.9928,
          metaisFerrosos: 0.0516,
          metaisNaoFerrosos: 0.9986,
          naoRecuperaveis: 0.9934,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'ECS',
    name: 'Separador de Focault',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'ECS_COND',
        description: 'Fluxo de materiais Condutores',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
          ecal: 0.0160,
          filmePlastico: 0.0023,
          pet: 0.0017,
          petOleo: 0,
          pead: 0.0002,
          plasticosMistos: 0.0087,
          metaisFerrosos: 0.0169,
          metaisNaoFerrosos: 0.8132,
          naoRecuperaveis: 0.0042,
        ),
      ),
      MachineOutput(
        id: 'ECS_NCOND',
        description: 'Fluxo de materiais Não-Condutores',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePM(
          ecal: 0.9840,
          filmePlastico: 0.9977,
          pet: 0.9983,
          petOleo: 1,
          pead: 0.9998,
          plasticosMistos: 0.9913,
          metaisFerrosos: 0.9831,
          metaisNaoFerrosos: 0.1868,
          naoRecuperaveis: 0.9958,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'OS_PETECAL',
    name: 'Separador Ótico (PET & ECAL)',
    icon: Icons.visibility_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'OS_PETECAL_PET',
        description: 'Fluxo de materiais Alvo 1 (PET)',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
          ecal: 0.0010,
          filmePlastico: 0.0009,
          pet: 0.7827,
          petOleo: 0.0036,
          pead: 0.0013,
          plasticosMistos: 0.0010,
          metaisFerrosos: 0.0006,
          metaisNaoFerrosos: 0.0034,
          naoRecuperaveis: 0.0087,
        ),
      ),
      MachineOutput(
        id: 'OS_PETECAL_ECAL',
        description: 'Fluxo de materiais Alvo 2 (ECAL)',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePM(
          ecal: 0.5564,
          filmePlastico: 0.0012,
          pet: 0.0009,
          petOleo: 0,
          pead: 0.0010,
          plasticosMistos: 0.0014,
          metaisFerrosos: 0.0031,
          metaisNaoFerrosos: 0.0024,
          naoRecuperaveis: 0.0016,
        ),
      ),
      MachineOutput(
        id: 'OS_PETECAL_NB',
        description: 'Fluxo de materiais Não-Alvo (Resto)',
        type: MachineOutputType.three,
        materialConversion: MaterialSamplePM(
          ecal: 0.4426,
          filmePlastico: 0.9979,
          pet: 0.2164,
          petOleo: 0.9964,
          pead: 0.9978,
          plasticosMistos: 0.9976,
          metaisFerrosos: 0.9962,
          metaisNaoFerrosos: 0.9941,
          naoRecuperaveis: 0.9897,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'OS_PEADMIX',
    name: 'Separador de Ótico (PEAD & MISTOS)',
    icon: Icons.visibility_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'OS_PEADMIX_PEAD',
        description: 'Fluxo de materiais Alvo 1 (PEAD)',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
          ecal: 0.0006,
          filmePlastico: 0.0007,
          pet: 0.0032,
          petOleo: 0.0003,
          pead: 0.3273,
          plasticosMistos: 0.0019,
          metaisFerrosos: 0.0006,
          metaisNaoFerrosos: 0,
          naoRecuperaveis: 0.0010,
        ),
      ),
      MachineOutput(
        id: 'OS_PEADMIX_MIX',
        description: 'Fluxo de materiais Alvo 2 (Plásticos Mistos)',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePM(
          ecal: 0.0055,
          filmePlastico: 0.0022,
          pet: 0.0304,
          petOleo: 0.0046,
          pead: 0.0032,
          plasticosMistos: 0.3776,
          metaisFerrosos: 0.0057,
          metaisNaoFerrosos: 0.0085,
          naoRecuperaveis: 0.0182,
        ),
      ),
      MachineOutput(
        id: 'OS_PEADMIX_NB',
        description: 'Fluxo de materiais Não-Alvo (Resto)',
        type: MachineOutputType.three,
        materialConversion: MaterialSamplePM(
          ecal: 0.9940,
          filmePlastico: 0.9971,
          pet: 0.9664,
          petOleo: 0.9952,
          pead: 0.6695,
          plasticosMistos: 0.6205,
          metaisFerrosos: 0.9937,
          metaisNaoFerrosos: 0.9915,
          naoRecuperaveis: 0.9808,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'BS',
    name: 'Separador Balístico',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'BS_PM_2D',
        description: 'Fluxo de materiais Planares (2D)',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
          ecal: 0.3604,
          filmePlastico: 0.7162,
          pet: 0.0460,
          petOleo: 0.0202,
          pead: 0.0429,
          plasticosMistos: 0.4667,
          metaisFerrosos: 0.1225,
          metaisNaoFerrosos: 0.2307,
          naoRecuperaveis: 0.3274,
        ),
      ),
      MachineOutput(
        id: 'BS_PM_F',
        description: 'Fluxo de materiais Finos',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePM(
          ecal: 0,
          filmePlastico: 0,
          pet: 0,
          petOleo: 0,
          pead: 0,
          plasticosMistos: 0,
          metaisFerrosos: 0,
          metaisNaoFerrosos: 0,
          naoRecuperaveis: 0.0325,
        ),
      ),
      MachineOutput(
        id: 'BS_PM_3D',
        description: 'Fluxo de materiais Rolantes (3D)',
        type: MachineOutputType.three,
        materialConversion: MaterialSamplePM(
          ecal: 0.6396,
          filmePlastico: 0.2838,
          pet: 0.9540,
          petOleo: 0.9798,
          pead: 0.9571,
          plasticosMistos: 0.5333,
          metaisFerrosos: 0.8775,
          metaisNaoFerrosos: 0.7693,
          naoRecuperaveis: 0.6401,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'MS_PETol',
    name: 'Triagem Manual de PET Óleo',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'MS_PETol_T',
        description: 'Fluxo de materiais Alvo (PET Óleo)',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
          ecal: 0,
          filmePlastico: 0,
          pet: 0,
          petOleo: 0.9495,
          pead: 0,
          plasticosMistos: 0,
          metaisFerrosos: 0,
          metaisNaoFerrosos: 0,
          naoRecuperaveis: 0,
        ),
      ),
      MachineOutput(
        id: 'MS_PETol_NT',
        description: 'Fluxo de materiais Não-Alvo (Resto)',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePM(
          ecal: 1,
          filmePlastico: 1,
          pet: 1,
          petOleo: 0.0505,
          pead: 1,
          plasticosMistos: 1,
          metaisFerrosos: 1,
          metaisNaoFerrosos: 1,
          naoRecuperaveis: 1,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'MS_Bulk1',
    name: 'Triagem Manual de Volumosos 1',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'MS_Bulk1_Tcont',
        description: '',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
          ecal: 0.0003,
          filmePlastico: 0.0037,
          pet: 0.0004,
          petOleo: 0,
          pead: 0,
          plasticosMistos: 0,
          metaisFerrosos: 0.0031,
          metaisNaoFerrosos: 0,
          naoRecuperaveis: 0.1115,
        ),
      ),
      MachineOutput(
        id: 'MS_Bulk1_Tgradbidon',
        description: 'Fluxo de materiais Alvo 2 (Grades de Plástico e Bidons)',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePM(
          ecal: 0,
          filmePlastico: 0,
          pet: 0,
          petOleo: 0,
          pead: 0.0452,
          plasticosMistos: 0.0146,
          metaisFerrosos: 0,
          metaisNaoFerrosos: 0,
          naoRecuperaveis: 0,
        ),
      ),
      MachineOutput(
        id: 'MS_Bulk1_NT',
        description: 'Fluxo de materiais Não-Alvo (Resto)',
        type: MachineOutputType.three,
        materialConversion: MaterialSamplePM(
          ecal: 0.9997,
          filmePlastico: 0.9963,
          pet: 0.9996,
          petOleo: 1,
          pead: 0.9548,
          plasticosMistos: 0.9854,
          metaisFerrosos: 0.9969,
          metaisNaoFerrosos: 1,
          naoRecuperaveis: 0.8885,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'MS_Bulk2',
    name: 'Triagem Manual de Volumosos 2',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'MS_Bulk2_Tcont',
        description: 'Fluxo de materiais Alvo 1 (Contaminantes Volumosos)',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePM(
          ecal: 0.0131,
          filmePlastico: 0.0376,
          pet: 0.0099,
          petOleo: 0.0042,
          pead: 0.0074,
          plasticosMistos: 0.0084,
          metaisFerrosos: 0.0073,
          metaisNaoFerrosos: 0.0011,
          naoRecuperaveis: 0.3332,
        ),
      ),
      MachineOutput(
        id: 'MS_Bulk2_Tfilme',
        description: 'Fluxo de materiais Alvo 2 (Filme Plástico)',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePM(
          ecal: 0.0031,
          filmePlastico: 0.2108,
          pet: 0.0027,
          petOleo: 0,
          pead: 0.0063,
          plasticosMistos: 0.0091,
          metaisFerrosos: 0.0066,
          metaisNaoFerrosos: 0.0052,
          naoRecuperaveis: 0.0021,
        ),
      ),
      MachineOutput(
        id: 'MS_Bulk2_NT',
        description: 'Fluxo de materiais Não-Alvo (Resto)',
        type: MachineOutputType.three,
        materialConversion: MaterialSamplePM(
          ecal: 0.9838,
          filmePlastico: 0.7516,
          pet: 0.9874,
          petOleo: 0.9958,
          pead: 0.9864,
          plasticosMistos: 0.9826,
          metaisFerrosos: 0.9861,
          metaisNaoFerrosos: 0.9937,
          naoRecuperaveis: 0.6647,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
];

const defaultSamplePC = MaterialSamplePC(
  papel: 0.2045,
  cartao: 0.6302,
  jornaisRevistas: 0.0752,
  naoRecuperaveis: 0.0901,
);

const machinesPC = <MachineDefinition>[
  MachineDefinition(
    id: 'F',
    name: 'Produto Final',
    icon: Icons.flag_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [],
    inputs: [MachineInput(id: 'final')],
  ),
  MachineDefinition(
    id: 'P',
    name: 'Passadeira',
    icon: Icons.double_arrow_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'out',
        description: '',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePC(
          papel: 1,
          cartao: 1,
          jornaisRevistas: 1,
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
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'JC',
        description: '',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePC(
          papel: 1,
          cartao: 1,
          jornaisRevistas: 1,
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
    id: 'DC',
    name: 'Crivo de Discos',
    icon: Icons.album_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'DS_CB_OS',
        description: 'Fluxo de materiais Supra-Crivo',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePC(
          papel: 0.0667,
          cartao: 0.6625,
          jornaisRevistas: 0.1201,
          naoRecuperaveis: 0.2468,
        ),
      ),
      MachineOutput(
        id: 'DS_CB_US',
        description: 'Fluxo de materiais Infra-Crivo',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePC(
          papel: 0.9333,
          cartao: 0.3375,
          jornaisRevistas: 0.8799,
          naoRecuperaveis: 0.7532,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'BS',
    name: 'Separador Balístico',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'BS_PC_2D',
        description: 'Fluxo de materiais Planares (2D)',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePC(
          papel: 0.9589,
          cartao: 0.9536,
          jornaisRevistas: 1,
          naoRecuperaveis: 0.7556,
        ),
      ),
      MachineOutput(
        id: 'BS_PC_F',
        description: 'Fluxo de materiais Finos',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePC(
          papel: 0,
          cartao: 0,
          jornaisRevistas: 0,
          naoRecuperaveis: 0.0405,
        ),
      ),
      MachineOutput(
        id: 'BS_PC_3D',
        description: 'Fluxo de materiais Rolantes (3D)',
        type: MachineOutputType.three,
        materialConversion: MaterialSamplePC(
          papel: 0.0411,
          cartao: 0.0464,
          jornaisRevistas: 0,
          naoRecuperaveis: 0.2039,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'MS_CB',
    name: 'Triagem Manual de Contaminantes do Cartão',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'MS_CB_T',
        description: 'Fluxo de materiais Alvo (Contaminantes)',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePC(
          papel: 0,
          cartao: 0,
          jornaisRevistas: 0,
          naoRecuperaveis: 0.5912,
        ),
      ),
      MachineOutput(
        id: 'MS_CB_NT',
        description: 'Fluxo de materiais Não-Alvo (Resto)',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePC(
          papel: 1,
          cartao: 1,
          jornaisRevistas: 1,
          naoRecuperaveis: 0.4088,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
  MachineDefinition(
    id: 'MS_P',
    name: 'Triagem Manual de Contaminantes do Papel',
    icon: Icons.swap_horiz_outlined,
    description:
        'Sobre a máquina lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    outputs: [
      MachineOutput(
        id: 'MS_P_TCONT',
        description: 'Fluxo de materiais Alvo 1 (Contaminantes)',
        type: MachineOutputType.one,
        materialConversion: MaterialSamplePC(
          papel: 0,
          cartao: 0,
          jornaisRevistas: 0,
          naoRecuperaveis: 0.5128,
        ),
      ),
      MachineOutput(
        id: 'MS_P_TSCB',
        description: 'Fluxo de materiais Alvo 2 (Cartão de Pequenas Dimensões)',
        type: MachineOutputType.two,
        materialConversion: MaterialSamplePC(
          papel: 0.0060,
          cartao: 0.2599,
          jornaisRevistas: 0.0085,
          naoRecuperaveis: 0.0020,
        ),
      ),
      MachineOutput(
        id: 'MS_P_NT',
        description: 'Fluxo de materiais Não-Alvo (Resto)',
        type: MachineOutputType.three,
        materialConversion: MaterialSamplePC(
          papel: 0.9940,
          cartao: 0.7401,
          jornaisRevistas: 0.9915,
          naoRecuperaveis: 0.4852,
        ),
      ),
    ],
    inputs: [MachineInput(id: 'feed')],
  ),
];
