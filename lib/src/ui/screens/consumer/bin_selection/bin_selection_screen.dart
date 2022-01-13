import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/custom_icons.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/package.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/bin_target.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/bird_icon_button.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/draggable_components.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/state/bin_selection_state.dart';
import 'package:simtech/src/ui/widgets/my_mouse_region.dart' as my;
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class BinSelectionScreen extends HookWidget {
  const BinSelectionScreen({
    Key? key,
    required this.package,
  }) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) {
    final whereComponents = useState<Map<Component, Where>>({});
    final isSelecting = useState<bool>(true);
    final isBinning = useState<bool>(false);
    final mode =
        useState<BinSelectionState>(const BinSelectionState.packageResults());
    return ScreenWrapper(
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                package.package,
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.lightGreen,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
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
                                style: AppTextStyles.h3,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Arrasta cada componente para o respectivo contentor.',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.paragraph,
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
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Ink(
                          width: 855,
                          height: 600,
                          padding: const EdgeInsets.fromLTRB(100, 50, 200, 50),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(34),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 3),
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: mode.value.when(
                              packageResults: () => [
                                Text(
                                  'Embalagem completa',
                                  style: AppTextStyles.h2,
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 54,
                                      width: 54,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 4,
                                            color: AppColors.lightGreen,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      'Impactes Ambientais',
                                      style: AppTextStyles.h4.copyWith(
                                        color: AppColors.lightGreen,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  style: AppTextStyles.paragraph,
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 54,
                                      width: 54,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 4,
                                            color: AppColors.lightGreen,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      'Impactes Económicos',
                                      style: AppTextStyles.h4.copyWith(
                                        color: AppColors.lightGreen,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: AppTextStyles.paragraph,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  'Clique em cada componente para saber mais.',
                                  style: AppTextStyles.paragraph,
                                ),
                              ],
                              componentResults: (componentId) => [
                                Text(
                                  componentId,
                                  style: AppTextStyles.h2,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  style: AppTextStyles.paragraph,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: AppTextStyles.paragraph,
                                ),
                                const SizedBox(height: 45),
                                Text(
                                  'Recomendações',
                                  style: AppTextStyles.h3.copyWith(
                                    color: AppColors.lightGreen,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
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
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      'Lavar a embalagem',
                                      style: AppTextStyles.paragraph,
                                    ),
                                    const SizedBox(width: 60),
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
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      'Espalmar',
                                      style: AppTextStyles.paragraph,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 15,
                        child: IconButton(
                          onPressed: () => isSelecting.value = true,
                          iconSize: 44,
                          color: AppColors.lightGreen,
                          icon: const Icon(Icons.close_outlined),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 30),
                          BirdIconButton(
                            radius: 40,
                            icon: CustomIcons.getIcon(package.iconId),
                            isSelected: mode.value is PackageResults,
                            onPressed: () => mode.value =
                                const BinSelectionState.packageResults(),
                          ),
                          for (final c in package.components) ...[
                            const SizedBox(height: 20),
                            BirdIconButton(
                              radius: 40,
                              icon: CustomIcons.getIcon(c.iconId),
                              isCorrect: whereComponents.value[c] == c.where,
                              isSelected: mode.value is ComponentResults &&
                                  (mode.value as ComponentResults)
                                          .componentId ==
                                      c.component,
                              onPressed: () => mode.value =
                                  BinSelectionState.componentResults(
                                componentId: c.component,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
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
                                    ifAbsent: () => Where.recolhaPlasticoMetal,
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
            Row(
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
                          style: AppTextStyles.dropdown,
                          children: const [
                            TextSpan(
                              text: 'Mas não vai tudo para o mesmo sítio?\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: 'Não! '),
                            TextSpan(
                              text: 'Saiba mais.',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
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
                            onPressed: () => isSelecting.value = false,
                            child: const Text('VERIFICAR'),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 120),
              ],
            )
          ],
        ),
      ),
    );
  }
}
