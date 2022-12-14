import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/consumer/component.dart';
import 'package:simtech/models/consumer/package.dart';
import 'package:simtech/services/consumer_service.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/bird_icon_button.dart';
import 'package:simtech/ui/widgets/app_card.dart';
import 'package:simtech/ui/widgets/arrow.dart';
import 'package:tuple/tuple.dart';

part 'results.freezed.dart';

@freezed
class ResultsState with _$ResultsState {
  const factory ResultsState.packageResults() = PackageResults;
  const factory ResultsState.componentResults({
    required String componentId,
  }) = ComponentResults;
}

class Results extends HookWidget {
  const Results({
    super.key,
    required this.whereComponents,
    required this.package,
    this.onClose,
  });

  final Map<Component, Where> whereComponents;
  final Package package;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final mode = useState(const ResultsState.packageResults());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 55),
          child: AppCard(
            child: Stack(
              children: [
                Padding(
                  padding: AppSpacings.dialogPadding(context.layout) +
                      const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: mode.value.when(
                      packageResults: () {
                        final results =
                            ConsumerService.getResults(whereComponents);
                        return [
                          const SizedBox(height: 10),
                          Text(
                            'Embalagem completa',
                            style: AppTextStyles.h2(context.layout),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 54,
                                          width: 54,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 4,
                                                color: AppColors.lightGreen,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.spa_outlined,
                                              size: 34,
                                              color: AppColors.lightGreen,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          'Impactes Ambientais',
                                          style:
                                              AppTextStyles.h4(context.layout)
                                                  .withColor(
                                            AppColors.lightGreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      results.isCorrect
                                          ? results.userImpacts.environmental
                                                  .isNegative
                                              ? 'A deposição da embalagem no contentor adequado representa benefícios ambientais face à não reciclagem destes materiais.'
                                              : 'Ao colocar a embalagem no contentor adequado contribui para a redução dos impactes ambientais associados à gestão destes resíduos.'
                                          : 'Os destinos selecionados apresentam impactes ambientais superiores à adequada deposição da embalagem no contentor correto.',
                                      style: AppTextStyles.bodyL(
                                        context.layout,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    height: 180,
                                    child: _ImpactChart(
                                      label: 'g CO2eq / Embalagem',
                                      user: results.userImpacts.environmental,
                                      alternative: results
                                          .alternativeImpacts.environmental,
                                      isCorrect: results.isCorrect,
                                      correctDirection: AxisDirection.down,
                                      incorrectDirection: AxisDirection.up,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 54,
                                          width: 54,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 4,
                                                color: AppColors.lightGreen,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons
                                                  .account_balance_wallet_outlined,
                                              size: 34,
                                              color: AppColors.lightGreen,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          'Impactes Económicos',
                                          style:
                                              AppTextStyles.h4(context.layout)
                                                  .withColor(
                                            AppColors.lightGreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      results.isCorrect
                                          ? 'A deposição da embalagem nos contentores adequados representa um contributo para a riqueza em Portugal superior face à não reciclagem destes materiais.'
                                          : 'Os destinos selecionados apresentam um contributo para a riqueza em Portugal inferior à colocação nos contentores adequados.',
                                      style: AppTextStyles.bodyL(
                                        context.layout,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    height: 180,
                                    child: _ImpactChart(
                                      label: '€ VAB / Embalagem',
                                      user: results.userImpacts.economical,
                                      alternative:
                                          results.alternativeImpacts.economical,
                                      isCorrect: results.isCorrect,
                                      correctDirection: AxisDirection.up,
                                      incorrectDirection: AxisDirection.down,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Clique em cada componente para saber mais.',
                            style: AppTextStyles.bodyS(context.layout),
                          ),
                        ];
                      },
                      componentResults: (componentId) {
                        final component = whereComponents.keys
                            .firstWhere((c) => c.name == componentId);
                        final isCorrect =
                            whereComponents[component] == component.where;
                        return [
                          Text(
                            component.name,
                            style: AppTextStyles.h2(context.layout),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            isCorrect ? component.ifTrue : component.ifFalse,
                            style: AppTextStyles.bodyL(context.layout),
                          ),
                          const SizedBox(height: 60),
                          Text(
                            'Recomendações',
                            style: AppTextStyles.h3(context.layout)
                                .withColor(AppColors.lightGreen),
                          ),
                          const SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (var i = 0;
                                  i < component.recommendations.length;
                                  i++) ...[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 54,
                                      width: 54,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 4,
                                            color: AppColors.lightGreen,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${i + 1}',
                                            style: AppTextStyles.h3(
                                              context.layout,
                                            )
                                                .withColor(AppColors.lightGreen)
                                                .copyWith(height: 1.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      component.recommendations[i],
                                      style: AppTextStyles.bodyL(
                                        context.layout,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                              ]
                            ],
                          ),
                        ];
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: IconButton(
                    onPressed: onClose,
                    iconSize: 44,
                    color: AppColors.lightGreen,
                    icon: const Icon(Icons.close_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            BirdIconButton(
              radius: 40,
              icon: package.icon,
              isSelected: mode.value is PackageResults,
              onPressed: () => mode.value = const ResultsState.packageResults(),
            ),
            for (final c in package.components) ...[
              const SizedBox(height: 20),
              BirdIconButton(
                radius: 40,
                icon: c.icon,
                isCorrect: whereComponents[c] == c.where,
                isSelected: mode.value is ComponentResults &&
                    (mode.value as ComponentResults).componentId == c.name,
                onPressed: () => mode.value = ResultsState.componentResults(
                  componentId: c.name,
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}

class VerticalResults extends HookWidget {
  const VerticalResults({
    super.key,
    required this.whereComponents,
    required this.package,
    this.onClose,
  });

  final Map<Component, Where> whereComponents;
  final Package package;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final mode = useState(const ResultsState.packageResults());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 55),
          child: AppCard(
            child: Stack(
              children: [
                Padding(
                  padding: AppSpacings.dialogPadding(context.layout) +
                      const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: mode.value.when(
                      packageResults: () {
                        final results =
                            ConsumerService.getResults(whereComponents);
                        return [
                          const SizedBox(height: 10),
                          Text(
                            'Embalagem completa',
                            style: AppTextStyles.h2(context.layout),
                          ),
                          const SizedBox(height: 30),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 48,
                                    width: 48,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 4,
                                          color: AppColors.lightGreen,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.spa_outlined,
                                        size: 28,
                                        color: AppColors.lightGreen,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    'Impactes Ambientais',
                                    style: AppTextStyles.h4(context.layout)
                                        .withColor(AppColors.lightGreen),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                results.isCorrect
                                    ? results.userImpacts.environmental
                                            .isNegative
                                        ? 'A deposição da embalagem no contentor adequado representa benefícios ambientais face à não reciclagem destes materiais.'
                                        : 'Ao colocar a embalagem no contentor adequado contribui para a redução dos impactes ambientais associados à gestão destes resíduos.'
                                    : 'Os destinos selecionados apresentam impactes ambientais superiores à adequada deposição da embalagem no contentor correto.',
                                style: context.layout.value(
                                  xs: AppTextStyles.bodyM(context.layout),
                                  sm: AppTextStyles.bodyL(context.layout),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 180,
                            child: _ImpactChart(
                              label: 'g CO2eq / Embalagem',
                              user: results.userImpacts.environmental,
                              alternative:
                                  results.alternativeImpacts.environmental,
                              isCorrect: results.isCorrect,
                              correctDirection: AxisDirection.down,
                              incorrectDirection: AxisDirection.up,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 48,
                                    width: 48,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 4,
                                          color: AppColors.lightGreen,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.account_balance_wallet_outlined,
                                        size: 28,
                                        color: AppColors.lightGreen,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    'Impactes Económicos',
                                    style: AppTextStyles.h4(context.layout)
                                        .withColor(AppColors.lightGreen),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                results.isCorrect
                                    ? 'A deposição da embalagem nos contentores adequados representa um contributo para a riqueza em Portugal superior face à não reciclagem destes materiais.'
                                    : 'Os destinos selecionados apresentam um contributo para a riqueza em Portugal inferior à colocação nos contentores adequados.',
                                style: context.layout.value(
                                  xs: AppTextStyles.bodyM(context.layout),
                                  sm: AppTextStyles.bodyL(context.layout),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 180,
                            child: _ImpactChart(
                              label: '€ VAB / Embalagem',
                              user: results.userImpacts.economical,
                              alternative:
                                  results.alternativeImpacts.economical,
                              isCorrect: results.isCorrect,
                              correctDirection: AxisDirection.up,
                              incorrectDirection: AxisDirection.down,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Clique em cada componente para saber mais.',
                            style: AppTextStyles.bodyS(context.layout),
                          ),
                        ];
                      },
                      componentResults: (componentId) {
                        final component = whereComponents.keys
                            .firstWhere((c) => c.name == componentId);
                        final isCorrect =
                            whereComponents[component] == component.where;
                        return [
                          const SizedBox(height: 10),
                          Text(
                            component.name,
                            style: AppTextStyles.h2(context.layout),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            isCorrect ? component.ifTrue : component.ifFalse,
                            style: context.layout.value(
                              xs: AppTextStyles.bodyM(context.layout),
                              sm: AppTextStyles.bodyL(context.layout),
                            ),
                          ),
                          const SizedBox(height: 60),
                          Text(
                            'Recomendações',
                            style: AppTextStyles.h3(context.layout)
                                .withColor(AppColors.lightGreen),
                          ),
                          const SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (var i = 0;
                                  i < component.recommendations.length;
                                  i++) ...[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 54,
                                      width: 54,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 4,
                                            color: AppColors.lightGreen,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${i + 1}',
                                            style: AppTextStyles.h3(
                                              context.layout,
                                            )
                                                .withColor(
                                                  AppColors.lightGreen,
                                                )
                                                .copyWith(height: 1.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Text(
                                        component.recommendations[i],
                                        style: context.layout.value(
                                          xs: AppTextStyles.bodyM(
                                            context.layout,
                                          ),
                                          sm: AppTextStyles.bodyL(
                                            context.layout,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                              ]
                            ],
                          ),
                        ];
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: context.layout.value(xs: 35, sm: 15),
                  child: IconButton(
                    onPressed: onClose,
                    iconSize: 44,
                    color: AppColors.lightGreen,
                    icon: const Icon(Icons.close_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: context.layout.value(
            xs: MainAxisAlignment.spaceAround,
            sm: MainAxisAlignment.center,
          ),
          children: [
            BirdIconButton(
              radius: context.layout.value(xs: 34, sm: 40),
              icon: package.icon,
              isSelected: mode.value is PackageResults,
              onPressed: () => mode.value = const ResultsState.packageResults(),
              aimDown: true,
            ),
            for (final c in package.components) ...[
              if (context.layout.breakpoint > LayoutBreakpoint.xs)
                const SizedBox(width: 20),
              BirdIconButton(
                radius: context.layout.value(xs: 34, sm: 40),
                icon: c.icon,
                isCorrect: whereComponents[c] == c.where,
                isSelected: mode.value is ComponentResults &&
                    (mode.value as ComponentResults).componentId == c.name,
                onPressed: () => mode.value = ResultsState.componentResults(
                  componentId: c.name,
                ),
                aimDown: true,
              ),
            ]
          ],
        ),
      ],
    );
  }
}

class _ImpactChart extends StatelessWidget {
  const _ImpactChart({
    required this.label,
    required this.user,
    required this.alternative,
    required this.isCorrect,
    required this.correctDirection,
    required this.incorrectDirection,
  });

  final String label;
  final double user;
  final double alternative;
  final bool isCorrect;
  final AxisDirection correctDirection;
  final AxisDirection incorrectDirection;

  @override
  Widget build(BuildContext context) {
    final minValue = min(user, alternative);
    final maxValue = max(user, alternative);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: AppTextStyles.bodyS(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (maxValue.isNegative && minValue.isNegative)
                const SizedBox(
                  height: 2,
                  child: ColoredBox(color: AppColors.grey6),
                ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: _ImpactBar(
                            value: user,
                            minValue: minValue,
                            maxValue: maxValue,
                            color: isCorrect
                                ? AppColors.lightGreen
                                : AppColors.grey5,
                          ),
                        ),
                        const Spacer(flex: 2),
                        Expanded(
                          flex: 3,
                          child: _ImpactBar(
                            value: alternative,
                            minValue: minValue,
                            maxValue: maxValue,
                            color: isCorrect
                                ? AppColors.grey5
                                : AppColors.lightGreen,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    if (!maxValue.isNegative && minValue.isNegative)
                      Align(
                        alignment: Alignment(
                          0,
                          -((0 - minValue) / (maxValue - minValue) * 2 - 1),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            height: 2,
                            width: double.maxFinite,
                            child: ColoredBox(color: AppColors.grey6),
                          ),
                        ),
                      ),
                    _ChartSupportLine(
                      minValue: minValue,
                      maxValue: maxValue,
                      value: user,
                      flexValues: const Tuple2(
                        4,
                        6,
                      ),
                    ),
                    _ChartSupportLine(
                      minValue: minValue,
                      maxValue: maxValue,
                      value: alternative,
                      flexValues: const Tuple2(
                        9,
                        1,
                      ),
                    ),
                    _ChartSupportArrow(
                      startValue: alternative,
                      endValue: user,
                      maxValue: maxValue,
                      minValue: minValue,
                      isCorrect: isCorrect,
                      correctDirection: correctDirection,
                      incorrectDirection: incorrectDirection,
                    ),
                  ],
                ),
              ),
              if (!maxValue.isNegative && !minValue.isNegative)
                const SizedBox(
                  height: 2,
                  child: ColoredBox(color: AppColors.grey6),
                ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      isCorrect ? 'Escolha correta!' : 'A sua escolha',
                      style: AppTextStyles.bodyS(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      isCorrect ? 'Se não reciclasse' : 'Escolha correta',
                      style: AppTextStyles.bodyS(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class _ImpactBar extends StatelessWidget {
  const _ImpactBar({
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.color,
  });

  final double minValue;
  final double maxValue;
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final minNValue = min(minValue, 0).abs();
    final maxPValue = max(maxValue, 0);
    final amp = maxPValue + minNValue;
    final label = value.toStringAsFixed(2);
    final offsetValue = value.isNegative ? maxPValue : minNValue;
    return FractionallySizedBox(
      heightFactor: (value.abs() + offsetValue) / amp,
      alignment:
          value.isNegative ? Alignment.topCenter : Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: value.abs() / (value.abs() + offsetValue),
        alignment:
            value.isNegative ? Alignment.bottomCenter : Alignment.topCenter,
        child: ColoredBox(
          color: color,
          child: Center(
            child: AutoSizeText(
              label,
              minFontSize: 13,
              overflowReplacement: const SizedBox(),
              style: AppTextStyles.bodyS(context.layout)
                  .withColor(AppColors.white)
                  .copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChartSupportLine extends StatelessWidget {
  const _ChartSupportLine({
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.flexValues,
  });

  final double minValue;
  final double maxValue;
  final double value;
  final Tuple2<int, int> flexValues;

  @override
  Widget build(BuildContext context) {
    final minNValue = min(minValue, 0).abs();
    final maxPValue = max(maxValue, 0);
    final amp = maxPValue + minNValue;
    final offsetValue = value.isNegative ? maxPValue : minNValue;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(flex: flexValues.item1),
        Expanded(
          flex: flexValues.item2,
          child: FractionallySizedBox(
            heightFactor: (value.abs() + offsetValue) / amp,
            alignment:
                value.isNegative ? Alignment.topCenter : Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: value.abs() / (value.abs() + offsetValue),
              alignment: value.isNegative
                  ? Alignment.bottomCenter
                  : Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: value.isNegative
                        ? const Border(
                            bottom: BorderSide(
                              color: AppColors.grey2,
                              width: 2,
                            ),
                          )
                        : const Border(
                            top: BorderSide(
                              color: AppColors.grey2,
                              width: 2,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChartSupportArrow extends StatelessWidget {
  const _ChartSupportArrow({
    required this.startValue,
    required this.endValue,
    required this.maxValue,
    required this.minValue,
    required this.isCorrect,
    required this.correctDirection,
    required this.incorrectDirection,
  });

  final double startValue;
  final double endValue;
  final double maxValue;
  final double minValue;
  final bool isCorrect;
  final AxisDirection correctDirection;
  final AxisDirection incorrectDirection;

  @override
  Widget build(BuildContext context) {
    final minNValue = min(minValue, 0).abs();
    final maxPValue = max(maxValue, 0);
    final amp = maxPValue + minNValue;
    final value = endValue - startValue;
    final offsetValue = startValue > endValue
        ? startValue.isNegative
            ? startValue
            : 0
        : startValue.isNegative
            ? 0
            : startValue;
    return Positioned.fill(
      right: -10,
      child: FractionallySizedBox(
        heightFactor: (value.abs() + offsetValue.abs()) / amp,
        alignment:
            value.isNegative ? Alignment.topCenter : Alignment.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: value.abs() / (value.abs() + offsetValue.abs()),
          alignment:
              value.isNegative ? Alignment.bottomCenter : Alignment.topCenter,
          child: Align(
            alignment: Alignment.centerRight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double padding;
                if (constraints.maxHeight - 20 > 16) {
                  padding = 10;
                } else {
                  padding = 5;
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: padding),
                  child: OverflowBox(
                    alignment: startValue.isNegative
                        ? Alignment.bottomRight
                        : Alignment.topRight,
                    maxHeight: 200,
                    maxWidth: 16,
                    child: Arrow(
                      strokeWidth: 2,
                      size: Size(
                        16,
                        max(
                          constraints.maxHeight - 2 * padding,
                          16,
                        ),
                      ),
                      color:
                          isCorrect ? AppColors.lightGreen : AppColors.ratingF,
                      direction:
                          isCorrect ? correctDirection : incorrectDirection,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
