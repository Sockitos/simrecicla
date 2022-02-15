import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/draggable_components.dart';
import 'package:simtech/src/ui/widgets/my_drag_target.dart';

class BinTarget extends HookWidget {
  const BinTarget({
    Key? key,
    required this.label,
    required this.svgPath,
    this.components,
    this.onAccept,
    this.forceHighlighted = false,
  }) : super(key: key);

  final String label;
  final String svgPath;
  final List<Component>? components;
  final ValueChanged<Component>? onAccept;
  final bool forceHighlighted;

  @override
  Widget build(BuildContext context) {
    final highlight = useState<bool>(false);
    final labels = label.split(' ');
    return MyDragTarget<Component>(
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
                    for (final c in components ?? <Component>[])
                      DraggableComponent(
                        component: c,
                        isInBin: true,
                      ),
                  ],
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: forceHighlighted
                    ? 1.0
                    : highlight.value
                        ? 1.0
                        : 0.4,
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
