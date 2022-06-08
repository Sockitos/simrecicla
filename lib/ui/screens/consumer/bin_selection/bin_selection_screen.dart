import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/component.dart';
import 'package:simtech/models/package.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/bin_target.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/draggable_components.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/results.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/same_bin_dialog.dart';
import 'package:simtech/ui/widgets/my_mouse_region.dart' as my;
import 'package:simtech/ui/widgets/screen_wrapper.dart';

class BinSelectionScreen extends HookWidget {
  const BinSelectionScreen({
    super.key,
    required this.package,
  });

  final Package package;

  @override
  Widget build(BuildContext context) {
    final whereComponents = useState<Map<Component, Where>>({});
    final isSelecting = useState<bool>(true);
    final isBinning = useState<bool>(false);

    return ScreenWrapper(
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
                  .copyWith(color: AppColors.lightGreen),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSelecting.value) ...[
                    const SizedBox(width: 60),
                    SizedBox(
                      width: 520,
                      child: DraggableComponents(
                        package: package,
                        hiddenComponents: whereComponents.value.keys
                            .where((k) => whereComponents.value[k] != null)
                            .toList(),
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
                                  style:
                                      AppTextStyles.paragraph(context.layout),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          SvgPicture.asset('assets/svgs/big_arrow.svg'),
                          const SizedBox(height: 30),
                          const SizedBox(height: 160),
                        ],
                      ),
                    ),
                  ] else
                    Results(
                      whereComponents: whereComponents,
                      isSelecting: isSelecting,
                      package: package,
                    ),
                  const SizedBox(width: 180),
                  my.MouseRegion(
                    onEnter: (_) => isBinning.value = true,
                    onExit: (_) => isBinning.value = false,
                    child: SizedBox(
                      height: 640,
                      width: 550,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Center(
                              child: SizedBox(
                                height: 400,
                                width: 400,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.grey3,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: BinTarget(
                                label: 'Ecoponto Amarelo',
                                svgPath: 'assets/svgs/yellow_bin.svg',
                                components: whereComponents.value.keys
                                    .where(
                                      (k) =>
                                          whereComponents.value[k] ==
                                          Where.recolhaPlasticoMetal,
                                    )
                                    .toList(),
                                onAccept: (data) {
                                  whereComponents.value = {
                                    ...whereComponents.value
                                  }..update(
                                      data,
                                      (value) => Where.recolhaPlasticoMetal,
                                      ifAbsent: () =>
                                          Where.recolhaPlasticoMetal,
                                    );
                                },
                                forceHighlighted: !isBinning.value,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: BinTarget(
                                label: 'Ecoponto Azul',
                                svgPath: 'assets/svgs/blue_bin.svg',
                                components: whereComponents.value.keys
                                    .where(
                                      (k) =>
                                          whereComponents.value[k] ==
                                          Where.recolhaPapelCartao,
                                    )
                                    .toList(),
                                onAccept: (data) {
                                  whereComponents.value = {
                                    ...whereComponents.value
                                  }..update(
                                      data,
                                      (value) => Where.recolhaPapelCartao,
                                      ifAbsent: () => Where.recolhaPapelCartao,
                                    );
                                },
                                forceHighlighted: !isBinning.value,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: BinTarget(
                                label: 'Ecoponto Verde',
                                svgPath: 'assets/svgs/green_bin.svg',
                                components: whereComponents.value.keys
                                    .where(
                                      (k) =>
                                          whereComponents.value[k] ==
                                          Where.recolhaVidro,
                                    )
                                    .toList(),
                                onAccept: (data) {
                                  whereComponents.value = {
                                    ...whereComponents.value
                                  }..update(
                                      data,
                                      (value) => Where.recolhaVidro,
                                      ifAbsent: () => Where.recolhaVidro,
                                    );
                                },
                                forceHighlighted: !isBinning.value,
                              ),
                            ),
                            Positioned.fill(
                              bottom: 10,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: BinTarget(
                                  label: 'Contentor Indiferenciado',
                                  svgPath: 'assets/svgs/grey_bin.svg',
                                  components: whereComponents.value.keys
                                      .where(
                                        (k) =>
                                            whereComponents.value[k] ==
                                            Where.recolhaIndiferenciada,
                                      )
                                      .toList(),
                                  onAccept: (data) {
                                    whereComponents.value = {
                                      ...whereComponents.value
                                    }..update(
                                        data,
                                        (value) => Where.recolhaIndiferenciada,
                                        ifAbsent: () =>
                                            Where.recolhaIndiferenciada,
                                      );
                                  },
                                  forceHighlighted: !isBinning.value,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                            style: AppTextStyles.dropdown(context.layout),
                            children: [
                              const TextSpan(
                                text: 'Mas não vai tudo para o mesmo sítio?\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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
                                      barrierColor: Colors.black12,
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
                    child: isSelecting.value
                        ? Center(
                            child: ElevatedButton(
                              onPressed: whereComponents.value.keys.length ==
                                      package.components.length
                                  ? () {
                                      isSelecting.value = false;
                                    }
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
