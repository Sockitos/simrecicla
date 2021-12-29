import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/models/package.dart';

class DraggableComponents extends StatelessWidget {
  const DraggableComponents({
    Key? key,
    required this.package,
    required this.hiddenComponents,
  }) : super(key: key);

  final Package package;
  final List<Component> hiddenComponents;

  @override
  Widget build(BuildContext context) {
    switch (package.components.length) {
      case 1:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 165),
          child: _DraggableComponent(
            component: package.components[0],
            hideComponent: hiddenComponents.contains(package.components[0]),
          ),
        );

      case 2:
        return Column(
          children: [
            const SizedBox(height: 10),
            _DraggableComponent(
              component: package.components[0],
              hideComponent: hiddenComponents.contains(package.components[0]),
            ),
            const SizedBox(height: 20),
            _DraggableComponent(
              component: package.components[1],
              hideComponent: hiddenComponents.contains(package.components[1]),
            ),
            const SizedBox(height: 50),
          ],
        );

      case 3:
        return Row(
          children: [
            Column(
              children: [
                _DraggableComponent(
                  component: package.components[0],
                  hideComponent:
                      hiddenComponents.contains(package.components[0]),
                ),
                const SizedBox(height: 80),
                _DraggableComponent(
                  component: package.components[1],
                  hideComponent:
                      hiddenComponents.contains(package.components[1]),
                ),
              ],
            ),
            const SizedBox(width: 10),
            _DraggableComponent(
              component: package.components[2],
              hideComponent: hiddenComponents.contains(package.components[2]),
            ),
          ],
        );

      default:
        return const SizedBox();
    }
  }
}

class _DraggableComponent extends StatelessWidget {
  const _DraggableComponent({
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
            padding: const EdgeInsets.only(bottom: 60),
            child: hideComponent
                ? SvgPicture.asset(
                    component.svgPath,
                    color: AppColors.black.withOpacity(0.1),
                  )
                : DraggableComponent(component: component),
          ),
          SizedBox(
            width: 200,
            height: 70,
            child: Center(
              child: Text(
                component.component,
                style: AppTextStyles.paragraph,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DraggableComponent extends StatelessWidget {
  const DraggableComponent({
    Key? key,
    required this.component,
    this.isInBin = false,
  }) : super(key: key);

  final Component component;
  final bool isInBin;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: component,
      childWhenDragging: SvgPicture.asset(
        component.svgPath,
        height: isInBin
            ? component.svgPath == 'assets/svgs/lid.svg'
                ? 16
                : 40
            : null,
        color: AppColors.black.withOpacity(0.1),
      ),
      feedback: SvgPicture.asset(component.svgPath),
      child: SvgPicture.asset(
        component.svgPath,
        height: isInBin
            ? component.svgPath == 'assets/svgs/lid.svg'
                ? 16
                : 40
            : null,
      ),
    );
  }
}
