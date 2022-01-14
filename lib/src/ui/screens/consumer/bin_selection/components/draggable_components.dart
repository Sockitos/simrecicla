import 'package:flutter/material.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/custom_icons.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/models/package.dart';
import 'package:simtech/src/ui/widgets/my_drag_target.dart';

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
                const SizedBox(height: 40),
                _DraggableComponent(
                  component: package.components[1],
                  hideComponent:
                      hiddenComponents.contains(package.components[1]),
                ),
              ],
            ),
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
    final iconData = CustomIcons.getIcon(component.iconId);
    return SizedBox(
      height: 260,
      width: 260,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.grey3,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 25,
          ),
          child: Column(
            children: [
              if (hideComponent)
                Icon(
                  iconData,
                  color: AppColors.black.withOpacity(0.1),
                  size: 145,
                )
              else
                DraggableComponent(component: component),
              const SizedBox(height: 5),
              Expanded(
                child: Text(
                  component.name,
                  style: AppTextStyles.paragraph,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
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
    final iconData = CustomIcons.getIcon(component.iconId);
    return SizedBox(
      height: isInBin ? 45 : 145,
      width: isInBin ? 45 : 145,
      child: OverflowBox(
        maxHeight: 145,
        minHeight: 145,
        maxWidth: 145,
        minWidth: 145,
        child: MyDraggable(
          data: component,
          childWhenDragging: SizedBox(
            height: isInBin ? 45 : 145,
            width: isInBin ? 45 : 145,
            child: Icon(
              iconData,
              color: AppColors.black.withOpacity(0.1),
              size: isInBin ? 45 : 145,
            ),
          ),
          feedback: SizedBox(
            height: 145,
            width: 145,
            child: Icon(
              iconData,
              size: 90,
            ),
          ),
          child: Icon(
            iconData,
            size: isInBin ? 45 : 145,
          ),
        ),
      ),
    );
  }
}
