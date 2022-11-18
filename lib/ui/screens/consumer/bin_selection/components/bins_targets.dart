import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/gen/assets.gen.dart';
import 'package:simtech/models/consumer/component.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/draggable_components.dart';

typedef OnAcceptComponent = void Function(
  Component component, {
  required Where where,
});

class BinsTargets extends HookWidget {
  const BinsTargets({
    super.key,
    this.whereComponents = const {},
    this.onAcceptComponent,
  });

  final Map<Component, Where> whereComponents;
  final OnAcceptComponent? onAcceptComponent;

  @override
  Widget build(BuildContext context) {
    final isBinning = useState(false);
    return MouseRegion(
      onEnter: (_) => isBinning.value = true,
      onExit: (_) => isBinning.value = false,
      child: SizedBox(
        height: 640,
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
              child: _BinTarget(
                label: 'Ecoponto Amarelo',
                svgPath: Assets.svgs.yellowBin.path,
                components: whereComponents.keys
                    .where(
                      (k) => whereComponents[k] == Where.recolhaPlasticoMetal,
                    )
                    .toList(),
                onAccept: (component) => onAcceptComponent?.call(
                  component,
                  where: Where.recolhaPlasticoMetal,
                ),
                forceHighlighted: !isBinning.value,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: _BinTarget(
                label: 'Ecoponto Azul',
                svgPath: Assets.svgs.blueBin.path,
                components: whereComponents.keys
                    .where(
                      (k) => whereComponents[k] == Where.recolhaPapelCartao,
                    )
                    .toList(),
                onAccept: (component) => onAcceptComponent?.call(
                  component,
                  where: Where.recolhaPapelCartao,
                ),
                forceHighlighted: !isBinning.value,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _BinTarget(
                label: 'Ecoponto Verde',
                svgPath: Assets.svgs.greenBin.path,
                components: whereComponents.keys
                    .where(
                      (k) => whereComponents[k] == Where.recolhaVidro,
                    )
                    .toList(),
                onAccept: (component) => onAcceptComponent?.call(
                  component,
                  where: Where.recolhaVidro,
                ),
                forceHighlighted: !isBinning.value,
              ),
            ),
            Positioned.fill(
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _BinTarget(
                  label: 'Contentor Indiferenciado',
                  svgPath: Assets.svgs.greyBin.path,
                  components: whereComponents.keys
                      .where(
                        (k) =>
                            whereComponents[k] == Where.recolhaIndiferenciada,
                      )
                      .toList(),
                  onAccept: (component) => onAcceptComponent?.call(
                    component,
                    where: Where.recolhaIndiferenciada,
                  ),
                  forceHighlighted: !isBinning.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BinTarget extends HookWidget {
  const _BinTarget({
    required this.label,
    required this.svgPath,
    this.components = const [],
    this.onAccept,
    this.forceHighlighted = false,
  });

  final String label;
  final String svgPath;
  final List<Component> components;
  final ValueChanged<Component>? onAccept;
  final bool forceHighlighted;

  @override
  Widget build(BuildContext context) {
    final highlight = useState<bool>(false);
    final labels = label.split(' ');
    return DragTarget<Component>(
      onWillAccept: (_) => true,
      onAccept: onAccept,
      builder: (context, objects, __) {
        return MouseRegion(
          onEnter: (_) => highlight.value = true,
          onExit: (_) => highlight.value = false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final c in components)
                      DraggableComponent(
                        component: c,
                        isInBin: true,
                      ),
                  ],
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: forceHighlighted || highlight.value ? 1.0 : 0.4,
                child: DefaultTextStyle(
                  style: AppTextStyles.h3(context.layout),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      SvgPicture.asset(
                        svgPath,
                        height: 170,
                      ),
                      const SizedBox(height: 10),
                      Text(labels.first),
                      Text(labels.last),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
