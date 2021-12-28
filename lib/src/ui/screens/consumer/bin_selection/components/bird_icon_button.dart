import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/ui/screens/consumer/bin_selection/components/bird_shape.dart';

class BirdIconButton extends StatelessWidget {
  const BirdIconButton({
    Key? key,
    required this.radius,
    this.onPressed,
    required this.svgPath,
    this.isSelected = false,
  }) : super(key: key);

  final double radius;
  final VoidCallback? onPressed;
  final String svgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final radius = isSelected ? this.radius + 4 : this.radius;
    return SizedBox(
      height: radius * 2,
      width: (radius + 12) * 2,
      child: Material(
        color: isSelected ? AppColors.grey5 : AppColors.grey3,
        shape: isSelected ? const BirdBorder() : const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: isSelected ? null : onPressed,
          child: Padding(
            padding: svgPath == 'assets/svgs/lid.svg'
                ? const EdgeInsets.all(30)
                : const EdgeInsets.all(12),
            child: SvgPicture.asset(svgPath),
          ),
        ),
      ),
    );
  }
}
