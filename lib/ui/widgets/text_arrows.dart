import 'package:flutter/material.dart';

class TextArrows extends StatelessWidget {
  const TextArrows({
    super.key,
    required this.label,
    this.labelStyle,
    required this.color,
    this.strokeWidth = 2,
    this.heightFactor = 0.5,
    this.widthFactor = 0.5,
  });

  final String label;
  final TextStyle? labelStyle;
  final Color color;
  final double strokeWidth;
  final double heightFactor;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: _TextArrowsPainter(
          label: label,
          labelStyle: labelStyle,
          color: color,
          strokeWidth: strokeWidth,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
        ),
      ),
    );
  }
}

class _TextArrowsPainter extends CustomPainter {
  _TextArrowsPainter({
    required this.label,
    this.labelStyle,
    required this.color,
    this.strokeWidth = 3,
    this.heightFactor = 0.5,
    this.widthFactor = 0.5,
  });
  final String label;
  final TextStyle? labelStyle;
  final Color color;
  final double strokeWidth;
  final double heightFactor;
  final double widthFactor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();
    paint.style = PaintingStyle.stroke;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = strokeWidth;
    paint.color = color;

    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: labelStyle,
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();

    final offset = Offset(
      size.width * widthFactor - textPainter.width / 2,
      size.height * heightFactor - textPainter.height / 2,
    );
    textPainter.paint(canvas, offset);

    path.moveTo(
      size.width * widthFactor - textPainter.width / 2 - 20,
      size.height * heightFactor,
    );
    path.lineTo(0 + 40, size.height * heightFactor);
    path.quadraticBezierTo(
      0,
      size.height * heightFactor,
      0,
      size.height * heightFactor + 40,
    );
    path.lineTo(0, size.height);

    path.moveTo(0, size.height);
    path.lineTo(-14, size.height - 14);
    path.moveTo(0, size.height);
    path.lineTo(14, size.height - 14);

    path.moveTo(
      size.width * widthFactor + textPainter.width / 2 + 20,
      size.height * heightFactor,
    );
    path.lineTo(size.width - 40, size.height * heightFactor);
    path.quadraticBezierTo(
      size.width,
      size.height * heightFactor,
      size.width,
      size.height * heightFactor - 40,
    );
    path.lineTo(size.width, 0);

    path.moveTo(
      size.width * widthFactor + textPainter.width / 2 + 20,
      size.height * heightFactor,
    );
    path.lineTo(
      size.width * widthFactor + textPainter.width / 2 + 20 + 14,
      size.height * heightFactor + 14,
    );
    path.moveTo(
      size.width * widthFactor + textPainter.width / 2 + 20,
      size.height * heightFactor,
    );
    path.lineTo(
      size.width * widthFactor + textPainter.width / 2 + 20 + 14,
      size.height * heightFactor - 14,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
