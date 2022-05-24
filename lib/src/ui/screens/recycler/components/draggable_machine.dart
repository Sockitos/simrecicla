import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simtech/src/models/machine.dart';
import 'package:simtech/src/models/machine_port.dart';
import 'package:simtech/src/ui/widgets/my_drag_target.dart';

class DraggableMachine extends StatelessWidget {
  const DraggableMachine({
    super.key,
    required this.machine,
    required this.size,
    required this.portSize,
    this.draggingSize,
    this.draggingPortSize,
    this.isInGrid = false,
  });

  final Machine machine;
  final Size size;
  final Size portSize;
  final Size? draggingSize;
  final Size? draggingPortSize;
  final bool isInGrid;

  @override
  Widget build(BuildContext context) {
    final maxSize = draggingSize == null
        ? size
        : Size(
            max(size.width, draggingSize!.width),
            max(size.height, draggingSize!.height),
          );
    return SizedBox(
      height: size.height,
      width: size.width,
      child: OverflowBox(
        minWidth: maxSize.width,
        minHeight: maxSize.height,
        maxWidth: maxSize.width,
        maxHeight: maxSize.height,
        child: MyDraggable<Machine>(
          data: machine,
          maxSimultaneousDrags: machine.isFixed ? 0 : 1,
          feedback: Center(
            child: SizedBox(
              height: (draggingSize ?? size).height,
              width: (draggingSize ?? size).width,
              child: CustomPaint(
                painter: _MachinePainter(
                  icon: machine.icon,
                  portSize: draggingPortSize ?? portSize,
                  top: machine.topPort,
                  left: machine.leftPort,
                  bottom: machine.bottomPort,
                  right: machine.rightPort,
                ),
              ),
            ),
          ),
          childWhenDragging: isInGrid
              ? const SizedBox()
              : Center(
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: CustomPaint(
                      painter: _MachinePainter(
                        icon: machine.icon,
                        portSize: portSize,
                        top: machine.topPort,
                        left: machine.leftPort,
                        bottom: machine.bottomPort,
                        right: machine.rightPort,
                      ),
                    ),
                  ),
                ),
          child: Center(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: CustomPaint(
                painter: _MachinePainter(
                  icon: machine.icon,
                  portSize: portSize,
                  top: machine.topPort,
                  left: machine.leftPort,
                  bottom: machine.bottomPort,
                  right: machine.rightPort,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MachinePainter extends CustomPainter {
  _MachinePainter({
    required this.icon,
    required this.portSize,
    this.top,
    this.left,
    this.bottom,
    this.right,
  });

  final IconData icon;
  final Size portSize;
  final MachinePort? top;
  final MachinePort? left;
  final MachinePort? bottom;
  final MachinePort? right;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 2;
    paint.color = Colors.black;

    final outputPaint = Paint();
    outputPaint.style = PaintingStyle.fill;
    outputPaint.color = Colors.black;

    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontFamily: icon.fontFamily,
          color: Colors.black,
          fontSize: min(size.height, size.width) - portSize.height - 15,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();

    final offset = Offset(
      size.width / 2 - textPainter.width / 2,
      size.height / 2 - textPainter.height / 2,
    );
    textPainter.paint(canvas, offset);

    path.moveTo(0, 0);
    if (top is MachineInput) {
      path.lineTo(size.width / 2 - portSize.width / 2, 0);
      path.lineTo(size.width / 2 - portSize.width / 2, 0 + portSize.height);
      path.lineTo(size.width / 2 + portSize.width / 2, 0 + portSize.height);
      path.lineTo(size.width / 2 + portSize.width / 2, 0);
    } else if (top is MachineOutput) {
      canvas.drawRect(
        Rect.fromPoints(
          Offset(size.width / 2 - portSize.width / 2, 0),
          Offset(
            size.width / 2 + portSize.width / 2,
            0 - portSize.height,
          ),
        ),
        outputPaint,
      );
    }
    path.lineTo(size.width, 0);

    if (right is MachineInput) {
      path.lineTo(size.width, size.height / 2 - portSize.width / 2);
      path.lineTo(
        size.width - portSize.height,
        size.height / 2 - portSize.width / 2,
      );
      path.lineTo(
        size.width - portSize.height,
        size.height / 2 + portSize.width / 2,
      );
      path.lineTo(size.width, size.height / 2 + portSize.width / 2);
    } else if (right is MachineOutput) {
      canvas.drawRect(
        Rect.fromPoints(
          Offset(size.width, size.height / 2 - portSize.width / 2),
          Offset(
            size.width + portSize.height,
            size.height / 2 + portSize.width / 2,
          ),
        ),
        outputPaint,
      );
    }
    path.lineTo(size.width, size.height);

    if (bottom is MachineInput) {
      path.lineTo(size.width / 2 + portSize.width / 2, size.height);
      path.lineTo(
        size.width / 2 + portSize.width / 2,
        size.height - portSize.height,
      );
      path.lineTo(
        size.width / 2 - portSize.width / 2,
        size.height - portSize.height,
      );
      path.lineTo(size.width / 2 - portSize.width / 2, size.height);
    } else if (bottom is MachineOutput) {
      canvas.drawRect(
        Rect.fromPoints(
          Offset(size.width / 2 + portSize.width / 2, size.height),
          Offset(
            size.width / 2 - portSize.width / 2,
            size.height + portSize.height,
          ),
        ),
        outputPaint,
      );
    }
    path.lineTo(0, size.height);

    if (left is MachineInput) {
      path.lineTo(0, size.height / 2 + portSize.width / 2);
      path.lineTo(0 + portSize.height, size.height / 2 + portSize.width / 2);
      path.lineTo(0 + portSize.height, size.height / 2 - portSize.width / 2);
      path.lineTo(0, size.height / 2 - portSize.width / 2);
    } else if (left is MachineOutput) {
      canvas.drawRect(
        Rect.fromPoints(
          Offset(0, size.height / 2 + portSize.width / 2),
          Offset(0 - portSize.height, size.height / 2 - portSize.width / 2),
        ),
        outputPaint,
      );
    }
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
