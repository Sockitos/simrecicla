import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
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
    return AppScreen(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: max(
            MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom -
                60,
            900,
          ),
          minHeight: 900,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Text(
              'Como é a sua embalagem?',
              textAlign: TextAlign.left,
              style: AppTextStyles.h2(context.layout)
                  .withColor(AppColors.lightGreen),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!state.showResults) ...[
                    const SizedBox(width: 60),
                    SizedBox(
                      width: 520,
                      child: DraggableComponents(
                        components: package.components,
                        isDisabled: (c) => state.whereComponents[c] != null,
                      ),
                    ),
                    const SizedBox(width: 120),
                    SizedBox(
                      width: 210,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 160,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Qual o contentor correto?',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.h3(context.layout),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Arrasta cada componente para o respetivo contentor.',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.bodyL(context.layout),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Assets.svgs.bigArrow.svg(),
                          const SizedBox(height: 30),
                          const SizedBox(height: 160),
                        ],
                      ),
                    ),
                  ] else
                    Results(
                      whereComponents: state.whereComponents,
                      package: package,
                      onClose: ref.read(stateProvider.notifier).hideResults,
                    ),
                  const SizedBox(width: 180),
                  BinsTargets(
                    whereComponents: state.whereComponents,
                    onAcceptComponent:
                        ref.read(stateProvider.notifier).placeComponent,
                  ),
                  const SizedBox(width: 120),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 60),
                  const SizedBox(width: 520),
                  const SizedBox(width: 120),
                  SizedBox(
                    width: 210,
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
                                text: 'Mas não vai tudo para o mesmo sítio?\n',
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
                  const SizedBox(width: 180),
                  SizedBox(
                    width: 550,
                    child: !state.showResults
                        ? Center(
                            child: ElevatedButton(
                              onPressed: state.whereComponents.keys.length ==
                                      package.components.length
                                  ? ref.read(stateProvider.notifier).showResults
                                  : null,
                              child: const Text('VERIFICAR'),
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 120),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
