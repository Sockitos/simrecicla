import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';
import 'package:simtech/ui/screens/recycler/components/material_info.dart';
import 'package:simtech/ui/screens/recycler/components/output_indicator.dart';
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
    final max = compositions.max();
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
                        Text(
                          machine.name,
                          style: AppTextStyles.h5(context.layout),
                        ),
                        const SizedBox(width: 15),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                          ),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: Icon(machine.icon),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    if (machine.outputs.isNotEmpty) ...[
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              selectedOutput.value = null;
                              showInput.value = true;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: showInput.value
                                  ? AppColors.grey3
                                  : AppColors.grey1,
                              foregroundColor: AppColors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              fixedSize: const Size.fromHeight(48),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              textStyle: showInput.value
                                  ? AppTextStyles.dropdown(context.layout)
                                      .copyWith(
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                    )
                                  : AppTextStyles.dropdown(context.layout)
                                      .copyWith(height: 1),
                            ),
                            child: const Text('Input'),
                          ),
                          const SizedBox(width: 15),
                          const SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: AppColors.grey4,
                              thickness: 1,
                            ),
                          ),
                          for (final output in machine.outputs) ...[
                            const SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () {
                                selectedOutput.value = output.id;
                                showInput.value = false;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    selectedOutput.value == output.id
                                        ? AppColors.grey3
                                        : AppColors.grey1,
                                foregroundColor: AppColors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                fixedSize: const Size.fromHeight(48),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                textStyle: selectedOutput.value == output.id
                                    ? AppTextStyles.dropdown(context.layout)
                                        .copyWith(
                                        fontWeight: FontWeight.bold,
                                        height: 1,
                                      )
                                    : AppTextStyles.dropdown(context.layout)
                                        .copyWith(height: 1),
                              ),
                              child: Row(
                                children: [
                                  const Text('Output'),
                                  const SizedBox(width: 8),
                                  OutputIndicator(
                                    output: output,
                                    width: 16,
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ]
                        ],
                      ),
                      const SizedBox(height: 25),
                    ],
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
                        recovered is MaterialSamplePM &&
                        max is MaterialSamplePM) ...[
                      MaterialInfo(
                        label: 'ECAL',
                        highlight: max.ecal == 1,
                        weight: weights.ecal,
                        composition: compositions.ecal,
                        recovered: showInput.value ? null : recovered.ecal,
                      ),
                      MaterialInfo(
                        label: 'Filme plástico',
                        highlight: max.filmePlastico == 1,
                        weight: weights.filmePlastico,
                        composition: compositions.filmePlastico,
                        recovered:
                            showInput.value ? null : recovered.filmePlastico,
                      ),
                      MaterialInfo(
                        label: 'PET',
                        highlight: max.pet == 1,
                        weight: weights.pet,
                        composition: compositions.pet,
                        recovered: showInput.value ? null : recovered.pet,
                      ),
                      MaterialInfo(
                        label: 'PET óleo',
                        highlight: max.petOleo == 1,
                        weight: weights.petOleo,
                        composition: compositions.petOleo,
                        recovered: showInput.value ? null : recovered.petOleo,
                      ),
                      MaterialInfo(
                        label: 'PEAD',
                        highlight: max.pead == 1,
                        weight: weights.pead,
                        composition: compositions.pead,
                        recovered: showInput.value ? null : recovered.pead,
                      ),
                      MaterialInfo(
                        label: 'Plásticos Mistos',
                        highlight: max.plasticosMistos == 1,
                        weight: weights.plasticosMistos,
                        composition: compositions.plasticosMistos,
                        recovered:
                            showInput.value ? null : recovered.plasticosMistos,
                      ),
                      MaterialInfo(
                        label: 'Metais Ferrosos',
                        highlight: max.metaisFerrosos == 1,
                        weight: weights.metaisFerrosos,
                        composition: compositions.metaisFerrosos,
                        recovered:
                            showInput.value ? null : recovered.metaisFerrosos,
                      ),
                      MaterialInfo(
                        label: 'Metais não Ferrosos',
                        highlight: max.metaisNaoFerrosos == 1,
                        weight: weights.metaisNaoFerrosos,
                        composition: compositions.metaisNaoFerrosos,
                        recovered: showInput.value
                            ? null
                            : recovered.metaisNaoFerrosos,
                      ),
                    ],
                    if (weights is MaterialSamplePC &&
                        compositions is MaterialSamplePC &&
                        recovered is MaterialSamplePC &&
                        max is MaterialSamplePC) ...[
                      MaterialInfo(
                        label: 'Papel',
                        highlight: max.papel == 1,
                        weight: weights.papel,
                        composition: compositions.papel,
                        recovered: showInput.value ? null : recovered.papel,
                      ),
                      MaterialInfo(
                        label: 'Cartão',
                        highlight: max.cartao == 1,
                        weight: weights.cartao,
                        composition: compositions.cartao,
                        recovered: showInput.value ? null : recovered.cartao,
                      ),
                      MaterialInfo(
                        label: 'Jornais e Revistas',
                        highlight: max.jornaisRevistas == 1,
                        weight: weights.jornaisRevistas,
                        composition: compositions.jornaisRevistas,
                        recovered:
                            showInput.value ? null : recovered.jornaisRevistas,
                      ),
                    ],
                    const SizedBox(height: 20),
                    MaterialInfo(
                      label: 'Não recuperáveis',
                      highlight: max.naoRecuperaveis == 1,
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
