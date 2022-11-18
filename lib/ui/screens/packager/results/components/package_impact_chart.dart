import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/packager/package_impact.dart';
import 'package:simtech/ui/widgets/arrow.dart';
import 'package:simtech/ui/widgets/line.dart';
import 'package:simtech/ui/widgets/text_arrows.dart';
import 'package:tuple/tuple.dart';

class PackageImpactChart extends StatelessWidget {
  const PackageImpactChart({
    super.key,
    required this.impact,
  });

  final PackageImpact impact;

  @override
  Widget build(BuildContext context) {
    final maxValue = max(impact.producao, impact.impacteTotal);
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(120, 30, 120, 0),
              child: TextArrows(
                label: 'Como melhorar a minha embalagem?',
                labelStyle:
                    AppTextStyles.h4(context.layout).withColor(AppColors.black),
                color: AppColors.grey6,
                heightFactor: 0.6,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.topCenter,
                              clipBehavior: Clip.none,
                              children: [
                                _ChartSupportLine(
                                  value: impact.producao,
                                  maxValue: maxValue,
                                  flexValues: const Tuple3(5, 2, 17),
                                ),
                                _ChartSupportLine(
                                  value: impact.impacteTotal - impact.eol,
                                  maxValue: maxValue,
                                  flexValues: const Tuple3(5, 8, 11),
                                ),
                                _ChartSupportLine(
                                  value: impact.impacteTotal,
                                  maxValue: maxValue,
                                  flexValues: const Tuple3(5, 14, 5),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(height: 88),
                                    const Spacer(),
                                    Expanded(
                                      flex: 3,
                                      child: FractionallySizedBox(
                                        heightFactor:
                                            impact.impacteTotal / maxValue,
                                        alignment: Alignment.bottomCenter,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: const [
                                            Positioned.fill(
                                              right: -50,
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                  height: double.maxFinite,
                                                  width: 20,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                          color: AppColors.blue,
                                                          width: 2,
                                                        ),
                                                        bottom: BorderSide(
                                                          color: AppColors.blue,
                                                          width: 2,
                                                        ),
                                                        right: BorderSide(
                                                          color: AppColors.blue,
                                                          width: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                DefaultTextStyle(
                                  style: AppTextStyles.bodyM(context.layout)
                                      .withColor(AppColors.grey6),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      Expanded(
                                        flex: 4,
                                        child: _ChartBarWithHeader(
                                          maxValue: maxValue,
                                          value: impact.producao,
                                          color: AppColors.grey6,
                                          label:
                                              'Produção com\nmaterial virgem',
                                        ),
                                      ),
                                      const Spacer(flex: 2),
                                      Expanded(
                                        flex: 4,
                                        child: _ChartBarWithHeader(
                                          maxValue: maxValue,
                                          value: -1 * impact.incorporacao,
                                          offsetValue: impact.producao -
                                              impact.incorporacao,
                                          color: AppColors.ratingB,
                                          label:
                                              'Incorporação de\nmaterial reciclado',
                                        ),
                                      ),
                                      const Spacer(flex: 2),
                                      Expanded(
                                        flex: 4,
                                        child: _ChartBarWithHeader(
                                          maxValue: maxValue,
                                          value: impact.eol,
                                          offsetValue: impact.eol.isNegative
                                              ? impact.producao -
                                                  impact.incorporacao +
                                                  impact.eol
                                              : impact.producao -
                                                  impact.incorporacao,
                                          color: impact.eol.isNegative
                                              ? AppColors.ratingA
                                              : AppColors.ratingF,
                                          label: 'Fim de vida\n',
                                        ),
                                      ),
                                      const Spacer(),
                                      const Spacer(),
                                      Expanded(
                                        flex: 4,
                                        child: _ChartBarWithHeader(
                                          maxValue: maxValue,
                                          value: impact.impacteTotal,
                                          color: AppColors.blue,
                                          label: 'Impacte total\nda embalagem',
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                            child: ColoredBox(color: AppColors.grey6),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Column(
                      children: [
                        const SizedBox(height: 88),
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: FractionallySizedBox(
                            heightFactor:
                                max(impact.impacteTotal / maxValue, 0.15),
                            alignment: Alignment.bottomCenter,
                            child: OverflowBox(
                              alignment: Alignment.topCenter,
                              maxHeight: 300,
                              maxWidth: 250,
                              child: ColoredBox(
                                color: AppColors.grey2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'A produção de',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.bodyM(
                                        context.layout,
                                      ),
                                    ),
                                    Text(
                                      '1000 embalagens',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.h4(context.layout),
                                    ),
                                    Text(
                                      'equivale a',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.bodyM(
                                        context.layout,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Arrow(
                                      size: Size(22, 32),
                                      strokeWidth: 2,
                                      color: AppColors.blue,
                                      direction: AxisDirection.down,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'CO2 emitido por\num ligeiro em',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.bodyM(
                                        context.layout,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.drive_eta_outlined,
                                          color: AppColors.lightGreen,
                                          size: 52,
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          children: [
                                            Text(
                                              '${((impact.impacteTotal * 1000) / 0.21294).round()}',
                                              textAlign: TextAlign.center,
                                              style: AppTextStyles.h3(
                                                context.layout,
                                              ),
                                            ),
                                            Text(
                                              'km',
                                              textAlign: TextAlign.center,
                                              style: AppTextStyles.h4(
                                                context.layout,
                                              ).copyWith(height: 1),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 200),
          ],
        ),
      ],
    );
  }
}

class _ChartSupportLine extends StatelessWidget {
  const _ChartSupportLine({
    required this.value,
    required this.maxValue,
    required this.flexValues,
  });

  final double value;
  final double maxValue;
  final Tuple3<int, int, int> flexValues;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 88),
        const Spacer(),
        Expanded(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(flex: flexValues.item1),
              Expanded(
                flex: flexValues.item2,
                child: FractionallySizedBox(
                  heightFactor: value / maxValue,
                  alignment: Alignment.bottomCenter,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: AppColors.grey4,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(flex: flexValues.item3),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChartBarWithHeader extends StatelessWidget {
  const _ChartBarWithHeader({
    required this.maxValue,
    required this.value,
    this.offsetValue = 0,
    required this.color,
    required this.label,
  });

  final double maxValue;
  final double value;
  final double offsetValue;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _BarHeader(
          label: label,
          lineColor: color,
        ),
        const Spacer(),
        Expanded(
          flex: 3,
          child: _ImpactBar(
            maxValue: maxValue,
            value: value,
            offsetValue: offsetValue,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _BarHeader extends StatelessWidget {
  const _BarHeader({
    required this.label,
    required this.lineColor,
  });

  final String label;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.visible,
          ),
          const Spacer(),
          Line(
            size: const Size(2, 24),
            color: lineColor,
            axis: Axis.vertical,
          ),
        ],
      ),
    );
  }
}

class _ImpactBar extends StatelessWidget {
  const _ImpactBar({
    required this.maxValue,
    required this.value,
    this.offsetValue = 0,
    required this.color,
  });

  final double maxValue;
  final double value;
  final double offsetValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var label = '';
    if (offsetValue != 0 && !value.isNegative) label += '+';
    label += value.toStringAsFixed(2);
    return FractionallySizedBox(
      heightFactor: (value.abs() + offsetValue) / maxValue,
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: value.abs() / (value.abs() + offsetValue),
        alignment: Alignment.topCenter,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ColoredBox(
              color: color,
              child: Center(
                child: Text(
                  label,
                  style: AppTextStyles.bodyL(context.layout)
                      .withColor(AppColors.white)
                      .copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                      ),
                ),
              ),
            ),
            if (offsetValue != 0 && value != 0)
              Positioned(
                left: -40,
                bottom: 10,
                child: Arrow(
                  size: const Size(22, 32),
                  strokeWidth: 2,
                  color: color,
                  direction:
                      value.isNegative ? AxisDirection.down : AxisDirection.up,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
