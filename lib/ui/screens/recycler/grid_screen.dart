import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/machine.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/models/material_sample.dart';
import 'package:simtech/ui/screens/recycler/components/draggable_machine.dart';
import 'package:simtech/ui/screens/recycler/components/machine_list.dart';
import 'package:simtech/ui/screens/recycler/grid_screen_notifier.dart';
import 'package:simtech/ui/widgets/my_drag_target.dart';
import 'package:simtech/ui/widgets/screen_wrapper.dart';

class GridScreen extends ConsumerWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gridScreenSNProvider);
    return ScreenWrapper(
      backgroundColor: AppColors.grey4,
      padding: EdgeInsets.zero,
      body: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 750,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Ink(color: AppColors.grey1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          'Criar uma linha de triagem?',
                          textAlign: TextAlign.left,
                          style: AppTextStyles.h2(context.layout)
                              .copyWith(color: AppColors.lightGreen),
                        ),
                        const SizedBox(height: 60),
                        if (!state.showResults) const MachineList(),
                      ],
                    ),
                  ),
                  if (state.showResults) const _Results()
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _Grid(),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.lightGreen,
                          onSurface: AppColors.grey7,
                        ),
                        onPressed: state.graph.isValidated
                            ? () {
                                final notifier =
                                    ref.read(gridScreenSNProvider.notifier);
                                notifier.showResults();
                              }
                            : null,
                        child: const Text('Ver Resultados'),
                      ),
                    ],
                  ),
                  if (state.showFeedOptions) ...[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        final notifier =
                            ref.read(gridScreenSNProvider.notifier);
                        notifier.hideFeedOptions();
                      },
                    ),
                    const _FeedOptions(),
                  ],
                  if (state.machineIOInfo != null) ...[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        final notifier =
                            ref.read(gridScreenSNProvider.notifier);
                        notifier.hideMachineIOInfo();
                      },
                    ),
                    const _MachineIOInfo(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Grid extends ConsumerWidget {
  const _Grid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gridScreenSNProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        SizedBox(
          width: 55.0 * state.grid.xSize,
          height: 55.0 * state.grid.ySize,
          child: Stack(
            children: [
              Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: state.grid.xSize,
                      ),
                      itemBuilder: (context, _) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white),
                          ),
                        );
                      },
                      itemCount: state.grid.xSize * (state.grid.ySize - 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.grid.xSize,
                    ),
                    itemBuilder: (context, index) {
                      final x = index % (state.grid.ySize - 1);
                      final y = index ~/ state.grid.xSize;
                      final cell = state.grid.getCell(x, y);
                      return MyDragTarget<Machine>(
                        onWillAccept: (newCell) {
                          if (newCell == null) return false;
                          if (cell != null) return false;
                          for (final d in AxisDirection.values) {
                            final otherCell =
                                state.grid.getCellFromDirection(x, y, d);
                            if (!newCell.isCompatible(
                              d,
                              otherCell,
                            )) {
                              return false;
                            }
                          }
                          return true;
                        },
                        onAccept: (data) {
                          final notifier =
                              ref.read(gridScreenSNProvider.notifier);
                          notifier.setMachine(x, y, machine: data);
                        },
                        builder: (context, machines, _) {
                          final cell = state.grid.getCell(x, y);
                          if (cell == null) {
                            return const SizedBox();
                          } else {
                            var machineState = MachineState.disconnected;
                            if (state.graph.graph.vertices.contains(cell.id0)) {
                              machineState = state.graph.isValidated
                                  ? MachineState.validated
                                  : MachineState.connected;
                            }

                            return InkResponse(
                              radius: 25,
                              onTap: machineState == MachineState.validated &&
                                      cell.id != 'feed'
                                  ? () {
                                      final notifier = ref
                                          .read(gridScreenSNProvider.notifier);
                                      notifier.showMachineIOInfo(cell.id0);
                                    }
                                  : null,
                              child: DraggableMachine(
                                machine: cell,
                                size: const Size(55, 55),
                                portSize: const Size(13, 9),
                                isInGrid: true,
                                state: machineState,
                              ),
                            );
                          }
                        },
                      );
                    },
                    itemCount: state.grid.xSize * (state.grid.ySize - 1),
                  ),
                ],
              ),
              Positioned(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(width: 55, height: 55),
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              final notifier =
                                  ref.read(gridScreenSNProvider.notifier);
                              notifier.showFeedOptions();
                            },
                            color: AppColors.lightGreen,
                            icon: const Icon(
                              Icons.add_circle_outline_rounded,
                            ),
                            splashRadius: 24,
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                          ),
                          Text(
                            'Opções de Entrada',
                            style: AppTextStyles.dropdown(
                              context.layout,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: MyDragTarget<Machine>(
              onWillAccept: (_) => true,
              onAccept: (data) {
                final notifier = ref.read(gridScreenSNProvider.notifier);
                notifier.removeMachine(data);
              },
              builder: (context, candidates, _) {
                return Icon(
                  Icons.delete_outline_rounded,
                  size: 64,
                  color: candidates.isEmpty ? null : AppColors.ratingF,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _FeedOptions extends HookConsumerWidget {
  const _FeedOptions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gridScreenSNProvider);
    final useDefault = useState(state.useDefaultFeed);
    final weight = useState(state.feedWeight);
    final percentages = useState(state.feedSample);
    final weights = useState(percentages.value.mulAll(weight.value));
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          children: [
            Ink(
              width: 500,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(34),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 3),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: DefaultTextStyle(
                style: AppTextStyles.dropdown(context.layout),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: useDefault.value
                              ? () {}
                              : () {
                                  useDefault.value = true;
                                },
                          style: ElevatedButton.styleFrom(
                            primary: useDefault.value
                                ? AppColors.grey3
                                : AppColors.grey1,
                            onPrimary: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            minimumSize: const Size(0, 50),
                            maximumSize: const Size(double.maxFinite, 50),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            textStyle: useDefault.value
                                ? AppTextStyles.dropdown(context.layout)
                                    .copyWith(fontWeight: FontWeight.bold)
                                : AppTextStyles.dropdown(context.layout),
                          ),
                          child: const Text('Padrão'),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          onPressed: !useDefault.value
                              ? () {}
                              : () {
                                  useDefault.value = false;
                                },
                          style: ElevatedButton.styleFrom(
                            primary: !useDefault.value
                                ? AppColors.grey3
                                : AppColors.grey1,
                            onPrimary: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            minimumSize: const Size(0, 50),
                            maximumSize: const Size(double.maxFinite, 50),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            textStyle: !useDefault.value
                                ? AppTextStyles.dropdown(context.layout)
                                    .copyWith(fontWeight: FontWeight.bold)
                                : AppTextStyles.dropdown(context.layout),
                          ),
                          child: const Text('Customizar'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Peso Total (kg/h)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: HookBuilder(
                            builder: (context) {
                              final textController = useTextEditingController(
                                text: weight.value.toStringAsFixed(2),
                              );
                              useEffect(
                                () {
                                  final newText =
                                      weight.value.toStringAsFixed(2);
                                  if (newText != textController.text) {
                                    textController.text =
                                        weight.value.toStringAsFixed(2);
                                  }
                                  return;
                                },
                                [weight.value],
                              );
                              return TextFormField(
                                controller: textController,
                                onChanged: (value) {
                                  final newWeight = double.parse(value);
                                  weight.value = newWeight;
                                  weights.value =
                                      percentages.value.mulAll(newWeight);
                                },
                                style: AppTextStyles.dropdown(context.layout),
                                inputFormatters: [DecimalFormatter()],
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                maxLength: 8,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                      color: AppColors.grey3,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                      color: AppColors.lightGreen,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  counterText: '',
                                ),
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 30),
                    DefaultTextStyle.merge(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Materiais',
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Massa',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Composição',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    _MaterialOption(
                      label: 'ECAL',
                      weight: weights.value.ecal,
                      percentage: percentages.value.ecal,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff = weights.value.ecal - newWeight;
                        weight.value -= diff;
                        weights.value = weights.value.copyWith(ecal: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    _MaterialOption(
                      label: 'Filme plástico',
                      weight: weights.value.filmePlastico,
                      percentage: percentages.value.filmePlastico,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff = weights.value.filmePlastico - newWeight;
                        weight.value -= diff;
                        weights.value =
                            weights.value.copyWith(filmePlastico: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    _MaterialOption(
                      label: 'PET',
                      weight: weights.value.pet,
                      percentage: percentages.value.pet,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff = weights.value.pet - newWeight;
                        weight.value -= diff;
                        weights.value = weights.value.copyWith(pet: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    _MaterialOption(
                      label: 'PET óleo',
                      weight: weights.value.petOleo,
                      percentage: percentages.value.petOleo,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff = weights.value.petOleo - newWeight;
                        weight.value -= diff;
                        weights.value =
                            weights.value.copyWith(petOleo: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    _MaterialOption(
                      label: 'PEAD',
                      weight: weights.value.pead,
                      percentage: percentages.value.pead,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff = weights.value.pead - newWeight;
                        weight.value -= diff;
                        weights.value = weights.value.copyWith(pead: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    _MaterialOption(
                      label: 'Plásticos Mistos',
                      weight: weights.value.plasticosMistos,
                      percentage: percentages.value.plasticosMistos,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff = weights.value.plasticosMistos - newWeight;
                        weight.value -= diff;
                        weights.value =
                            weights.value.copyWith(plasticosMistos: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    _MaterialOption(
                      label: 'Metais Ferrosos',
                      weight: weights.value.metaisFerrosos,
                      percentage: percentages.value.metaisFerrosos,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff = weights.value.metaisFerrosos - newWeight;
                        weight.value -= diff;
                        weights.value =
                            weights.value.copyWith(metaisFerrosos: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    _MaterialOption(
                      label: 'Metais não Ferrosos',
                      weight: weights.value.metaisNaoFerrosos,
                      percentage: percentages.value.metaisNaoFerrosos,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff =
                            weights.value.metaisNaoFerrosos - newWeight;
                        weight.value -= diff;
                        weights.value = weights.value
                            .copyWith(metaisNaoFerrosos: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    const SizedBox(height: 20),
                    _MaterialOption(
                      label: 'Não recuperáveis',
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      weight: weights.value.naoRecuperaveis,
                      percentage: percentages.value.naoRecuperaveis,
                      isEditable: !useDefault.value,
                      onWeightChange: (newWeight) {
                        final diff = weights.value.naoRecuperaveis - newWeight;
                        weight.value -= diff;
                        weights.value =
                            weights.value.copyWith(naoRecuperaveis: newWeight);
                        percentages.value = weights.value.divAll(weight.value);
                      },
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final notifier =
                              ref.read(gridScreenSNProvider.notifier);
                          notifier.setFeedOptions(
                            useDefault: useDefault.value,
                            weight: weight.value,
                            sample: percentages.value,
                          );
                          notifier.hideFeedOptions();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 50),
                          maximumSize: const Size(double.maxFinite, 50),
                          textStyle: AppTextStyles.h5(context.layout)
                              .copyWith(height: 1),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                        ),
                        child: const Text('Confirmar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 15,
              top: 15,
              child: IconButton(
                onPressed: () {
                  final notifier = ref.read(gridScreenSNProvider.notifier);
                  notifier.hideFeedOptions();
                },
                iconSize: 44,
                color: AppColors.lightGreen,
                icon: const Icon(Icons.close_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MaterialOption extends StatelessWidget {
  const _MaterialOption({
    required this.label,
    this.labelStyle,
    required this.weight,
    required this.percentage,
    this.isEditable = true,
    required this.onWeightChange,
    //this.onPercentageChange,
  });

  final String label;
  final TextStyle? labelStyle;
  final double weight;
  final double percentage;
  final bool isEditable;
  final ValueChanged<double> onWeightChange;
  //final ValueChanged<double>? onPercentageChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          if (isEditable)
            Expanded(
              child: Center(
                child: IntrinsicWidth(
                  child: HookBuilder(
                    builder: (context) {
                      final textController = useTextEditingController();
                      useEffect(
                        () {
                          final newText = weight.toStringAsFixed(2);
                          if (newText != textController.text) {
                            textController.text = weight.toStringAsFixed(2);
                          }
                          return;
                        },
                        [weight],
                      );
                      return TextFormField(
                        controller: textController,
                        onChanged: (value) {
                          final weight = double.parse(value);
                          onWeightChange(weight);
                        },
                        style: AppTextStyles.dropdown(context.layout),
                        inputFormatters: [DecimalFormatter()],
                        maxLength: 8,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(2, 2, 0, 2),
                          constraints: BoxConstraints(),
                          counterText: '',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.grey3),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Text(
                weight.toStringAsFixed(2),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: Text(
              '${(percentage * 100).toStringAsFixed(2)}%',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _MachineIOInfo extends HookConsumerWidget {
  const _MachineIOInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showInput = useState(true);
    final selectedOutput = useState<String?>(null);

    final state = ref.watch(gridScreenSNProvider);
    final machineId = state.machineIOInfo;
    final machine = state.grid.getData().firstWhere((m) => m.id0 == machineId);

    final inputWeights = state.graph.inputs[machineId]!;
    final outputWeights = selectedOutput.value == null
        ? const MaterialSample()
        : state
            .graph.outputs[MachineOutputId(machineId!, selectedOutput.value!)]!;

    final weights = showInput.value ? inputWeights : outputWeights;
    final compositions = weights.divAll(weights.sum());
    final recovered = weights / state.feedSample.mulAll(state.feedWeight);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          children: [
            Ink(
              width: 650,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(34),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 3),
                    blurRadius: 20,
                  ),
                ],
              ),
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
                            minimumSize: const Size(0, 50),
                            maximumSize: const Size(double.maxFinite, 50),
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
                              minimumSize: const Size(0, 50),
                              maximumSize: const Size(double.maxFinite, 50),
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
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Materiais',
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Massa',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Composição',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Recuperação',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    _MaterialInfo(
                      label: 'ECAL',
                      weight: weights.ecal,
                      composition: compositions.ecal,
                      recovered: recovered.ecal,
                    ),
                    _MaterialInfo(
                      label: 'Filme plástico',
                      weight: weights.filmePlastico,
                      composition: compositions.filmePlastico,
                      recovered: recovered.filmePlastico,
                    ),
                    _MaterialInfo(
                      label: 'PET',
                      weight: weights.pet,
                      composition: compositions.pet,
                      recovered: recovered.pet,
                    ),
                    _MaterialInfo(
                      label: 'PET óleo',
                      weight: weights.petOleo,
                      composition: compositions.petOleo,
                      recovered: recovered.petOleo,
                    ),
                    _MaterialInfo(
                      label: 'PEAD',
                      weight: weights.pead,
                      composition: compositions.pead,
                      recovered: recovered.pead,
                    ),
                    _MaterialInfo(
                      label: 'Plásticos Mistos',
                      weight: weights.plasticosMistos,
                      composition: compositions.plasticosMistos,
                      recovered: recovered.plasticosMistos,
                    ),
                    _MaterialInfo(
                      label: 'Metais Ferrosos',
                      weight: weights.metaisFerrosos,
                      composition: compositions.metaisFerrosos,
                      recovered: recovered.metaisFerrosos,
                    ),
                    _MaterialInfo(
                      label: 'Metais não Ferrosos',
                      weight: weights.metaisNaoFerrosos,
                      composition: compositions.metaisNaoFerrosos,
                      recovered: recovered.metaisNaoFerrosos,
                    ),
                    const SizedBox(height: 20),
                    _MaterialInfo(
                      label: 'Não recuperáveis',
                      weight: weights.naoRecuperaveis,
                      composition: compositions.naoRecuperaveis,
                      recovered: recovered.naoRecuperaveis,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                  ],
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
  });

  final String label;
  final TextStyle? labelStyle;
  final double weight;
  final double composition;
  final double? recovered;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              weight.toStringAsFixed(2),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${(composition * 100).toStringAsFixed(2)}%',
              textAlign: TextAlign.center,
            ),
          ),
          if (recovered != null)
            Expanded(
              child: Text(
                '${(recovered! * 100).toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}

class DecimalFormatter extends NumberInputFormatter {
  DecimalFormatter()
      : _decimalRegex = RegExp(r'[0-9]+\.?'),
        _decimalFormatter = FilteringTextInputFormatter.allow(
          RegExp(r'[0-9]+\.?'),
        );
  static final NumberFormat _formatter = NumberFormat('0.00');

  final FilteringTextInputFormatter _decimalFormatter;
  final RegExp _decimalRegex;

  @override
  String _formatPattern(String? digits) {
    if (digits == null || digits.isEmpty) return '';
    num number;
    number = double.tryParse(digits) ?? 0.0;
    final result = _formatter.format(number);
    return result;
  }

  @override
  TextEditingValue _formatValue(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _decimalFormatter.formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return s == '.' || _decimalRegex.firstMatch(s) != null;
  }
}

abstract class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    /// remove all invalid characters
    // ignore: parameter_assignments
    newValue = _formatValue(oldValue, newValue);

    /// current selection
    var selectionIndex = newValue.selection.end;

    /// format original string, this step would add some separator
    /// characters to original string
    final newText = _formatPattern(newValue.text);

    /// count number of inserted character in new string
    var insertCount = 0;

    /// count number of original input character in new string
    var inputCount = 0;
    for (var i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    /// adjust selection according to number of inserted characters staying before
    /// selection
    selectionIndex += insertCount;
    selectionIndex = min(selectionIndex, newText.length);

    /// if selection is right after an inserted character, it should be moved
    /// backward, this adjustment prevents an issue that user cannot delete
    /// characters when cursor stands right after inserted characters
    if (selectionIndex - 1 >= 0 &&
        selectionIndex - 1 < newText.length &&
        !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
      composing: TextRange.empty,
    );
  }

  /// check character from user input or being inserted by pattern formatter
  bool _isUserInput(String s);

  /// format user input with pattern formatter
  String _formatPattern(String digits);

  /// validate user input
  TextEditingValue _formatValue(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  );
}

class _Results extends HookConsumerWidget {
  const _Results();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          children: [
            Ink(
              width: 650,
              height: 650,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(34),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 3),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 15,
              top: 15,
              child: IconButton(
                onPressed: () {
                  final notifier = ref.read(gridScreenSNProvider.notifier);
                  notifier.hideResults();
                },
                iconSize: 44,
                color: AppColors.lightGreen,
                icon: const Icon(Icons.close_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
