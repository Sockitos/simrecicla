import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/gen/assets.gen.dart';
import 'package:simtech/models/consumer/package.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/bin_selection_screen_model.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/bins_targets.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/draggable_components.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/results.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/same_bin_dialog.dart';
import 'package:simtech/ui/widgets/app_screen.dart';

final packageProvider = Provider<Package>((ref) => throw UnimplementedError());

class BinSelectionScreen extends ConsumerWidget {
  const BinSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateProvider = binSelectionScreenSNProvider;
    final state = ref.watch(stateProvider);
    final package = state.package;
    final middleWidth = context.layout.value<double>(xs: 230, lg: 240);
    final splitWidth = (MediaQuery.of(context).size.width -
            2 * (AppSpacings.big(context.layout)) -
            middleWidth) *
        0.4;
    return AppScreen(
      body: context.layout.breakpoint > LayoutBreakpoint.sm
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSpacings.big(context.layout)),
                Text(
                  package.name.replaceAll(RegExp(r'\n'), ' '),
                  textAlign: TextAlign.left,
                  style: AppTextStyles.h2(context.layout)
                      .withColor(AppColors.lightGreen),
                ),
                if (state.showResults &&
                    context.layout.breakpoint < LayoutBreakpoint.lg)
                  SizedBox(height: AppSpacings.small(context.layout)),
                Row(
                  children: [
                    if (state.showResults) ...[
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ConstrainedBox(
                            constraints: context.layout.value(
                              xs: const BoxConstraints(),
                              lg: const BoxConstraints(maxWidth: 1200),
                            ),
                            child: Results(
                              whereComponents: state.whereComponents,
                              package: package,
                              onClose:
                                  ref.read(stateProvider.notifier).hideResults,
                            ),
                          ),
                        ),
                      ),
                      if (context.layout.breakpoint > LayoutBreakpoint.md)
                        const SizedBox(width: 30),
                    ] else ...[
                      ConstrainedBox(
                        constraints: context.layout.value(
                          xs: const BoxConstraints(minWidth: 320),
                          lg: const BoxConstraints(
                            minWidth: 520,
                            maxWidth: 650,
                          ),
                        ),
                        child: SizedBox(
                          width: splitWidth,
                          child: DraggableComponents(
                            components: package.components,
                            isDisabled: (c) => state.whereComponents[c] != null,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: middleWidth,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: _MiddleSection(),
                        ),
                      ),
                      const Spacer(),
                    ],
                    if (!(state.showResults &&
                        context.layout.breakpoint < LayoutBreakpoint.lg))
                      ConstrainedBox(
                        constraints: context.layout.value(
                          xs: const BoxConstraints(minWidth: 400),
                          lg: const BoxConstraints(
                            minWidth: 540,
                            maxWidth: 700,
                          ),
                        ),
                        child: SizedBox(
                          width: splitWidth,
                          child: BinsTargets(
                            whereComponents: state.whereComponents,
                            onAcceptComponent:
                                ref.read(stateProvider.notifier).placeComponent,
                          ),
                        ),
                      ),
                  ],
                ),
                if (!(state.showResults &&
                    context.layout.breakpoint < LayoutBreakpoint.lg)) ...[
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ConstrainedBox(
                      constraints: context.layout.value(
                        xs: const BoxConstraints(minWidth: 420),
                        lg: const BoxConstraints(
                          minWidth: 540,
                          maxWidth: 700,
                        ),
                      ),
                      child: SizedBox(
                        width: splitWidth,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: state.whereComponents.keys.length ==
                                    package.components.length
                                ? ref.read(stateProvider.notifier).showResults
                                : null,
                            child: const Text('VERIFICAR'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 30),
              ],
            )
          : Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: AppSpacings.big(context.layout)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        package.name.replaceAll(RegExp(r'\n'), ' '),
                        textAlign: TextAlign.left,
                        style: AppTextStyles.h2(context.layout)
                            .withColor(AppColors.lightGreen),
                      ),
                    ),
                    SizedBox(height: AppSpacings.small(context.layout)),
                    if (state.showResults) ...[
                      VerticalResults(
                        whereComponents: state.whereComponents,
                        package: package,
                        onClose: ref.read(stateProvider.notifier).hideResults,
                      ),
                      SizedBox(height: AppSpacings.big(context.layout)),
                    ] else ...[
                      ConstrainedBox(
                        constraints: context.layout.value(
                          xs: BoxConstraints(
                            minHeight: 440,
                            maxHeight: min(
                              500,
                              max(
                                440,
                                1.25 *
                                    (MediaQuery.of(context).size.width -
                                        AppSpacings.big(context.layout)),
                              ),
                            ),
                          ),
                          sm: const BoxConstraints(
                            minHeight: 550,
                            maxHeight: 750,
                          ),
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom -
                              60 -
                              context.layout.value(xs: 305, sm: 420),
                          child: BinsTargets(
                            whereComponents: state.whereComponents,
                            onAcceptComponent:
                                ref.read(stateProvider.notifier).placeComponent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: state.whereComponents.keys.length ==
                                  package.components.length
                              ? ref.read(stateProvider.notifier).showResults
                              : null,
                          child: const Text('VERIFICAR'),
                        ),
                      ),
                      SizedBox(height: AppSpacings.big(context.layout)),
                      SizedBox(
                        height: context.layout.value(xs: 140, sm: 200),
                      ),
                    ],
                  ],
                ),
                if (!state.showResults)
                  Positioned(
                    left: -AppSpacings.big(context.layout),
                    right: -AppSpacings.big(context.layout),
                    bottom: 0,
                    child: SizedBox(
                      height: context.layout.value(xs: 140, sm: 200),
                      child: Ink(
                        color: AppColors.grey4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacings.big(context.layout),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (final c in package.components)
                                  DraggableComponentWithName(
                                    component: c,
                                    isDisabled:
                                        state.whereComponents[c] != null,
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}

class _MiddleSection extends StatelessWidget {
  const _MiddleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Qual o contentor\ncorreto?',
                textAlign: TextAlign.center,
                style: AppTextStyles.h3(context.layout),
              ),
              const SizedBox(height: 10),
              Text(
                'Arrasta cada\ncomponente para o\nrespetivo contentor',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyL(context.layout),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Assets.svgs.bigArrow.svg(fit: BoxFit.fitWidth),
        const SizedBox(height: 30),
        SizedBox(
          height: 160,
          child: Center(
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
                    style: AppTextStyles.bodyM(context.layout),
                    children: [
                      const TextSpan(
                        text: 'Mas não vai tudo\npara o mesmo sítio?\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: 'Não! '),
                      TextSpan(
                        text: 'Saiba mais.',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog<void>(
                              context: context,
                              barrierColor: AppColors.blackShadow,
                              builder: (_) => const SameBinDialog(),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
