import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/models/packager/enums.dart';
import 'package:simrecicla/models/packager/package_impact.dart';
import 'package:simrecicla/ui/screens/packager/components/rating_bar.dart';
import 'package:simrecicla/ui/screens/packager/results/components/package_impact_chart.dart';
import 'package:simrecicla/ui/screens/packager/results/components/rating_description.dart';
import 'package:simrecicla/ui/screens/packager/results/components/recommendation.dart';
import 'package:simrecicla/ui/widgets/app_screen.dart';
import 'package:simrecicla/ui/widgets/arrow.dart';
import 'package:tuple/tuple.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.rating,
    required this.recommendations,
    required this.impact,
  });

  final Rating rating;
  final List<Tuple2<String, String>> recommendations;
  final PackageImpact impact;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (context.layout.breakpoint < LayoutBreakpoint.md) ...[
                RatingBar(rating: rating),
                Ink(
                  color: rating.color.withOpacity(0.2),
                  padding: AppSpacings.screenPadding(context.layout) +
                      const EdgeInsets.fromLTRB(0, 30, 0, 60),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          RatingDescription(rating: rating),
                          Positioned(
                            bottom: -40,
                            left: 0,
                            right: 0,
                            child: Arrow(
                              size: const Size(32, 52),
                              color: rating.color,
                              direction: AxisDirection.down,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
              ConstrainedBox(
                constraints: context.layout.value(
                  xs: const BoxConstraints(
                    minHeight: 600,
                    maxHeight: 700,
                  ),
                  sm: const BoxConstraints(
                    minHeight: 700,
                    maxHeight: 850,
                  ),
                  md: const BoxConstraints(
                    minHeight: 750,
                    maxHeight: 900,
                  ),
                  lg: const BoxConstraints(
                    minHeight: 900,
                    maxHeight: 1100,
                  ),
                  xl: const BoxConstraints(
                    minHeight: 1000,
                    maxHeight: 1400,
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom -
                      60,
                  child: Ink(
                    color: AppColors.grey2,
                    padding: AppSpacings.screenPadding(context.layout),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: AppSpacings.big(context.layout)),
                        Text(
                          'Resultado',
                          style: AppTextStyles.h2(context.layout)
                              .withColor(AppColors.lightGreen),
                        ),
                        SizedBox(height: AppSpacings.small(context.layout)),
                        Text(
                          'Impacte Ambiental',
                          style: AppTextStyles.h4(context.layout),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'kg CO2 produzido',
                          style: AppTextStyles.bodyL(context.layout),
                        ),
                        SizedBox(height: AppSpacings.big(context.layout)),
                        Expanded(child: PackageImpactChart(impact: impact)),
                        SizedBox(height: AppSpacings.big(context.layout)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppSpacings.screenPadding(context.layout),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSpacings.small(context.layout)),
                    Text(
                      'Recomendações',
                      style: AppTextStyles.h2(context.layout)
                          .withColor(AppColors.lightGreen),
                    ),
                    SizedBox(height: AppSpacings.small(context.layout)),
                    for (var i = 0; i < recommendations.length; i++) ...[
                      Recommendation(
                        number: i + 1,
                        wrong: recommendations[i].item1,
                        right: recommendations[i].item2,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ],
                ),
              )
            ],
          ),
        ),
        if (context.breakpoint > LayoutBreakpoint.sm)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  context.layout.value(xs: 0.36, lg: 0.30),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: rating.color.withOpacity(0.2),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: max(
                        MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            MediaQuery.of(context).padding.bottom -
                            60,
                        840,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                        child: SizedBox(
                          height: 780,
                          child: Row(
                            children: [
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Flexible(
                                      child: SizedBox(
                                        height: RatingBar.getArrowPosition(
                                          rating,
                                        ),
                                      ),
                                    ),
                                    RatingDescription(rating: rating),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              RatingBar(rating: rating),
                              const SizedBox(width: 15),
                            ],
                          ),
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
    return AppScreen(
      padding: EdgeInsets.zero,
      body: context.breakpoint > LayoutBreakpoint.sm
          ? IntrinsicHeight(child: child)
          : child,
    );
  }
}
