import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BirdBorder extends OutlinedBorder {
  /// Create a circle border.
  ///
  /// The [side] argument must not be null.
  const BirdBorder({BorderSide side = BorderSide.none}) : super(side: side);

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

  @override
  String toString() {
    return '${objectRuntimeType(this, 'BirdBorder')}($side)';
  }
}
