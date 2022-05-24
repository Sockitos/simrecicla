import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/custom_icons.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/models/package.dart';
import 'package:simtech/src/services/consumer_service.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/bin_target.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/bird_icon_button.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/draggable_components.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/state/bin_selection_state.dart';
import 'package:simtech/src/ui/widgets/my_mouse_region.dart' as my;
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class BinSelectionScreen extends HookWidget {
  const BinSelectionScreen({
    super.key,
    required this.package,
  });

  final Package package;

  @override
  Widget build(BuildContext context) {
    final whereComponents = useState<Map<Component, Where>>({});
    final isSelecting = useState<bool>(true);
    final isBinning = useState<bool>(false);

    return ScreenWrapper(
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                package.name,
                style: AppTextStyles.h2(context.layout)
                    .copyWith(color: AppColors.lightGreen),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSelecting.value) ...[
                  const SizedBox(width: 60),
                  SizedBox(
                    width: 520,
                    child: DraggableComponents(
                      package: package,
                      hiddenComponents: whereComponents.value.keys
                          .where((k) => whereComponents.value[k] != null)
                          .toList(),
                    ),
                  ),
                  const SizedBox(width: 120),
                  SizedBox(
                    width: 210,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Qual o contentor correto?',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.h3(context.layout),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Arrasta cada componente para o respetivo contentor.',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.paragraph(context.layout),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SvgPicture.asset('assets/svgs/big_arrow.svg'),
                        const SizedBox(height: 30),
                        const SizedBox(height: 160),
                      ],
                    ),
                  ),
                ] else
                  Results(
                    whereComponents: whereComponents,
                    isSelecting: isSelecting,
                    package: package,
                  ),
                const SizedBox(width: 180),
                my.MouseRegion(
                  onEnter: (_) => isBinning.value = true,
                  onExit: (_) => isBinning.value = false,
                  child: SizedBox(
                    height: 640,
                    width: 550,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Center(
                            child: SizedBox(
                              height: 400,
                              width: 400,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.grey3,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: BinTarget(
                              label: 'Ecoponto Amarelo',
                              svgPath: 'assets/svgs/yellow_bin.svg',
                              components: whereComponents.value.keys
                                  .where(
                                    (k) =>
                                        whereComponents.value[k] ==
                                        Where.recolhaPlasticoMetal,
                                  )
                                  .toList(),
                              onAccept: (data) {
                                whereComponents.value = {
                                  ...whereComponents.value
                                }..update(
                                    data,
                                    (value) => Where.recolhaPlasticoMetal,
                                    ifAbsent: () => Where.recolhaPlasticoMetal,
                                  );
                              },
                              forceHighlighted: !isBinning.value,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: BinTarget(
                              label: 'Ecoponto Azul',
                              svgPath: 'assets/svgs/blue_bin.svg',
                              components: whereComponents.value.keys
                                  .where(
                                    (k) =>
                                        whereComponents.value[k] ==
                                        Where.recolhaPapelCartao,
                                  )
                                  .toList(),
                              onAccept: (data) {
                                whereComponents.value = {
                                  ...whereComponents.value
                                }..update(
                                    data,
                                    (value) => Where.recolhaPapelCartao,
                                    ifAbsent: () => Where.recolhaPapelCartao,
                                  );
                              },
                              forceHighlighted: !isBinning.value,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: BinTarget(
                              label: 'Ecoponto Verde',
                              svgPath: 'assets/svgs/green_bin.svg',
                              components: whereComponents.value.keys
                                  .where(
                                    (k) =>
                                        whereComponents.value[k] ==
                                        Where.recolhaVidro,
                                  )
                                  .toList(),
                              onAccept: (data) {
                                whereComponents.value = {
                                  ...whereComponents.value
                                }..update(
                                    data,
                                    (value) => Where.recolhaVidro,
                                    ifAbsent: () => Where.recolhaVidro,
                                  );
                              },
                              forceHighlighted: !isBinning.value,
                            ),
                          ),
                          Positioned.fill(
                            bottom: 10,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: BinTarget(
                                label: 'Contentor Indiferenciado',
                                svgPath: 'assets/svgs/grey_bin.svg',
                                components: whereComponents.value.keys
                                    .where(
                                      (k) =>
                                          whereComponents.value[k] ==
                                          Where.recolhaIndiferenciada,
                                    )
                                    .toList(),
                                onAccept: (data) {
                                  whereComponents.value = {
                                    ...whereComponents.value
                                  }..update(
                                      data,
                                      (value) => Where.recolhaIndiferenciada,
                                      ifAbsent: () =>
                                          Where.recolhaIndiferenciada,
                                    );
                                },
                                forceHighlighted: !isBinning.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 120),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 60),
                const SizedBox(width: 520),
                const SizedBox(width: 120),
                SizedBox(
                  width: 210,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(
                        color: AppColors.grey2,
                        width: 6,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTextStyles.dropdown(context.layout),
                          children: const [
                            TextSpan(
                              text: 'Mas não vai tudo para o mesmo sítio?\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: 'Não! '),
                            TextSpan(
                              text: 'Saiba mais.',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 180),
                SizedBox(
                  width: 550,
                  child: isSelecting.value
                      ? Center(
                          child: ElevatedButton(
                            onPressed: whereComponents.value.keys.length ==
                                    package.components.length
                                ? () {
                                    isSelecting.value = false;
                                  }
                                : null,
                            child: const Text('VERIFICAR'),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 120),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
          child: Ink(
            width: 855,
            height: 600,
            padding: const EdgeInsets.fromLTRB(90, 40, 80, 30),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(34),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 20,
                )
              ],
            ),
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
                                        .copyWith(color: AppColors.lightGreen),
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
                                style: AppTextStyles.paragraph(context.layout),
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
                                    value: results.userImpacts.environmental,
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
                                'kg CO2eq / Embalagem',
                                behaviorPosition: charts.BehaviorPosition.start,
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
                                (value) =>
                                    value == 0 ? '' : '${value! / 10000000}',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
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
                                        Icons.account_balance_wallet_outlined,
                                        size: 34,
                                        color: AppColors.lightGreen,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    'Impactes Económicos',
                                    style: AppTextStyles.h4(context.layout)
                                        .copyWith(color: AppColors.lightGreen),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                                style: AppTextStyles.paragraph(context.layout),
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
                                    value:
                                        results.alternativeImpacts.economical,
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
                                behaviorPosition: charts.BehaviorPosition.start,
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
                                (value) =>
                                    value == 0 ? '' : '${value! / 10000000}',
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
                                      style: AppTextStyles.h3(context.layout)
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
                                style: AppTextStyles.paragraph(context.layout),
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
              icon: CustomIcons.getIcon(package.iconId),
              isSelected: mode.value is PackageResults,
              onPressed: () =>
                  mode.value = const BinSelectionState.packageResults(),
            ),
            for (final c in package.components) ...[
              const SizedBox(height: 20),
              BirdIconButton(
                radius: 40,
                icon: CustomIcons.getIcon(c.iconId),
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
