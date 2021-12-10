import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/answer.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/router/router.gr.dart';
import 'package:simtech/src/services/packager_service.dart';
import 'package:simtech/src/ui/screens/packager/components/dropdown_field.dart';
import 'package:simtech/src/ui/screens/packager/components/question_page.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FormScreen extends HookWidget {
  const FormScreen({Key? key}) : super(key: key);

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

  Color _getColor(Rating rating) {
    switch (rating) {
      case Rating.a:
        return AppColors.ratingA;
      case Rating.b:
        return AppColors.ratingB;
      case Rating.c:
        return AppColors.ratingC;
      case Rating.d:
        return AppColors.ratingD;
      case Rating.e:
        return AppColors.ratingE;
      case Rating.f:
        return AppColors.ratingF;
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = PackagerService.getQuestions();
    final material = useState<PMaterial?>(null);
    final answers = useState<Map<int, Answer>>({});
    final isLastPage = useState<bool>(false);

    final rating = material.value == null
        ? Rating.a
        : PackagerService.getRating(
            material: material.value!,
            answers: answers.value.values.toList(),
          );

    final controller = usePageController();

    useEffect(
      () {
        void listener() {
          if ((controller.page ?? 0.0) >= 1.5) {
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
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      'Como é a sua embalagem?',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.h2
                          .copyWith(color: AppColors.lightGreen),
                    ),
                  ),
                  const SizedBox(height: 70),
                  SizedBox(
                    height: 502,
                    child: PageView(
                      controller: controller,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    DropdownField<PMaterial>(
                                      value: material.value,
                                      onChanged: (value) =>
                                          material.value = value,
                                      hint:
                                          'Qual o material base de embalagem?',
                                      options: PMaterial.values.toList(),
                                      optionToString: (option) =>
                                          option.toStr(),
                                    ),
                                    const Spacer(),
                                    DropdownField<String>(
                                      onChanged: (value) {},
                                      hint:
                                          'Qual o processo de transformação da embalagem?',
                                      options: const [],
                                    ),
                                    const Spacer(),
                                    DropdownField<String>(
                                      onChanged: (value) {},
                                      hint: 'Qual o seu peso?',
                                      options: const [],
                                    ),
                                    Slider(
                                      activeColor: AppColors.lightGreen,
                                      thumbColor: AppColors.lightGreen,
                                      inactiveColor: AppColors.lightGreen,
                                      value: 20,
                                      max: 100,
                                      divisions: 5,
                                      onChanged: (_) {},
                                    ),
                                    const Spacer(),
                                    DropdownField<String>(
                                      onChanged: (value) {},
                                      hint:
                                          'Teor de material reciclado incorporado (%)?',
                                      options: const [],
                                    ),
                                    Slider(
                                      activeColor: AppColors.lightGreen,
                                      thumbColor: AppColors.lightGreen,
                                      inactiveColor: AppColors.lightGreen,
                                      value: 20,
                                      max: 100,
                                      divisions: 5,
                                      onChanged: (_) {},
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        QuestionPage(
                          material: material.value,
                          questions: questions.sublist(0, 8),
                          answers: answers.value,
                          onQuestionAnswered: (question, answer) =>
                              answers.value = {...answers.value}..update(
                                  question.id,
                                  (value) => answer,
                                  ifAbsent: () => answer,
                                ),
                        ),
                        QuestionPage(
                          material: material.value,
                          questions: questions.sublist(8, 14),
                          answers: answers.value,
                          onQuestionAnswered: (question, answer) =>
                              answers.value = {...answers.value}..update(
                                  question.id,
                                  (value) => answer,
                                  ifAbsent: () => answer,
                                ),
                        ),
                        QuestionPage(
                          material: material.value,
                          questions: questions.sublist(14, 20),
                          answers: answers.value,
                          onQuestionAnswered: (question, answer) =>
                              answers.value = {...answers.value}..update(
                                  question.id,
                                  (value) => answer,
                                  ifAbsent: () => answer,
                                ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                  Center(
                    child: ElevatedButtonTheme(
                      data: ElevatedButtonThemeData(
                        style: ElevatedButton.styleFrom(
                          primary: isLastPage.value
                              ? AppColors.blue
                              : AppColors.lightGreen,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: isLastPage.value
                              ? AppColors.blue
                              : AppColors.lightGreen,
                          elevation: 0,
                          shape: const StadiumBorder(),
                          minimumSize: const Size(0, 62),
                          maximumSize: const Size(double.maxFinite, 62),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          textStyle: AppTextStyles.button,
                        ),
                        onPressed: isLastPage.value
                            ? () => AutoRouter.of(context).push(
                                  ResultsScreenRoute(rating: rating),
                                )
                            : () => controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                ),
                        child: Text(
                          isLastPage.value
                              ? 'Ver Resultado e Recomendações'
                              : 'Seguinte',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                          color: AppColors.lightGreen,
                        ),
                        SmoothPageIndicator(
                          controller: controller,
                          count: 4,
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
                          color: AppColors.lightGreen,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(
              width: 550,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: _getColor(rating).withOpacity(0.2),
                child: Hero(
                  tag: 'rating_bar',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Totalmente reciclável',
                          style: AppTextStyles.paragraph,
                        ),
                        const SizedBox(height: 30),
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              height: 660,
                              width: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: const [
                                  Expanded(
                                    child: Material(color: AppColors.ratingA),
                                  ),
                                  Expanded(
                                    child: Material(color: AppColors.ratingB),
                                  ),
                                  Expanded(
                                    child: Material(color: AppColors.ratingC),
                                  ),
                                  Expanded(
                                    child: Material(color: AppColors.ratingD),
                                  ),
                                  Expanded(
                                    child: Material(color: AppColors.ratingE),
                                  ),
                                  Expanded(
                                    child: Material(color: AppColors.ratingF),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 85,
                              right: 0,
                              child: SizedBox(
                                height: 660,
                                child: DefaultTextStyle(
                                  style: AppTextStyles.h2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: const [
                                      Expanded(child: Center(child: Text('A'))),
                                      Expanded(child: Center(child: Text('B'))),
                                      Expanded(child: Center(child: Text('C'))),
                                      Expanded(child: Center(child: Text('D'))),
                                      Expanded(child: Center(child: Text('E'))),
                                      Expanded(child: Center(child: Text('F'))),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 300),
                              left: -100,
                              top: _getArrowPosition(rating),
                              child: SvgPicture.asset(
                                'assets/svgs/arrow_right.svg',
                                color: AppColors.lightGreen,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Não reciclável',
                          style: AppTextStyles.paragraph,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
