import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/models/consumer/component.dart';

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
    Widget child;
    switch (components.length) {
      case 1:
        child = Center(
          child: _DraggableComponent(
            component: components[0],
            isDisabled: isDisabled(components[0]),
          ),
        );
        break;
      case 2:
        child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DraggableComponent(
              component: components[0],
              isDisabled: isDisabled(components[0]),
            ),
            const Spacer(),
            _DraggableComponent(
              component: components[1],
              isDisabled: isDisabled(components[1]),
            ),
          ],
        );
        break;
      case 3:
        child = Row(
          children: [
            Column(
              children: [
                _DraggableComponent(
                  component: components[0],
                  isDisabled: isDisabled(components[0]),
                ),
                const Spacer(),
                _DraggableComponent(
                  component: components[1],
                  isDisabled: isDisabled(components[1]),
                ),
              ],
            ),
            const Spacer(),
            _DraggableComponent(
              component: components[2],
              isDisabled: isDisabled(components[2]),
            ),
          ],
        );
        break;
      default:
        return const SizedBox();
    }
    return AspectRatio(
      aspectRatio: 0.95,
      child: child,
    );
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
    final size = context.layout.value<double>(xs: 100, sm: 160, lg: 260);
    final iconSize = context.layout.value<double>(
      xs: 60,
      sm: 90,
      md: 55,
      lg: 145,
    );
    return SizedBox(
      height: size,
      width: size,
      child: DecoratedBox(
        decoration: context.layout.value(
          xs: const BoxDecoration(),
          md: const BoxDecoration(
            color: AppColors.grey3,
            shape: BoxShape.circle,
          ),
        ),
        child: Padding(
          padding: context.layout.value(
            xs: EdgeInsets.zero,
            md: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
          ),
          child: Column(
            children: [
              if (isDisabled)
                Icon(
                  component.icon,
                  color: AppColors.black.withOpacity(0.1),
                  size: iconSize,
                )
              else
                DraggableComponent(component: component),
              const SizedBox(height: 5),
              Expanded(
                child: Text(
                  component.name,
                  style: context.layout.value(
                    xs: AppTextStyles.bodyS(context.layout),
                    sm: AppTextStyles.bodyM(context.layout),
                    lg: AppTextStyles.bodyL(context.layout),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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

class DraggableComponentWithName extends StatelessWidget {
  const DraggableComponentWithName({
    super.key,
    required this.component,
    this.isDisabled = false,
  });

  final Component component;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final width = context.layout.value<double>(xs: 110, sm: 130);
    final iconSize = context.layout.value<double>(
      xs: 60,
      sm: 90,
      md: 55,
      lg: 145,
    );
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isDisabled)
            Icon(
              component.icon,
              color: AppColors.black.withOpacity(0.1),
              size: iconSize,
            )
          else
            DraggableComponent(component: component),
          const SizedBox(height: 5),
          Text(
            component.name,
            style: context.layout.value(
              xs: AppTextStyles.bodyS(context.layout),
              sm: AppTextStyles.bodyM(context.layout),
              lg: AppTextStyles.bodyL(context.layout),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
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
    final size = context.layout.value<double>(
      xs: 60,
      sm: 90,
      md: 55,
      lg: 145,
    );
    final draggingSize = context.layout.value<double>(
      xs: 45,
      sm: 70,
      md: 45,
      lg: 90,
    );
    final inBinSize = context.layout.value<double>(
      xs: 30,
      sm: 45,
      md: 35,
      lg: 45,
    );
    return SizedBox(
      height: isInBin ? inBinSize : size,
      width: isInBin ? inBinSize : size,
      child: OverflowBox(
        maxHeight: size,
        minHeight: size,
        maxWidth: size,
        minWidth: size,
        child: Draggable(
          ignoringFeedbackPointer: false,
          data: component,
          childWhenDragging: SizedBox(
            height: isInBin ? inBinSize : size,
            width: isInBin ? inBinSize : size,
            child: Icon(
              component.icon,
              color: AppColors.black.withOpacity(0.1),
              size: isInBin ? inBinSize : size,
            ),
          ),
          feedback: MouseRegion(
            cursor: SystemMouseCursors.grabbing,
            opaque: false,
            child: SizedBox(
              height: size,
              width: size,
              child: Icon(
                component.icon,
                size: draggingSize,
              ),
            ),
          ),
          child: MouseRegion(
            cursor: SystemMouseCursors.grab,
            child: Icon(
              component.icon,
              size: isInBin ? inBinSize : size,
            ),
          ),
        ),
      ),
    );
  }
}
