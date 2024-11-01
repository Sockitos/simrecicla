import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/data/packager_data.dart';
import 'package:simrecicla/models/packager/answer.dart';
import 'package:simrecicla/models/packager/enums.dart';
import 'package:simrecicla/models/packager/question.dart';
import 'package:simrecicla/ui/screens/packager/components/rating_bar.dart';
import 'package:simrecicla/ui/screens/packager/form/components/dropdown_field.dart';
import 'package:simrecicla/ui/screens/packager/form/components/number_field.dart';
import 'package:simrecicla/ui/screens/packager/form/components/percentage_field.dart';
import 'package:simrecicla/ui/screens/packager/form/components/questions_page_view.dart';
import 'package:simrecicla/ui/screens/packager/form/form_screen_model.dart';
import 'package:simrecicla/ui/widgets/app_screen.dart';

final questionsProvider = Provider<List<Question>>(
  (ref) => PackagerData.questions,
);

class FormScreen extends ConsumerWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateProvider = formScreenSNProvider;
    final state = ref.watch(stateProvider);
    final questions = ref.watch(questionsProvider);
    final child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (context.layout.breakpoint < LayoutBreakpoint.md)
                RatingBar(rating: state.rating),
              SizedBox(height: AppSpacings.big(context.layout)),
              Padding(
                padding: AppSpacings.screenPadding(context.layout),
                child: Text(
                  'Como é a sua embalagem?',
                  textAlign: TextAlign.left,
                  style: AppTextStyles.h2(context.layout)
                      .withColor(AppColors.lightGreen),
                ),
              ),
              SizedBox(height: AppSpacings.small(context.layout)),
              QuestionsPageView(
                onSubmit: state.isSubmittable
                    ? () => context.go('/packager/form/results')
                    : null,
                questions: [
                  DropdownField<PMaterial>(
                    value: state.material,
                    onChanged: ref.read(stateProvider.notifier).setMaterial,
                    hint: 'Qual o material base de embalagem?',
                    options: PMaterial.values.toList(),
                    optionToString: (option) => option.name,
                  ),
                  NumberField(
                    value: state.weight,
                    onChanged: ref.read(stateProvider.notifier).setWeight,
                    hint: 'Qual o seu peso (g)?',
                    inputHint: 'peso (g)',
                  ),
                  PercentageField(
                    value: state.recycledPercentage,
                    onChanged:
                        ref.read(stateProvider.notifier).setRecycledPercentage,
                    hint: 'Teor de material reciclado incorporado (%)?',
                  ),
                  for (final q in questions)
                    DropdownField<Answer>(
                      value: state.answers[q.id],
                      onChanged:
                          state.material != null && state.isQuestionRequired(q)
                              ? (answer) {
                                  if (answer == null) return;
                                  ref.read(stateProvider.notifier).setAnswer(
                                        answer,
                                        questionId: q.id,
                                      );
                                }
                              : null,
                      hint: q.question,
                      info: q.info,
                      options: q.getFilteredAnswers(state.material),
                      optionToString: (answer) => answer.answer,
                    ),
                ],
              ),
              SizedBox(height: AppSpacings.big(context.layout)),
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
                color: state.rating.color.withOpacity(0.2),
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
                          child: RatingBar(rating: state.rating),
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
