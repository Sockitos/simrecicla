import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/recycler/machine.dart';
import 'package:simtech/models/recycler/material_sample.dart';
import 'package:simtech/ui/screens/recycler/grid/components/output_indicator.dart';
import 'package:simtech/ui/widgets/app_dialog.dart';

part 'machine_io_info.freezed.dart';

@freezed
class IOInfoModel with _$IOInfoModel {
  const factory IOInfoModel.input() = _Input;
  const factory IOInfoModel.output({
    required String outputId,
  }) = _Output;
  const IOInfoModel._();

  bool get showInput => map(
        input: (_) => true,
        output: (_) => false,
      );

  String? get selectedOutput => when(
        input: () => null,
        output: (outputId) => outputId,
      );
}

class MachineIOInfo extends HookWidget {
  const MachineIOInfo({
    super.key,
    required this.input,
    required this.machine,
  });

  final MaterialSample input;
  final Machine machine;

  @override
  Widget build(BuildContext context) {
    final state = useState(const IOInfoModel.input());
    final weights = state.value.when(
      input: () => input,
      output: (outputId) =>
          machine.outputs
              .firstWhere((o) => o.id == outputId)
              .materialConversion *
          input,
    );
    final max = weights.max();
    final sum = weights.sum();
    return AppDialog(
      child: SizedBox(
        width: 650,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: DefaultTextStyle(
            style: AppTextStyles.bodyM(context.layout),
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
                          state.value = const IOInfoModel.input();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: state.value.showInput
                              ? AppColors.grey3
                              : AppColors.grey1,
                          foregroundColor: AppColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          fixedSize: const Size.fromHeight(48),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          textStyle: state.value.showInput
                              ? AppTextStyles.smallButton(context.layout)
                                  .copyWith(fontWeight: FontWeight.bold)
                              : AppTextStyles.smallButton(context.layout),
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
                            state.value =
                                IOInfoModel.output(outputId: output.id);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                state.value.selectedOutput == output.id
                                    ? AppColors.grey3
                                    : AppColors.grey1,
                            foregroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            fixedSize: const Size.fromHeight(48),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            textStyle: state.value.selectedOutput == output.id
                                ? AppTextStyles.smallButton(context.layout)
                                    .copyWith(fontWeight: FontWeight.bold)
                                : AppTextStyles.smallButton(context.layout),
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
                      if (!state.value.showInput)
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
                for (final m in weights.materials.keys)
                  _MaterialInfo(
                    label: m.name,
                    highlight: m == max,
                    weight: weights.getValue(m),
                    composition: weights.getValue(m) / sum,
                    recovered: state.value.showInput
                        ? null
                        : weights.getValue(m) / input.getValue(m),
                  ),
                const SizedBox(height: 20),
                _MaterialInfo(
                  label: 'Não recuperáveis',
                  highlight: RMaterial.naoRecuperaveis == max,
                  weight: weights.naoRecuperaveis,
                  composition: weights.naoRecuperaveis / sum,
                  recovered: state.value.showInput
                      ? null
                      : weights.naoRecuperaveis / input.naoRecuperaveis,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MaterialInfo extends StatelessWidget {
  const _MaterialInfo({
    required this.label,
    this.labelStyle,
    this.weight = 0,
    this.composition = 0,
    this.recovered,
    this.highlight = false,
  });

  final String label;
  final TextStyle? labelStyle;
  final double weight;
  final double composition;
  final double? recovered;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: highlight ? AppColors.lightGreen.withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(34),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  label,
                  style: labelStyle,
                ),
              ),
            ),
            Expanded(
              child: Text(
                (weight.isNaN ? 0 : weight).toStringAsFixed(2),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                '${((composition.isNaN ? 0 : composition) * 100).toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
              ),
            ),
            if (recovered != null)
              Expanded(
                child: Text(
                  '${((recovered!.isNaN ? 0 : recovered!) * 100).toStringAsFixed(2)}%',
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
