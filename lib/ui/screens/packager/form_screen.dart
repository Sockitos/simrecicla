import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/answer.dart';
import 'package:simtech/models/enums.dart';
import 'package:simtech/models/question.dart';
import 'package:simtech/router/router.gr.dart';
import 'package:simtech/services/packager_service.dart';
import 'package:simtech/ui/screens/packager/components/dropdown_field.dart';
import 'package:simtech/ui/screens/packager/components/form_field.dart';
import 'package:simtech/ui/screens/packager/components/number_field.dart';
import 'package:simtech/ui/screens/packager/components/percentage_field.dart';
import 'package:simtech/ui/widgets/arrow_widget.dart';
import 'package:simtech/ui/widgets/screen_wrapper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FormScreen extends HookWidget {
  const FormScreen({super.key});

  ValueChanged<Answer?>? _setAnswer(
    PMaterial? material,
    Question question,
    Map<int, Answer> answers,
    ValueChanged<Answer?>? onQuestionAnswered,
  ) {
    return material != null &&
            PackagerService.validateQuestion(
              answers: answers,
              question: question,
            )
        ? onQuestionAnswered
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final questions = PackagerService.getQuestions();
    final material = useState<PMaterial?>(null);
    final weight = useState<int?>(null);
    final recycledPercentage = useState<double>(0);
    final answers = useState<Map<int, Answer>>({});

    final rating = material.value == null
        ? Rating.a
        : PackagerService.getRating(
            material: material.value!,
            answers: answers.value.values.toList(),
          );

    final isSubmittable = weight.value != null &&
        PackagerService.validateAnswers(
          answers: answers.value,
          material: material.value,
        );

    return ScreenWrapper(
      padding: EdgeInsets.zero,
      body: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: AppSpacings.big(context.layout)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacings.big(context.layout),
                    ),
                    child: Text(
                      'Como é a sua embalagem?',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.h2(context.layout)
                          .copyWith(color: AppColors.lightGreen),
                    ),
                  ),
                  SizedBox(height: AppSpacings.small(context.layout)),
                  QuestionsPageView(
                    onSubmit: isSubmittable
                        ? () => AutoRouter.of(context).push(
                              ResultsScreenRoute(
                                material: material.value!,
                                weight: weight.value!,
                                recycledPercentage: recycledPercentage.value,
                                answers: answers.value,
                              ),
                            )
                        : null,
                    questions: [
                      DropdownField<PMaterial>(
                        value: material.value,
                        onChanged: (value) {
                          material.value = value;
                          answers.value = {};
                        },
                        hint: 'Qual o material base de embalagem?',
                        options: PMaterial.values.toList(),
                        optionToString: (option) => option.toStr(),
                      ),
                      NumberField(
                        value: weight.value,
                        onChanged: (value) => weight.value = value,
                        hint: 'Qual o seu peso (g)?',
                        inputHint: 'peso (g)',
                      ),
                      PercentageField(
                        value: recycledPercentage.value,
                        onChanged: (value) => recycledPercentage.value = value,
                        hint: 'Teor de material reciclado incorporado (%)?',
                      ),
                      for (final q in questions)
                        DropdownField<Answer>(
                          value: answers.value[q.id],
                          onChanged: _setAnswer(
                            material.value,
                            q,
                            answers.value,
                            (answer) {
                              answers.value = {...answers.value}..update(
                                  q.id,
                                  (value) => answer!,
                                  ifAbsent: () => answer!,
                                );
                            },
                          ),
                          hint: q.question,
                          info: q.info,
                          options: q.getFilteredAnswers(material.value),
                          optionToString: (answer) => answer.answer,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (context.breakpoint > LayoutBreakpoint.sm)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 550),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      context.layout.value(xs: 0.33, lg: 0.25),
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
                              child: RatingBar(rating: rating),
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

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.rating,
  });

  final Rating rating;

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
    return Hero(
      tag: 'rating_bar',
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            Text(
              'Totalmente reciclável',
              style: AppTextStyles.paragraph(context.layout),
            ),
            const Spacer(),
            SizedBox(
              height: 660,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  DefaultTextStyle(
                    style: AppTextStyles.h2(context.layout),
                    child: Column(
                      children: [
                        for (final r in Rating.values)
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(width: 35),
                                Container(color: r.color, width: 60),
                                const SizedBox(width: 25),
                                SizedBox(
                                  width: 10,
                                  child: Center(
                                    child: Text(r.name.toUpperCase()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: -55,
                    top: _getArrowPosition(rating),
                    child: const ArrowWidget(
                      size: Size(66, 40),
                      color: AppColors.lightGreen,
                      direction: AxisDirection.right,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'Não reciclável',
              style: AppTextStyles.paragraph(context.layout),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionsPageView extends HookWidget {
  const QuestionsPageView({
    super.key,
    this.onSubmit,
    required this.questions,
  });

  final VoidCallback? onSubmit;
  final List<MyFormField> questions;

  @override
  Widget build(BuildContext context) {
    final columns = context.layout.value(xs: 1, lg: 2);
    const rows = 4;
    final pages = (questions.length / (columns * rows)).ceil();

    final controller = usePageController();
    final isLastPage = useState<bool>(false);
    useEffect(
      () {
        void listener() {
          if ((controller.page ?? 0.0) >= (pages - 1.5)) {
            if (!isLastPage.value) {
              isLastPage.value = true;
            }
          } else {
            if (isLastPage.value) {
              isLastPage.value = false;
            }
          }
        }

        controller.addListener(listener);
        return () {
          controller.removeListener(listener);
        };
      },
      [controller],
    );

    return Column(
      children: [
        SizedBox(
          height: rows * MyFormField.height,
          child: PageView(
            controller: controller,
            children: [
              for (var p = 0; p < pages; p++)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacings.big(context.layout),
                  ),
                  child: columns == 1
                      ? Column(
                          children: [
                            questions[(p * rows)],
                            for (var r = 1; r < rows; r++) ...[
                              const Spacer(),
                              questions[(p * rows) + r],
                            ]
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  questions[(p * rows * columns) + 0],
                                  for (var r = 1; r < rows; r++) ...[
                                    const Spacer(),
                                    questions[(p * rows * columns) + r],
                                  ]
                                ],
                              ),
                            ),
                            SizedBox(width: AppSpacings.small(context.layout)),
                            Expanded(
                              child: Column(
                                children: [
                                  questions[(p * rows * columns) + rows + 0],
                                  for (var r = 1; r < rows; r++) ...[
                                    const Spacer(),
                                    questions[(p * rows * columns) + rows + r],
                                  ]
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isLastPage.value ? AppColors.blue : AppColors.lightGreen,
              elevation: 0,
              shape: const StadiumBorder(),
              fixedSize: const Size.fromHeight(62),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              textStyle: AppTextStyles.button(context.layout),
            ),
            onPressed: isLastPage.value
                ? onSubmit
                : () => controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
            child: Text(
              isLastPage.value ? 'Ver Resultado e Recomendações' : 'Seguinte',
            ),
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                ),
                icon: const Icon(Icons.chevron_left_rounded),
                iconSize: 48,
                splashRadius: 36,
                color: AppColors.lightGreen,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages,
                effect: const SwapEffect(
                  activeDotColor: AppColors.lightGreen,
                  dotColor: AppColors.grey4,
                  spacing: 16,
                ),
              ),
              IconButton(
                onPressed: () => controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                ),
                icon: const Icon(Icons.chevron_right_rounded),
                iconSize: 48,
                splashRadius: 36,
                color: AppColors.lightGreen,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
