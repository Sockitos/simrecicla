import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/ui/screens/packager/form/components/app_form_field.dart';
import 'package:simtech/utils/hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionsPageView extends HookWidget {
  const QuestionsPageView({
    super.key,
    this.onSubmit,
    required this.questions,
  });

  final VoidCallback? onSubmit;
  final List<AppFormField> questions;

  @override
  Widget build(BuildContext context) {
    final columns = context.layout.value(xs: 1, lg: 2);
    const rows = 4;
    final pages = (questions.length / (columns * rows)).ceil();
    final controller = usePageController();
    final isLastPage = useIsLastPage(controller, pageCount: pages);
    return Column(
      children: [
        SizedBox(
          height: rows * AppFormField.height,
          child: PageView(
            controller: controller,
            children: [
              for (var p = 0; p < pages; p++)
                Padding(
                  padding: AppSpacings.screenPadding(context.layout),
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
                  isLastPage ? AppColors.blue : AppColors.lightGreen,
            ),
            onPressed: isLastPage
                ? onSubmit
                : () => controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
            child: Text(
              isLastPage
                  ? context.layout.breakpoint > LayoutBreakpoint.xs
                      ? 'Ver Resultado e Recomendações'
                      : 'Ver Resultado'
                  : 'Seguinte',
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
