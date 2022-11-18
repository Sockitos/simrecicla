import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/consumer/component.dart';

class DraggableComponents extends StatelessWidget {
  const DraggableComponents({
    super.key,
    required this.components,
    required this.isDisabled,
  });

  final List<Component> components;
  final bool Function(Component c) isDisabled;

  @override
  Widget build(BuildContext context) {
    switch (components.length) {
      case 1:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 165),
          child: _DraggableComponent(
            component: components[0],
            isDisabled: isDisabled(components[0]),
          ),
        );

      case 2:
        return Column(
          children: [
            const SizedBox(height: 10),
            _DraggableComponent(
              component: components[0],
              isDisabled: isDisabled(components[0]),
            ),
            const SizedBox(height: 20),
            _DraggableComponent(
              component: components[1],
              isDisabled: isDisabled(components[1]),
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
                  component: components[0],
                  isDisabled: isDisabled(components[0]),
                ),
                const SizedBox(height: 40),
                _DraggableComponent(
                  component: components[1],
                  isDisabled: isDisabled(components[1]),
                ),
              ],
            ),
            _DraggableComponent(
              component: components[2],
              isDisabled: isDisabled(components[2]),
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
    required this.component,
    this.isDisabled = false,
  });

  final Component component;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final iconData = component.icon;
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
              if (isDisabled)
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
                  style: AppTextStyles.bodyL(context.layout),
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
    super.key,
    required this.component,
    this.isInBin = false,
  });

  final Component component;
  final bool isInBin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isInBin ? 45 : 145,
      width: isInBin ? 45 : 145,
      child: OverflowBox(
        maxHeight: 145,
        minHeight: 145,
        maxWidth: 145,
        minWidth: 145,
        child: Draggable(
          ignoringFeedbackPointer: false,
          data: component,
          childWhenDragging: SizedBox(
            height: isInBin ? 45 : 145,
            width: isInBin ? 45 : 145,
            child: Icon(
              component.icon,
              color: AppColors.black.withOpacity(0.1),
              size: isInBin ? 45 : 145,
            ),
          ),
          feedback: MouseRegion(
            cursor: SystemMouseCursors.grabbing,
            opaque: false,
            child: SizedBox(
              height: 145,
              width: 145,
              child: Icon(
                component.icon,
                size: 90,
              ),
            ),
          ),
          child: MouseRegion(
            cursor: SystemMouseCursors.grab,
            child: Icon(
              component.icon,
              size: isInBin ? 45 : 145,
            ),
          ),
        ),
      ),
    );
  }
}
