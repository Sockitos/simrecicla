import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/component.dart';

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
