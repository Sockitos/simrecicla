import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/recycler/machine.dart';
import 'package:simtech/models/recycler/machine_port.dart';

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
    final iconSize = min(size.height, size.width) - portSize.height - 4;

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
        child: Draggable<Machine>(
          ignoringFeedbackPointer: false,
          data: machine,
          maxSimultaneousDrags: machine.isFixed ? 0 : 1,
          feedback: Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.grabbing,
              opaque: false,
              child: SizedBox(
                height: (draggingSize ?? size).height,
                width: (draggingSize ?? size).width,
                child: CustomPaint(
                  painter: _MachinePainter(
                    portSize: draggingPortSize ?? portSize,
                    top: machine.topPort,
                    left: machine.leftPort,
                    bottom: machine.bottomPort,
                    right: machine.rightPort,
                    color: color,
                    accentColor: accentColor,
                  ),
                  child: Icon(
                    machine.icon,
                    size: iconSize,
                    color: accentColor,
                  ),
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
                        portSize: portSize,
                        top: machine.topPort,
                        left: machine.leftPort,
                        bottom: machine.bottomPort,
                        right: machine.rightPort,
                        color: color,
                        accentColor: accentColor,
                      ),
                      child: Icon(
                        machine.icon,
                        size: iconSize,
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
          child: Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.grab,
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: CustomPaint(
                  painter: _MachinePainter(
                    portSize: portSize,
                    top: machine.topPort,
                    left: machine.leftPort,
                    bottom: machine.bottomPort,
                    right: machine.rightPort,
                    color: color,
                    accentColor: accentColor,
                  ),
                  child: Center(
                    child: machine.isFinal && state == MachineState.validated
                        ? DecoratedBox(
                            decoration: const BoxDecoration(
                              color: AppColors.lightGreen,
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(
                              height: 26,
                              width: 26,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: FittedBox(
                                  child: Center(
                                    child: Text(
                                      '${machine.index}',
                                      style: AppTextStyles.bodyS(context.layout)
                                          .withColor(AppColors.white)
                                          .copyWith(height: 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Icon(
                            machine.icon,
                            size: iconSize,
                            color: accentColor,
                          ),
                  ),
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
    required this.portSize,
    this.top,
    this.left,
    this.bottom,
    this.right,
    required this.color,
    required this.accentColor,
  });

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

    void paintOutput(
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
        paintOutput(rect, AxisDirection.up, output.type);
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
        paintOutput(rect, AxisDirection.right, output.type);
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
        paintOutput(rect, AxisDirection.down, output.type);
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
        paintOutput(rect, AxisDirection.left, output.type);
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
