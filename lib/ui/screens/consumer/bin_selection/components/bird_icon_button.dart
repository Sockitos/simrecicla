import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/components/bird_shape.dart';

class BirdIconButton extends StatelessWidget {
  const BirdIconButton({
    super.key,
    required this.radius,
    this.onPressed,
    required this.icon,
    this.isCorrect,
    this.isSelected = false,
  });

  final double radius;
  final VoidCallback? onPressed;
  final IconData icon;
  final bool? isCorrect;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final radius = isSelected ? this.radius + 4 : this.radius;
    return SizedBox(
      height: (this.radius + 4) * 2,
      width: (this.radius + 4 + 12) * 2,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Center(
            child: SizedBox(
              height: radius * 2,
              width: (radius + 12) * 2,
              child: Material(
                color: isSelected ? AppColors.grey5 : AppColors.grey3,
                shape: isSelected ? const BirdBorder() : const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: isSelected ? null : onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Icon(icon, size: isSelected ? 58 : 50),
                  ),
                ),
              ),
            ),
          ),
          if (isCorrect != null)
            Positioned(
              bottom: 2,
              left: 2,
              child: SvgPicture.asset(
                isCorrect! ? 'assets/svgs/right.svg' : 'assets/svgs/wrong.svg',
                height: 34,
                width: 34,
              ),
            ),
        ],
      ),
    );
  }
}
