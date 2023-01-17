import 'package:flutter/widgets.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/models/recycler/machine_port.dart';

class OutputIndicator extends StatelessWidget {
  const OutputIndicator({
    super.key,
    required this.output,
    required this.width,
    required this.height,
  });

  final MachineOutput output;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _OutputIndicatorMachine(
        output: output,
        color: AppColors.black,
      ),
    );
  }
}

class _OutputIndicatorMachine extends CustomPainter {
  _OutputIndicatorMachine({
    required this.output,
    required this.color,
  });

  final MachineOutput output;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 2;
    paint.color = color;

    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));

    switch (output.type) {
      case MachineOutputType.one:
        canvas.drawRect(
          rect,
          paint..style = PaintingStyle.fill,
        );
        break;
      case MachineOutputType.two:
        canvas.drawRect(rect, paint);
        canvas.drawLine(rect.bottomLeft, rect.topRight, paint);
        break;
      case MachineOutputType.three:
        canvas.drawRect(rect, paint);
        canvas.drawLine(rect.topCenter, rect.bottomCenter, paint);
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
