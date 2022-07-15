import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';
import 'package:simtech/ui/screens/recycler/components/material_info.dart';
import 'package:simtech/ui/screens/recycler/grid_screen_notifier.dart';
import 'package:simtech/ui/widgets/my_card.dart';

class MachineIOInfo extends HookConsumerWidget {
  const MachineIOInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showInput = useState(true);
    final selectedOutput = useState<String?>(null);

    final state = ref.watch(gridScreenSNProvider);
    final machineId = state.machineIOInfo;
    final machine = state.grid.getData().firstWhere((m) => m.id0 == machineId);

    final inputWeights = state.graph.inputs[machineId]!;
    final outputWeights = selectedOutput.value == null
        ? null
        : state
            .graph.outputs[MachineOutputId(machineId!, selectedOutput.value!)]!;

    final weights = showInput.value ? inputWeights : outputWeights!;
    final compositions = weights.divAll(weights.sum());
    final recovered = weights / inputWeights;
    return MyCard(
      child: Stack(
        children: [
          SizedBox(
            width: 650,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: DefaultTextStyle(
                style: AppTextStyles.dropdown(context.layout),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            selectedOutput.value = null;
                            showInput.value = true;
                          },
                          style: ElevatedButton.styleFrom(
                            primary: showInput.value
                                ? AppColors.grey3
                                : AppColors.grey1,
                            onPrimary: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            fixedSize: const Size.fromHeight(48),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            textStyle: showInput.value
                                ? AppTextStyles.dropdown(context.layout)
                                    .copyWith(fontWeight: FontWeight.bold)
                                : AppTextStyles.dropdown(context.layout),
                          ),
                          child: const Text('Input'),
                        ),
                        const SizedBox(width: 15),
                        for (final output in machine.outputs) ...[
                          const SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () {
                              selectedOutput.value = output.id;
                              showInput.value = false;
                            },
                            style: ElevatedButton.styleFrom(
                              primary: selectedOutput.value == output.id
                                  ? AppColors.grey3
                                  : AppColors.grey1,
                              onPrimary: AppColors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              fixedSize: const Size.fromHeight(48),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              textStyle: selectedOutput.value == output.id
                                  ? AppTextStyles.dropdown(context.layout)
                                      .copyWith(fontWeight: FontWeight.bold)
                                  : AppTextStyles.dropdown(context.layout),
                            ),
                            child: const Text('Output'),
                          ),
                        ]
                      ],
                    ),
                    const SizedBox(height: 30),
                    DefaultTextStyle.merge(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'Materiais',
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Massa',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Composição',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          if (!showInput.value)
                            const Expanded(
                              child: Text(
                                'Recuperação',
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    if (weights is MaterialSamplePM &&
                        compositions is MaterialSamplePM &&
                        recovered is MaterialSamplePM) ...[
                      MaterialInfo(
                        label: 'ECAL',
                        weight: weights.ecal,
                        composition: compositions.ecal,
                        recovered: showInput.value ? null : recovered.ecal,
                      ),
                      MaterialInfo(
                        label: 'Filme plástico',
                        weight: weights.filmePlastico,
                        composition: compositions.filmePlastico,
                        recovered:
                            showInput.value ? null : recovered.filmePlastico,
                      ),
                      MaterialInfo(
                        label: 'PET',
                        weight: weights.pet,
                        composition: compositions.pet,
                        recovered: showInput.value ? null : recovered.pet,
                      ),
                      MaterialInfo(
                        label: 'PET óleo',
                        weight: weights.petOleo,
                        composition: compositions.petOleo,
                        recovered: showInput.value ? null : recovered.petOleo,
                      ),
                      MaterialInfo(
                        label: 'PEAD',
                        weight: weights.pead,
                        composition: compositions.pead,
                        recovered: showInput.value ? null : recovered.pead,
                      ),
                      MaterialInfo(
                        label: 'Plásticos Mistos',
                        weight: weights.plasticosMistos,
                        composition: compositions.plasticosMistos,
                        recovered:
                            showInput.value ? null : recovered.plasticosMistos,
                      ),
                      MaterialInfo(
                        label: 'Metais Ferrosos',
                        weight: weights.metaisFerrosos,
                        composition: compositions.metaisFerrosos,
                        recovered:
                            showInput.value ? null : recovered.metaisFerrosos,
                      ),
                      MaterialInfo(
                        label: 'Metais não Ferrosos',
                        weight: weights.metaisNaoFerrosos,
                        composition: compositions.metaisNaoFerrosos,
                        recovered: showInput.value
                            ? null
                            : recovered.metaisNaoFerrosos,
                      ),
                    ],
                    if (weights is MaterialSamplePC &&
                        compositions is MaterialSamplePC &&
                        recovered is MaterialSamplePC) ...[
                      MaterialInfo(
                        label: 'Papel',
                        weight: weights.papel,
                        composition: compositions.papel,
                        recovered: showInput.value ? null : recovered.papel,
                      ),
                      MaterialInfo(
                        label: 'Cartão',
                        weight: weights.cartao,
                        composition: compositions.cartao,
                        recovered: showInput.value ? null : recovered.cartao,
                      ),
                      MaterialInfo(
                        label: 'Jornais e Revistas',
                        weight: weights.jornaisRevistas,
                        composition: compositions.jornaisRevistas,
                        recovered:
                            showInput.value ? null : recovered.jornaisRevistas,
                      ),
                    ],
                    const SizedBox(height: 20),
                    MaterialInfo(
                      label: 'Não recuperáveis',
                      weight: weights.naoRecuperaveis,
                      composition: compositions.naoRecuperaveis,
                      recovered:
                          showInput.value ? null : recovered.naoRecuperaveis,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: IconButton(
              onPressed: () {
                final notifier = ref.read(gridScreenSNProvider.notifier);
                notifier.hideMachineIOInfo();
              },
              iconSize: 44,
              color: AppColors.lightGreen,
              icon: const Icon(Icons.close_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
