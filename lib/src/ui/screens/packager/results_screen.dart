import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/answer.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/services/packager_service.dart';
import 'package:simtech/src/ui/screens/packager/form_screen.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key? key,
    required this.material,
    required this.weight,
    required this.recycledPercentage,
    required this.answers,
  }) : super(key: key);

  final PMaterial material;
  final int weight;
  final double recycledPercentage;
  final Map<int, Answer> answers;

  double _getArrowPosition(Rating rating) {
    switch (rating) {
      case Rating.a:
        return 35;
      case Rating.b:
        return 145;
      case Rating.c:
        return 255;
      case Rating.d:
        return 365;
      case Rating.e:
        return 475;
      case Rating.f:
        return 585;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rating = PackagerService.getRating(
      material: material,
      answers: answers.values.toList(),
    );

    final recommendations = PackagerService.getRecommendations(
      material: material,
      answers: answers,
    );

    final impact = PackagerService.getPackageImpact(
      material: material,
      weight: weight,
      recycledPercentage: recycledPercentage,
      rating: rating,
    );

    return ScreenWrapper(
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
                                .copyWith(color: AppColors.lightGreen),
                          ),
                          SizedBox(
                            height: 350,
                            child: charts.BarChart(
                              [
                                charts.Series<DataPoint, String>(
                                  id: 'pain',
                                  data: [
                                    DataPoint(
                                      id: 'producao',
                                      label:
                                          'Produção\nEmbalagem\n${impact.producao.toStringAsFixed(4)} gCO2eq',
                                      value: impact.producao,
                                      color: AppColors.lightGreen,
                                    ),
                                    if (impact.incorporacao != 0)
                                      DataPoint(
                                        id: 'incorporacao',
                                        label:
                                            'Incorporação\nMaterial Reciclado\n${impact.incorporacao.toStringAsFixed(4)} gCO2eq',
                                        value: impact.incorporacao,
                                        color: AppColors.lightGreen,
                                      ),
                                    DataPoint(
                                      id: 'eol',
                                      label:
                                          'Fim de vida\n${impact.eol.toStringAsFixed(4)} gCO2eq',
                                      value: impact.eol,
                                      color: AppColors.lightGreen,
                                    ),
                                    DataPoint(
                                      id: 'total',
                                      label:
                                          'Impacte Total\n${impact.impacteTotal.toStringAsFixed(4)} gCO2eq',
                                      value: impact.impacteTotal,
                                      color: AppColors.lightGreen,
                                    ),
                                  ],
                                  domainFn: (d, _) => d.id,
                                  labelAccessorFn: (d, _) => d.label,
                                  measureFn: (d, _) => d.value,
                                  colorFn: (d, __) =>
                                      charts.ColorUtil.fromDartColor(d.color),
                                ),
                                charts.Series<DataPoint, String>(
                                  id: 'main',
                                  data: [
                                    if (impact.incorporacao != 0)
                                      DataPoint(
                                        id: 'incorporacao',
                                        label: '',
                                        value: impact.producao -
                                            impact.incorporacao,
                                        color: Colors.transparent,
                                      ),
                                    DataPoint(
                                      id: 'eol',
                                      label: '',
                                      value: impact.producao -
                                          impact.incorporacao -
                                          impact.eol,
                                      color: Colors.transparent,
                                    ),
                                  ],
                                  domainFn: (d, _) => d.id,
                                  labelAccessorFn: (d, _) => d.label,
                                  measureFn: (d, _) => d.value,
                                  colorFn: (d, __) =>
                                      charts.ColorUtil.fromDartColor(d.color),
                                ),
                              ],
                              barGroupingType: charts.BarGroupingType.stacked,
                              barRendererDecorator:
                                  charts.BarLabelDecorator<String>(
                                insideLabelStyleSpec:
                                    const charts.TextStyleSpec(
                                  color: charts.MaterialPalette.white,
                                  fontSize: 16,
                                  lineHeight: 1.4,
                                ),
                                outsideLabelStyleSpec:
                                    const charts.TextStyleSpec(
                                  color: charts.MaterialPalette.black,
                                  fontSize: 16,
                                  lineHeight: 1.4,
                                ),
                              ),
                              domainAxis: const charts.OrdinalAxisSpec(
                                renderSpec: charts.NoneRenderSpec(),
                              ),
                              primaryMeasureAxis: charts.NumericAxisSpec(
                                renderSpec: charts.GridlineRendererSpec(
                                  labelStyle: const charts.TextStyleSpec(
                                    color: charts.MaterialPalette.transparent,
                                  ),
                                  lineStyle: charts.LineStyleSpec(
                                    color: charts.ColorUtil.fromDartColor(
                                      AppColors.grey4,
                                    ),
                                  ),
                                ),
                                tickProviderSpec:
                                    const charts.BasicNumericTickProviderSpec(
                                  desiredTickCount: 5,
                                ),
                              ),
                            ),
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
                              .copyWith(color: AppColors.lightGreen),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: max(
                          MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom -
                              60,
                          780,
                        ),
                      ),
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
                                      height: _getArrowPosition(rating),
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
                                                PackagerService
                                                    .getRatingDescription(
                                                  rating,
                                                ),
                                                style: AppTextStyles.paragraph(
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

class DataPoint {
  DataPoint({
    required this.id,
    required this.label,
    required this.value,
    required this.color,
  });

  final String id;
  final String label;
  final double value;
  final Color color;
}

class Recommendation extends StatelessWidget {
  const Recommendation({
    Key? key,
    required this.number,
    required this.wrong,
    required this.right,
  }) : super(key: key);

  final int number;
  final String wrong;
  final String right;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 64,
          width: 64,
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
                '$number',
                style: AppTextStyles.h2(context.layout)
                    .copyWith(color: AppColors.lightGreen, height: 1.1),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Text(
            wrong,
            style: AppTextStyles.paragraph(context.layout),
          ),
        ),
        const SizedBox(width: 24),
        SvgPicture.asset(
          'assets/svgs/arrow_right.svg',
          color: AppColors.lightGreen,
          height: 40,
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Text(
            right,
            style: AppTextStyles.paragraph(context.layout),
          ),
        ),
      ],
    );
  }
}
