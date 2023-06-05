import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/models/recycler/machine.dart';
import 'package:simrecicla/models/recycler/machine_port.dart';

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
    this.onDragStart,
    this.onDragEnd,
  });

  final Machine machine;
  final Size size;
  final Size portSize;
  final Size? draggingSize;
  final Size? draggingPortSize;
  final bool isInGrid;
  final MachineState state;
  final VoidCallback? onDragStart;
  final VoidCallback? onDragEnd;

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
        case MachineState.connected:
        case MachineState.validated:
          color = AppColors.black;
      }
    }

    final Color accentColor;
    if (!isInGrid) {
      accentColor = AppColors.black;
    } else {
      switch (state) {
        case MachineState.disconnected:
          accentColor = AppColors.grey6;
        case MachineState.connected:
          accentColor = AppColors.black;
        case MachineState.validated:
          accentColor = AppColors.lightGreen;
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
          onDragStarted: onDragStart,
          onDragCompleted: onDragEnd,
          onDraggableCanceled: (_, __) => onDragEnd?.call(),
          ignoringFeedbackPointer: false,
          data: machine,
          maxSimultaneousDrags: machine.isFixed ? 0 : 1,
          feedback: SizedBox(
            height: maxSize.height,
            width: maxSize.width,
            child: Center(
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
                      size: min(
                            (draggingSize ?? size).height,
                            (draggingSize ?? size).width,
                          ) -
                          (draggingPortSize ?? portSize).height -
                          4,
                      color: accentColor,
                    ),
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
                        size:
                            min(size.height, size.width) - portSize.height - 4,
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
                            size: min(size.height, size.width) -
                                portSize.height -
                                4,
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
        case MachineOutputType.two:
          canvas.drawRect(rect, outputPaint);
          switch (direction) {
            case AxisDirection.up:
              canvas.drawLine(rect.bottomLeft, rect.topRight, outputPaint);
            case AxisDirection.right:
              canvas.drawLine(rect.topLeft, rect.bottomRight, outputPaint);
            case AxisDirection.down:
              canvas.drawLine(rect.bottomRight, rect.topLeft, outputPaint);
            case AxisDirection.left:
              canvas.drawLine(rect.topRight, rect.bottomLeft, outputPaint);
          }
        case MachineOutputType.three:
          canvas.drawRect(rect, outputPaint);
          switch (direction) {
            case AxisDirection.up:
            case AxisDirection.down:
              canvas.drawLine(rect.topCenter, rect.bottomCenter, outputPaint);
            case AxisDirection.right:
            case AxisDirection.left:
              canvas.drawLine(rect.centerLeft, rect.centerRight, outputPaint);
          }
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
