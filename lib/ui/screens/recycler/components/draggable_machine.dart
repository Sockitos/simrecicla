import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/models/machine.dart';
import 'package:simtech/models/machine_port.dart';
import 'package:simtech/ui/widgets/my_drag_target.dart';

enum MachineState {
  disconnected,
  connected,
  validated,
}

class DraggableMachine extends StatelessWidget {
  const DraggableMachine({
    super.key,
    required this.machine,
    required this.size,
    required this.portSize,
    this.draggingSize,
    this.draggingPortSize,
    this.isInGrid = false,
    this.state = MachineState.connected,
  });

  final Machine machine;
  final Size size;
  final Size portSize;
  final Size? draggingSize;
  final Size? draggingPortSize;
  final bool isInGrid;
  final MachineState state;

  @override
  Widget build(BuildContext context) {
    final maxSize = draggingSize == null
        ? size
        : Size(
            max(size.width, draggingSize!.width),
            max(size.height, draggingSize!.height),
          );

    final Color color;
    if (!isInGrid) {
      color = AppColors.black;
    } else {
      switch (state) {
        case MachineState.disconnected:
          color = AppColors.grey6;
          break;
        case MachineState.connected:
        case MachineState.validated:
          color = AppColors.black;
          break;
      }
    }

    final Color accentColor;
    if (!isInGrid) {
      accentColor = AppColors.black;
    } else {
      switch (state) {
        case MachineState.disconnected:
          accentColor = AppColors.grey6;
          break;
        case MachineState.connected:
          accentColor = AppColors.black;
          break;
        case MachineState.validated:
          accentColor = AppColors.lightGreen;
          break;
      }
    }

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
                  color: color,
                  accentColor: accentColor,
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
                        color: color,
                        accentColor: accentColor,
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
                  color: color,
                  accentColor: accentColor,
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
    required this.color,
    required this.accentColor,
  });

  final IconData icon;
  final Size portSize;
  final MachinePort? top;
  final MachinePort? left;
  final MachinePort? bottom;
  final MachinePort? right;
  final Color color;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 2;
    paint.color = color;

    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontFamily: icon.fontFamily,
          color: accentColor,
          fontSize: min(size.height, size.width) - portSize.height - 15,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();

    void _paintOutput(
      Rect rect,
      AxisDirection direction,
      MachineOutputType type,
    ) {
      final outputPaint = Paint();
      outputPaint.style = PaintingStyle.stroke;
      outputPaint.strokeJoin = StrokeJoin.round;
      outputPaint.strokeCap = StrokeCap.round;
      outputPaint.strokeWidth = 2;
      outputPaint.color = color;

      switch (type) {
        case MachineOutputType.one:
          canvas.drawRect(
            rect,
            outputPaint..style = PaintingStyle.fill,
          );
          break;
        case MachineOutputType.two:
          canvas.drawRect(rect, outputPaint);
          switch (direction) {
            case AxisDirection.up:
              canvas.drawLine(rect.bottomLeft, rect.topRight, outputPaint);
              break;
            case AxisDirection.right:
              canvas.drawLine(rect.topLeft, rect.bottomRight, outputPaint);
              break;
            case AxisDirection.down:
              canvas.drawLine(rect.bottomRight, rect.topLeft, outputPaint);
              break;
            case AxisDirection.left:
              canvas.drawLine(rect.topRight, rect.bottomLeft, outputPaint);
              break;
          }
          break;
        case MachineOutputType.three:
          canvas.drawRect(rect, outputPaint);
          switch (direction) {
            case AxisDirection.up:
            case AxisDirection.down:
              canvas.drawLine(rect.topCenter, rect.bottomCenter, outputPaint);
              break;
            case AxisDirection.right:
            case AxisDirection.left:
              canvas.drawLine(rect.centerLeft, rect.centerRight, outputPaint);
              break;
          }
          break;
      }
    }

    final offset = Offset(
      size.width / 2 - textPainter.width / 2,
      size.height / 2 - textPainter.height / 2,
    );
    textPainter.paint(canvas, offset);

    path.moveTo(0, 0);

    top?.map(
      input: (input) {
        path.lineTo(size.width / 2 - portSize.width / 2, 0);
        path.lineTo(size.width / 2 - portSize.width / 2, 0 + portSize.height);
        path.lineTo(size.width / 2 + portSize.width / 2, 0 + portSize.height);
        path.lineTo(size.width / 2 + portSize.width / 2, 0);
      },
      output: (output) {
        final rect = Rect.fromPoints(
          Offset(size.width / 2 - portSize.width / 2, 0),
          Offset(
            size.width / 2 + portSize.width / 2,
            0 - portSize.height,
          ),
        );
        _paintOutput(rect, AxisDirection.up, output.type);
      },
    );
    path.lineTo(size.width, 0);

    right?.map(
      input: (input) {
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
      },
      output: (output) {
        final rect = Rect.fromPoints(
          Offset(size.width, size.height / 2 - portSize.width / 2),
          Offset(
            size.width + portSize.height,
            size.height / 2 + portSize.width / 2,
          ),
        );
        _paintOutput(rect, AxisDirection.right, output.type);
      },
    );
    path.lineTo(size.width, size.height);

    bottom?.map(
      input: (input) {
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
      },
      output: (output) {
        final rect = Rect.fromPoints(
          Offset(size.width / 2 + portSize.width / 2, size.height),
          Offset(
            size.width / 2 - portSize.width / 2,
            size.height + portSize.height,
          ),
        );
        _paintOutput(rect, AxisDirection.down, output.type);
      },
    );
    path.lineTo(0, size.height);

    left?.map(
      input: (input) {
        path.lineTo(0, size.height / 2 + portSize.width / 2);
        path.lineTo(0 + portSize.height, size.height / 2 + portSize.width / 2);
        path.lineTo(0 + portSize.height, size.height / 2 - portSize.width / 2);
        path.lineTo(0, size.height / 2 - portSize.width / 2);
      },
      output: (output) {
        final rect = Rect.fromPoints(
          Offset(0, size.height / 2 + portSize.width / 2),
          Offset(0 - portSize.height, size.height / 2 - portSize.width / 2),
        );
        _paintOutput(rect, AxisDirection.left, output.type);
      },
    );
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
