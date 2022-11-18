import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/gen/assets.gen.dart';

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
                isCorrect! ? Assets.svgs.right.path : Assets.svgs.wrong.path,
                height: 34,
                width: 34,
              ),
            ),
        ],
      ),
    );
  }
}

class BirdBorder extends OutlinedBorder {
  const BirdBorder({super.side});

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(side.width);
  }

  @override
  ShapeBorder scale(double t) => BirdBorder(side: side.scale(t));

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is BirdBorder) {
      return BirdBorder(side: BorderSide.lerp(a.side, side, t));
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is BirdBorder) {
      return BirdBorder(side: BorderSide.lerp(side, b.side, t));
    }
    return super.lerpTo(b, t);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final circlePath = Path()
      ..addOval(
        Rect.fromCircle(
          center: rect.center,
          radius: rect.longestSide / 2.0 - 12,
        ),
      );
    final trianglePath = Path()
      ..moveTo(rect.longestSide - 13, rect.shortestSide / 2 - 10)
      ..lineTo(rect.longestSide, rect.shortestSide / 2)
      ..lineTo(rect.longestSide - 13, rect.shortestSide / 2 + 10)
      ..close();
    return Path.combine(PathOperation.union, circlePath, trianglePath);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final circlePath = Path()
      ..addOval(
        Rect.fromCircle(
          center: rect.center,
          radius: rect.longestSide / 2.0 - 12,
        ),
      );
    final trianglePath = Path()
      ..moveTo(rect.longestSide - 13, rect.shortestSide / 2 - 10)
      ..lineTo(rect.longestSide, rect.shortestSide / 2)
      ..lineTo(rect.longestSide - 13, rect.shortestSide / 2 + 10)
      ..close();
    return Path.combine(PathOperation.union, circlePath, trianglePath);
  }

  @override
  BirdBorder copyWith({BorderSide? side}) {
    return BirdBorder(side: side ?? this.side);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is BirdBorder && other.side == side;
  }

  @override
  int get hashCode => side.hashCode;
}
