import 'package:flutter/material.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/ui/screens/consumer/components/bird_shape.dart';

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
    return SizedBox(
      height: radius * 2,
      width: (radius + 12) * 2,
      child: Material(
        color: AppColors.grey3,
        shape: const BirdBorder(),
        child: InkWell(
          customBorder: const BirdBorder(),
          onTap: onPressed,
        ),
      ),
    );
  }
}
