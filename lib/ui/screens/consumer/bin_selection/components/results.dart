import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/packages_icons.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/component.dart';
import 'package:simtech/models/package.dart';
import 'package:simtech/services/consumer_service.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/bird_icon_button.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/state/bin_selection_state.dart';
import 'package:simtech/ui/widgets/my_card.dart';

class Results extends HookWidget {
  const Results({
    super.key,
    required this.whereComponents,
    required this.isSelecting,
    required this.package,
  });

  final ValueNotifier<Map<Component, Where>> whereComponents;
  final ValueNotifier<bool> isSelecting;
  final Package package;

  @override
  Widget build(BuildContext context) {
    final mode =
        useState<BinSelectionState>(const BinSelectionState.packageResults());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 55),
          child: MyCard(
            child: SizedBox(
              width: 855,
              height: 600,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(90, 40, 30, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: mode.value.when(
                    packageResults: () {
                      final results =
                          ConsumerService.getResults(whereComponents.value);

                      return [
                        Text(
                          'Embalagem completa',
                          style: AppTextStyles.h2(context.layout),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
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
                                        style: AppTextStyles.h4(context.layout)
                                            .copyWith(
                                          color: AppColors.lightGreen,
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
                                    style:
                                        AppTextStyles.paragraph(context.layout),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                            SizedBox(
                              height: 180,
                              width: 360,
                              child: charts.BarChart(
                                [
                                  charts.Series<DataPoint, String>(
                                    id: 'main',
                                    data: [
                                      DataPoint(
                                        id: 'user',
                                        label: results.isCorrect
                                            ? 'Escolha correta!'
                                            : 'A sua escolha',
                                        value:
                                            results.userImpacts.environmental,
                                      ),
                                      DataPoint(
                                        id: 'id',
                                        label: results.isCorrect
                                            ? 'Se não reciclasse'
                                            : 'Escolha correta',
                                        value: results
                                            .alternativeImpacts.environmental,
                                      ),
                                    ],
                                    domainFn: (d, _) => d.label,
                                    measureFn: (d, _) => d.value * 10000000,
                                    colorFn: (d, __) =>
                                        charts.ColorUtil.fromDartColor(
                                      d.id == 'user'
                                          ? results.isCorrect
                                              ? AppColors.lightGreen
                                              : AppColors.grey5
                                          : results.isCorrect
                                              ? AppColors.grey5
                                              : AppColors.lightGreen,
                                    ),
                                  ),
                                ],
                                behaviors: [
                                  charts.ChartTitle(
                                    'g CO2eq / Embalagem',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification:
                                        charts.OutsideJustification.endDrawArea,
                                    titleStyleSpec: const charts.TextStyleSpec(
                                      fontSize: 13,
                                      color: charts.MaterialPalette.black,
                                    ),
                                  ),
                                ],
                                domainAxis: charts.OrdinalAxisSpec(
                                  showAxisLine: false,
                                  renderSpec: charts.SmallTickRendererSpec(
                                    labelStyle: const charts.TextStyleSpec(
                                      fontSize: 13,
                                      color: charts.MaterialPalette.black,
                                    ),
                                    lineStyle: charts.LineStyleSpec(
                                      color: charts.ColorUtil.fromDartColor(
                                        Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                primaryMeasureAxis: charts.NumericAxisSpec(
                                  renderSpec: charts.GridlineRendererSpec(
                                    labelStyle: const charts.TextStyleSpec(
                                      fontFamily: 'Dosis',
                                      color: charts.MaterialPalette.black,
                                    ),
                                    lineStyle: charts.LineStyleSpec(
                                      color: charts.ColorUtil.fromDartColor(
                                        AppColors.grey3,
                                      ),
                                    ),
                                  ),
                                  tickProviderSpec:
                                      const charts.BasicNumericTickProviderSpec(
                                    desiredTickCount: 5,
                                  ),
                                  tickFormatterSpec:
                                      charts.BasicNumericTickFormatterSpec(
                                    (value) => value == 0
                                        ? '0'
                                        : '${value! / 10000000}',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Row(
                          children: [
                            Expanded(
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
                                        style: AppTextStyles.h4(context.layout)
                                            .copyWith(
                                          color: AppColors.lightGreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    results.isCorrect
                                        ? 'A deposição da embalagem nos contentores adequados representa um contributo para a riqueza em Portugal superior face à não reciclagem destes materiais.'
                                        : 'Os destinos selecionados apresentam um contributo para a riqueza em Portugal inferior à colocação nos contentores adequados.',
                                    style:
                                        AppTextStyles.paragraph(context.layout),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                            SizedBox(
                              height: 180,
                              width: 360,
                              child: charts.BarChart(
                                [
                                  charts.Series<DataPoint, String>(
                                    id: 'main',
                                    data: [
                                      DataPoint(
                                        id: 'user',
                                        label: results.isCorrect
                                            ? 'Escolha correta!'
                                            : 'A sua escolha',
                                        value: results.userImpacts.economical,
                                      ),
                                      DataPoint(
                                        id: 'id',
                                        label: results.isCorrect
                                            ? 'Se não reciclasse'
                                            : 'Escolha correta',
                                        value: results
                                            .alternativeImpacts.economical,
                                      ),
                                    ],
                                    domainFn: (d, _) => d.label,
                                    measureFn: (d, _) => d.value * 10000000,
                                    colorFn: (d, __) =>
                                        charts.ColorUtil.fromDartColor(
                                      d.id == 'user'
                                          ? results.isCorrect
                                              ? AppColors.lightGreen
                                              : AppColors.grey5
                                          : results.isCorrect
                                              ? AppColors.grey5
                                              : AppColors.lightGreen,
                                    ),
                                  ),
                                ],
                                behaviors: [
                                  charts.ChartTitle(
                                    '€ / Embalagem',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification:
                                        charts.OutsideJustification.endDrawArea,
                                    titleStyleSpec: const charts.TextStyleSpec(
                                      fontSize: 13,
                                      color: charts.MaterialPalette.black,
                                    ),
                                  ),
                                ],
                                domainAxis: charts.OrdinalAxisSpec(
                                  showAxisLine: false,
                                  renderSpec: charts.SmallTickRendererSpec(
                                    labelStyle: const charts.TextStyleSpec(
                                      fontSize: 13,
                                      color: charts.MaterialPalette.black,
                                    ),
                                    lineStyle: charts.LineStyleSpec(
                                      color: charts.ColorUtil.fromDartColor(
                                        Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                primaryMeasureAxis: charts.NumericAxisSpec(
                                  renderSpec: charts.GridlineRendererSpec(
                                    labelStyle: const charts.TextStyleSpec(
                                      fontFamily: 'Dosis',
                                      color: charts.MaterialPalette.black,
                                    ),
                                    lineStyle: charts.LineStyleSpec(
                                      color: charts.ColorUtil.fromDartColor(
                                        AppColors.grey3,
                                      ),
                                    ),
                                  ),
                                  tickProviderSpec:
                                      const charts.BasicNumericTickProviderSpec(
                                    desiredTickCount: 5,
                                  ),
                                  tickFormatterSpec:
                                      charts.BasicNumericTickFormatterSpec(
                                    (value) => value == 0
                                        ? '0'
                                        : '${value! / 10000000}',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'Clique em cada componente para saber mais.',
                          style: AppTextStyles.small(context.layout)
                              .copyWith(color: AppColors.black),
                        ),
                      ];
                    },
                    componentResults: (componentId) {
                      final component = whereComponents.value.keys
                          .firstWhere((c) => c.name == componentId);
                      final isCorrect =
                          whereComponents.value[component] == component.where;
                      return [
                        Text(
                          component.name,
                          style: AppTextStyles.h2(context.layout),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          isCorrect ? component.ifTrue : component.ifFalse,
                          style: AppTextStyles.paragraph(context.layout),
                        ),
                        const SizedBox(height: 60),
                        Text(
                          'Recomendações',
                          style: AppTextStyles.h3(context.layout).copyWith(
                            color: AppColors.lightGreen,
                          ),
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
                                          style:
                                              AppTextStyles.h3(context.layout)
                                                  .copyWith(
                                            color: AppColors.lightGreen,
                                            height: 1.1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    component.recommendations[i],
                                    style:
                                        AppTextStyles.paragraph(context.layout),
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
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: 15,
          child: IconButton(
            onPressed: () => isSelecting.value = true,
            iconSize: 44,
            color: AppColors.lightGreen,
            icon: const Icon(Icons.close_outlined),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            BirdIconButton(
              radius: 40,
              icon: PackagesIcons.getIcon(package.iconId),
              isSelected: mode.value is PackageResults,
              onPressed: () =>
                  mode.value = const BinSelectionState.packageResults(),
            ),
            for (final c in package.components) ...[
              const SizedBox(height: 20),
              BirdIconButton(
                radius: 40,
                icon: PackagesIcons.getIcon(c.iconId),
                isCorrect: whereComponents.value[c] == c.where,
                isSelected: mode.value is ComponentResults &&
                    (mode.value as ComponentResults).componentId == c.name,
                onPressed: () =>
                    mode.value = BinSelectionState.componentResults(
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

class DataPoint {
  DataPoint({
    required this.id,
    required this.label,
    required this.value,
  });

  final String id;
  final String label;
  final double value;
}
