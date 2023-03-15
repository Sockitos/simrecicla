import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/gen/assets.gen.dart';

class BirdIconButton extends StatelessWidget {
  const BirdIconButton({
    super.key,
    required this.radius,
    this.onPressed,
    required this.icon,
    this.isCorrect,
    this.isSelected = false,
    this.aimDown = false,
  });

  final double radius;
  final VoidCallback? onPressed;
  final IconData icon;
  final bool? isCorrect;
  final bool isSelected;
  final bool aimDown;

  @override
  Widget build(BuildContext context) {
    final outerRadius = this.radius + (this.radius * 1 / 10);
    final radius = isSelected ? outerRadius : this.radius;
    final triangleDimension = radius * 3 / 10;
    final iconSize = radius * 1.38;
    final checkRadius = outerRadius / 2.8;

    return SizedBox(
      height: aimDown ? (outerRadius + triangleDimension) * 2 : outerRadius * 2,
      width: aimDown ? outerRadius * 2 : (outerRadius + triangleDimension) * 2,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Center(
            child: SizedBox(
              height: aimDown ? (radius + triangleDimension) * 2 : radius * 2,
              width: aimDown ? radius * 2 : (radius + triangleDimension) * 2,
              child: Material(
                color: isSelected ? AppColors.grey5 : AppColors.grey3,
                shape: isSelected ? const BirdBorder() : const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: isSelected ? null : onPressed,
                  child: Center(
                    child: Icon(icon, size: iconSize),
                  ),
                ),
              ),
            ),
          ),
          if (isCorrect != null)
            Positioned(
              top: aimDown ? 4 : null,
              right: aimDown ? 0 : null,
              bottom: aimDown ? null : 2,
              left: aimDown ? null : 2,
              child: SvgPicture.asset(
                isCorrect! ? Assets.svgs.right.path : Assets.svgs.wrong.path,
                height: checkRadius * 2,
                width: checkRadius * 2,
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
    final triangleDimension = (rect.longestSide - rect.shortestSide) / 2;
    final circlePath = Path()
      ..addOval(
        Rect.fromCircle(
          center: rect.center,
          radius: rect.longestSide / 2.0 - triangleDimension,
        ),
      );

    final Path trianglePath;
    if (rect.size.height > rect.size.width) {
      trianglePath = Path()
        ..moveTo(
          rect.shortestSide / 2 - (triangleDimension * 5 / 6),
          rect.longestSide - triangleDimension - 1,
        )
        ..lineTo(rect.shortestSide / 2, rect.longestSide)
        ..lineTo(
          rect.shortestSide / 2 + (triangleDimension * 5 / 6),
          rect.longestSide - triangleDimension - 1,
        )
        ..close();
    } else {
      trianglePath = Path()
        ..moveTo(
          rect.longestSide - triangleDimension - 1,
          rect.shortestSide / 2 - (triangleDimension * 5 / 6),
        )
        ..lineTo(rect.longestSide, rect.shortestSide / 2)
        ..lineTo(
          rect.longestSide - triangleDimension - 1,
          rect.shortestSide / 2 + (triangleDimension * 5 / 6),
        )
        ..close();
    }

    return Path.combine(PathOperation.union, circlePath, trianglePath);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final triangleDimension = (rect.longestSide - rect.shortestSide) / 2;
    final circlePath = Path()
      ..addOval(
        Rect.fromCircle(
          center: rect.center,
          radius: rect.longestSide / 2.0 - triangleDimension,
        ),
      );

    final Path trianglePath;
    if (rect.size.height > rect.size.width) {
      trianglePath = Path()
        ..moveTo(
          rect.shortestSide / 2 - (triangleDimension * 5 / 6),
          rect.longestSide - triangleDimension - 1,
        )
        ..lineTo(rect.shortestSide / 2, rect.longestSide)
        ..lineTo(
          rect.shortestSide / 2 + (triangleDimension * 5 / 6),
          rect.longestSide - triangleDimension - 1,
        )
        ..close();
    } else {
      trianglePath = Path()
        ..moveTo(
          rect.longestSide - triangleDimension - 1,
          rect.shortestSide / 2 - (triangleDimension * 5 / 6),
        )
        ..lineTo(rect.longestSide, rect.shortestSide / 2)
        ..lineTo(
          rect.longestSide - triangleDimension - 1,
          rect.shortestSide / 2 + (triangleDimension * 5 / 6),
        )
        ..close();
    }
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
