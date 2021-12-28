import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/package.dart';
import 'package:simtech/src/services/consumer_service.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/bin_target.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/bird_icon_button.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/draggable_component.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/state/bin_selection_state.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class BinSelectionScreen extends HookWidget {
  const BinSelectionScreen({
    Key? key,
    required this.package,
  }) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) {
    final package = ConsumerService.getTestPackage();
    final wherePackages = useState<Map<Where, List<Component>>>({});
    final isSelecting = useState<bool>(true);
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
            const SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSelecting.value) ...[
                  SizedBox(
                    width: 410,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            DraggableComponent(
                              component: package.components[0],
                              hideComponent: wherePackages.value.values
                                  .fold<List<Component>>(
                                [],
                                (previousValue, element) =>
                                    [...previousValue, ...element],
                              ).contains(
                                package.components[0],
                              ),
                            ),
                            const SizedBox(height: 80),
                            DraggableComponent(
                              component: package.components[1],
                              hideComponent: wherePackages.value.values
                                  .fold<List<Component>>(
                                [],
                                (previousValue, element) =>
                                    [...previousValue, ...element],
                              ).contains(
                                package.components[1],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        DraggableComponent(
                          component: package.components[2],
                          hideComponent:
                              wherePackages.value.values.fold<List<Component>>(
                            [],
                            (previousValue, element) =>
                                [...previousValue, ...element],
                          ).contains(
                            package.components[2],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 180),
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
                    clipBehavior: Clip.none,
                    children: [
                      Ink(
                        width: 800,
                        height: 580,
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
                                    'Impactos Ambientais',
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
                                    'Impactos Económicos',
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
                      Positioned(
                        left: -55,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            BirdIconButton(
                              radius: 40,
                              svgPath: package.svgPath,
                              isSelected: mode.value is PackageResults,
                              onPressed: () => mode.value =
                                  const BinSelectionState.packageResults(),
                            ),
                            for (final c in package.components) ...[
                              const SizedBox(height: 30),
                              BirdIconButton(
                                radius: 40,
                                svgPath: c.svgPath,
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
                      ),
                    ],
                  ),
                const SizedBox(width: 180),
                SizedBox(
                  height: 550,
                  width: 550,
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
                          svgPath: 'assets/svgs/eco_yellow.svg',
                          components:
                              wherePackages.value[Where.recolhaPlasticoMetal],
                          onAccept: (data) {
                            wherePackages.value = {...wherePackages.value}
                              ..update(
                                Where.recolhaPlasticoMetal,
                                (value) => [...value, data],
                                ifAbsent: () => [data],
                              );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: BinTarget(
                          label: 'Ecoponto Azul',
                          svgPath: 'assets/svgs/eco_blue.svg',
                          components:
                              wherePackages.value[Where.recolhaPapelCartao],
                          onAccept: (data) {
                            wherePackages.value = {...wherePackages.value}
                              ..update(
                                Where.recolhaPapelCartao,
                                (value) => [...value, data],
                                ifAbsent: () => [data],
                              );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: BinTarget(
                          label: 'Ecoponto Verde',
                          svgPath: 'assets/svgs/eco_green.svg',
                          components: wherePackages.value[Where.recolhaVidro],
                          onAccept: (data) {
                            wherePackages.value = {...wherePackages.value}
                              ..update(
                                Where.recolhaVidro,
                                (value) => [...value, data],
                                ifAbsent: () => [data],
                              );
                          },
                        ),
                      ),
                      Positioned.fill(
                        bottom: -40,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: BinTarget(
                            label: 'Contentor Indiferenciado',
                            svgPath: 'assets/svgs/trash.svg',
                            components: wherePackages
                                .value[Where.recolhaIndiferenciada],
                            onAccept: (data) {
                              wherePackages.value = {...wherePackages.value}
                                ..update(
                                  Where.recolhaIndiferenciada,
                                  (value) => [...value, data],
                                  ifAbsent: () => [data],
                                );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 100),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 410),
                const SizedBox(width: 180),
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
                            child: const Text('AVANÇAR'),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 100),
              ],
            )
          ],
        ),
      ),
    );
  }
}
