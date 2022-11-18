import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/packager/enums.dart';
import 'package:simtech/models/packager/package_impact.dart';
import 'package:simtech/ui/screens/packager/components/rating_bar.dart';
import 'package:simtech/ui/screens/packager/results/components/package_impact_chart.dart';
import 'package:simtech/ui/screens/packager/results/components/recommendation.dart';
import 'package:simtech/ui/widgets/app_screen.dart';
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
    return AppScreen(
      padding: EdgeInsets.zero,
      body: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Ink(
                    color: AppColors.grey2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Resultado',
                            style: AppTextStyles.h2(context.layout)
                                .withColor(AppColors.lightGreen),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Impacte Ambiental',
                            style: AppTextStyles.h4(context.layout),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'kg CO2 produzido',
                            style: AppTextStyles.bodyL(context.layout),
                          ),
                          const SizedBox(height: 60),
                          SizedBox(
                            height: 640,
                            child: PackageImpactChart(impact: impact),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recomendações',
                          style: AppTextStyles.h2(context.layout)
                              .withColor(AppColors.lightGreen),
                        ),
                        const SizedBox(height: 30),
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
            SizedBox(
              width: 550,
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
                              const SizedBox(width: 40),
                              Column(
                                children: [
                                  Flexible(
                                    child: SizedBox(
                                      height:
                                          RatingBar.getArrowPosition(rating),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 48),
                                        child: SizedBox(
                                          width: 300,
                                          child: Material(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                36,
                                                76,
                                                36,
                                                36,
                                              ),
                                              child: Text(
                                                rating.description,
                                                style: AppTextStyles.bodyL(
                                                  context.layout,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 48,
                                        child: CircleAvatar(
                                          backgroundColor: rating.color,
                                          radius: 50,
                                          child: Text(
                                            rating.name.toUpperCase(),
                                            style: GoogleFonts.dosis(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 60,
                                                color: AppColors.white,
                                                height: 1.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              RatingBar(rating: rating),
                            ],
                          ),
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
    );
  }
}
