import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/draggable_components.dart';

class BinTarget extends StatelessWidget {
  const BinTarget({
    Key? key,
    required this.label,
    required this.svgPath,
    this.components,
    this.onAccept,
  }) : super(key: key);

  final String label;
  final String svgPath;
  final List<Component>? components;
  final DragTargetAccept<Component>? onAccept;

  @override
  Widget build(BuildContext context) {
    final numComponents = components?.length ?? 0;
    final labels = label.split(' ');
    return DragTarget<Component>(
      onWillAccept: (_) => true,
      onAccept: onAccept,
      builder: (context, _, __) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                svgPath,
                height: 150,
              ),
              if (numComponents >= 1)
                Positioned(
                  bottom: label != 'Contentor Indiferenciado' ? 15 : 30,
                  right: 50,
                  left: 0,
                  child: DraggableComponent(
                    component: components![0],
                    isInBin: true,
                  ),
                ),
              if (numComponents >= 2)
                Positioned(
                  bottom: label != 'Contentor Indiferenciado' ? 15 : 30,
                  right: 0,
                  left: 50,
                  child: DraggableComponent(
                    component: components![1],
                    isInBin: true,
                  ),
                ),
              if (numComponents >= 3)
                Positioned(
                  bottom: label != 'Contentor Indiferenciado' ? 55 : 70,
                  right: 0,
                  left: 0,
                  child: DraggableComponent(
                    component: components![2],
                    isInBin: true,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            labels.first,
            style: AppTextStyles.h3,
          ),
          Text(
            labels.last,
            style: AppTextStyles.h3,
          ),
        ],
      ),
    );
  }
}
