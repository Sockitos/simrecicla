import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/package.dart';
import 'package:simtech/src/ui/screens/consumer/components/bin_target.dart';
import 'package:simtech/src/ui/screens/consumer/components/bird_icon_button.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

enum ResultsMode {
  package,
  component,
}

class BinSelectionScreen extends HookWidget {
  const BinSelectionScreen({
    Key? key,
    required this.package,
  }) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) {
    final wherePackages = useState<Map<Where, List<Component>>>({});
    final isSelecting = useState<bool>(true);
    final mode = useState<ResultsMode>(ResultsMode.component);
    return ScreenWrapper(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelecting.value) ...[
              SizedBox(
                width: 530,
                child: Row(
                  children: [
                    Column(
                      children: [
                        DraggableComponent(
                          component: package.components[0],
                          hideComponent:
                              wherePackages.value.values.fold<List<Component>>(
                            [],
                            (previousValue, element) =>
                                [...previousValue, ...element],
                          ).contains(
                            package.components[0],
                          ),
                        ),
                        const SizedBox(height: 100),
                        DraggableComponent(
                          component: package.components[1],
                          hideComponent:
                              wherePackages.value.values.fold<List<Component>>(
                            [],
                            (previousValue, element) =>
                                [...previousValue, ...element],
                          ).contains(
                            package.components[1],
                          ),
                        ),
                      ],
                    ),
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
              const SizedBox(width: 100),
              SizedBox(
                width: 210,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Qual o contentor correto?',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.h3,
                          ),
                          Text(
                            'Arrasta a embalagem',
                            style: AppTextStyles.paragraph,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SvgPicture.asset('assets/svgs/big_arrow.svg'),
                    const SizedBox(height: 30),
                    const SizedBox(height: 130),
                  ],
                ),
              ),
            ] else
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Ink(
                      width: 800,
                      height: 600,
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 50, 200, 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: mode.value == ResultsMode.package
                              ? [
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
                                ]
                              : [
                                  Text(
                                    'Corpo da Garrafa',
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
                                    style: AppTextStyles.h3
                                        .copyWith(color: AppColors.lightGreen),
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
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      BirdIconButton(
                        radius: 40,
                        svgPath: package.svgPath,
                        isSelected: mode.value == ResultsMode.package,
                        onPressed: () => mode.value = ResultsMode.package,
                      ),
                      for (final c in package.components) ...[
                        const SizedBox(height: 30),
                        BirdIconButton(
                          radius: 40,
                          svgPath: c.svgPath,
                          isSelected: mode.value == ResultsMode.component,
                          onPressed: () => mode.value = ResultsMode.component,
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            const SizedBox(width: 100),
            SizedBox(
              height: 620,
              width: 620,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Center(
                    child: SizedBox(
                      height: 480,
                      width: 480,
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
                        wherePackages.value = {...wherePackages.value}..update(
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
                      components: wherePackages.value[Where.recolhaPapelCartao],
                      onAccept: (data) {
                        wherePackages.value = {...wherePackages.value}..update(
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
                        wherePackages.value = {...wherePackages.value}..update(
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
                        components:
                            wherePackages.value[Where.recolhaIndiferenciada],
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
                  Center(
                    child: ElevatedButton(
                      onPressed: () => isSelecting.value = !isSelecting.value,
                      child: const Text('TESTE'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableComponent extends StatelessWidget {
  const DraggableComponent({
    Key? key,
    required this.component,
    this.hideComponent = false,
  }) : super(key: key);

  final Component component;
  final bool hideComponent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 120,
            width: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.grey3,
                borderRadius: BorderRadius.circular(34),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 54),
            child: hideComponent
                ? SvgPicture.asset(
                    component.svgPath,
                    color: AppColors.black.withOpacity(0.1),
                  )
                : Draggable(
                    data: component,
                    childWhenDragging: SvgPicture.asset(
                      component.svgPath,
                      color: AppColors.black.withOpacity(0.1),
                    ),
                    feedback: SvgPicture.asset(component.svgPath),
                    child: SvgPicture.asset(component.svgPath),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              component.component,
              style: AppTextStyles.paragraph,
            ),
          ),
        ],
      ),
    );
  }
}
