import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/models/packager/package_impact.dart';
import 'package:simrecicla/ui/widgets/arrow.dart';
import 'package:simrecicla/ui/widgets/line.dart';
import 'package:simrecicla/ui/widgets/text_arrows.dart';
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
      alignment: Alignment.bottomCenter,
      children: [
        if (context.layout.breakpoint > LayoutBreakpoint.md)
          SizedBox(
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DefaultTextStyle(
              style: context.layout
                  .value(
                    xs: AppTextStyles.bodyS(context.layout),
                    md: AppTextStyles.bodyM(context.layout),
                  )
                  .withColor(AppColors.grey6),
              child: Row(
                children: [
                  if (context.layout.breakpoint > LayoutBreakpoint.xs)
                    const Spacer(),
                  Expanded(
                    flex: 8,
                    child: _ChartBarHeader(
                      lineColor: AppColors.grey6,
                      label: context.layout.value(
                        xs: 'Produção',
                        sm: 'Produção com\nmaterial virgem',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: _ChartBarHeader(
                      lineColor: AppColors.ratingB,
                      label: context.layout.value(
                        xs: 'Material\nreciclado',
                        sm: 'Incorporação de\nmaterial reciclado',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: _ChartBarHeader(
                      lineColor: impact.eol.isNegative
                          ? AppColors.ratingA
                          : AppColors.ratingF,
                      label: context.layout.value(
                        xs: 'Fim de\nvida',
                        sm: 'Fim de vida\n',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: context.layout.value(xs: 6, sm: 7),
                    child: _ChartBarHeader(
                      lineColor: AppColors.blue,
                      label: context.layout.value(
                        xs: 'Impacte\ntotal',
                        sm: 'Impacte total\nda embalagem',
                      ),
                    ),
                  ),
                  if (context.layout.breakpoint > LayoutBreakpoint.md)
                    const SizedBox(width: 260),
                ],
              ),
            ),
            SizedBox(height: AppSpacings.big(context.layout)),
            Expanded(
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
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
                                if (context.layout.breakpoint >
                                    LayoutBreakpoint.md)
                                  FractionallySizedBox(
                                    heightFactor:
                                        impact.impacteTotal / maxValue,
                                    alignment: Alignment.bottomCenter,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: const [
                                        Positioned.fill(
                                          right: -50,
                                          child: Align(
                                            alignment: Alignment.centerRight,
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (context.layout.breakpoint >
                                        LayoutBreakpoint.xs)
                                      const Spacer(),
                                    Expanded(
                                      flex: 6,
                                      child: _ChartBar(
                                        maxValue: maxValue,
                                        value: impact.producao,
                                        color: AppColors.grey6,
                                      ),
                                    ),
                                    if (context.layout.breakpoint >
                                        LayoutBreakpoint.xs)
                                      const Spacer(flex: 2),
                                    Expanded(
                                      flex: 6,
                                      child: _ChartBar(
                                        maxValue: maxValue,
                                        value: -1 * impact.incorporacao,
                                        offsetValue: impact.producao -
                                            impact.incorporacao,
                                        color: AppColors.ratingB,
                                      ),
                                    ),
                                    if (context.layout.breakpoint >
                                        LayoutBreakpoint.xs)
                                      const Spacer(flex: 2),
                                    Expanded(
                                      flex: 6,
                                      child: _ChartBar(
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
                                      ),
                                    ),
                                    if (context.layout.breakpoint >
                                        LayoutBreakpoint.xs)
                                      const Spacer(flex: 2),
                                    Expanded(
                                      flex: 6,
                                      child: _ChartBar(
                                        maxValue: maxValue,
                                        value: impact.impacteTotal,
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    if (context.layout.breakpoint >
                                        LayoutBreakpoint.xs)
                                      const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                            child: ColoredBox(color: AppColors.grey6),
                          ),
                        ],
                      ),
                    ),
                    if (context.layout.breakpoint > LayoutBreakpoint.md) ...[
                      const SizedBox(width: 80),
                      SizedBox(
                        width: 180,
                        child: FractionallySizedBox(
                          heightFactor:
                              max(impact.impacteTotal / maxValue, 0.1),
                          alignment: Alignment.bottomCenter,
                          child: OverflowBox(
                            alignment: Alignment.topCenter,
                            maxHeight: 400,
                            maxWidth: 180,
                            child: ColoredBox(
                              color: AppColors.grey2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
              ),
            ),
            if (context.layout.breakpoint > LayoutBreakpoint.md)
              const SizedBox(height: 200)
            else ...[
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
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
                    ],
                  ),
                  const Spacer(),
                  Arrow(
                    size: Size(context.layout.value(xs: 32, sm: 62), 22),
                    strokeWidth: 2,
                    color: AppColors.blue,
                    direction: AxisDirection.right,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'CO2 emitido por\num ligeiro em',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyM(
                          context.layout,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.drive_eta_outlined,
                            color: AppColors.lightGreen,
                            size: 44,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${((impact.impacteTotal * 1000) / 0.21294).round()} km',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.h4(
                              context.layout,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ],
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
    return Row(
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
    );
  }
}

class _ChartBarHeader extends StatelessWidget {
  const _ChartBarHeader({
    required this.label,
    required this.lineColor,
  });

  final String label;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.layout.value(xs: 74, md: 88),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
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

class _ChartBar extends StatelessWidget {
  const _ChartBar({
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
                child: AutoSizeText(
                  label,
                  overflowReplacement: const SizedBox(),
                  minFontSize: 15,
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
              if (context.layout.breakpoint > LayoutBreakpoint.xs)
                Positioned(
                  left: -40,
                  bottom: 10,
                  child: Arrow(
                    size: const Size(22, 32),
                    strokeWidth: 2,
                    color: color,
                    direction: value.isNegative
                        ? AxisDirection.down
                        : AxisDirection.up,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
