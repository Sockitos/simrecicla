import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class RecyclerScreen extends HookWidget {
  const RecyclerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final grid = useState<Grid>(Grid(10, 10));
    return ScreenWrapper(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 50.0 * grid.value.xSize,
              height: 50.0 * grid.value.ySize,
              child: Stack(
                children: [
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: grid.value.xSize,
                    ),
                    itemBuilder: (context, _) => DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    itemCount: grid.value.xSize * grid.value.ySize,
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: grid.value.xSize,
                    ),
                    itemBuilder: (context, index) => DragTarget<GridCell>(
                      onWillAccept: (newCell) {
                        final cell =
                            grid.value.getCell(index % 10, index ~/ 10);
                        if (cell != null) return false;
                        if (newCell == null) return false;
                        final neighborUp =
                            grid.value.getCell(index % 10, index ~/ 10 - 1);
                        if (neighborUp != null &&
                            !neighborUp.willAccept(
                              Direction.down,
                              newCell,
                            )) {
                          return false;
                        }
                        final neighborDown =
                            grid.value.getCell(index % 10, index ~/ 10 + 1);
                        if (neighborDown != null &&
                            !neighborDown.willAccept(
                              Direction.up,
                              newCell,
                            )) {
                          return false;
                        }
                        final neighborLeft =
                            grid.value.getCell(index % 10 - 1, index ~/ 10);
                        if (neighborLeft != null &&
                            !neighborLeft.willAccept(
                              Direction.right,
                              newCell,
                            )) {
                          return false;
                        }
                        final neighborRight =
                            grid.value.getCell(index % 10 + 1, index ~/ 10);
                        if (neighborRight != null &&
                            !neighborRight.willAccept(
                              Direction.left,
                              newCell,
                            )) {
                          return false;
                        }

                        return true;
                      },
                      onAccept: (data) {
                        final _grid = grid.value;
                        _grid.setCell(index % 10, index ~/ 10, cell: data);
                        grid.value = _grid;
                      },
                      builder: (context, machines, _) {
                        final cell =
                            grid.value.getCell(index % 10, index ~/ 10);
                        if (cell == null) {
                          return const SizedBox();
                        } else {
                          return cell.buildWidget();
                        }
                      },
                    ),
                    itemCount: grid.value.xSize * grid.value.ySize,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Draggable<GridCell>(
                      data: red,
                      feedback: red.buildWidget(),
                      childWhenDragging: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: red.buildWidget(),
                    ),
                    const SizedBox(width: 20),
                    Draggable<GridCell>(
                      data: blue,
                      feedback: blue.buildWidget(),
                      childWhenDragging: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: blue.buildWidget(),
                    ),
                    const SizedBox(width: 20),
                    Draggable<GridCell>(
                      data: green,
                      feedback: green.buildWidget(),
                      childWhenDragging: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: green.buildWidget(),
                    ),
                    const SizedBox(width: 20),
                    Draggable<GridCell>(
                      data: yellow,
                      feedback: yellow.buildWidget(),
                      childWhenDragging: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: yellow.buildWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const red = GridCell(
  color: Colors.red,
  portUp: Port(
    type: PortType.input,
    materials: ['a', 'b'],
  ),
);

const blue = GridCell(
  color: Colors.blue,
  portDown: Port(
    type: PortType.output,
    materials: ['a'],
  ),
);

const green = GridCell(
  color: Colors.green,
  portLeft: Port(
    type: PortType.input,
    materials: ['a', 'b'],
  ),
);

const yellow = GridCell(
  color: Colors.yellow,
  portRight: Port(
    type: PortType.output,
    materials: ['a', 'b'],
  ),
);

class Grid {
  Grid(
    this.xSize,
    this.ySize,
  ) : _matrix = List.generate(
          ySize,
          (_) => List.generate(xSize, (_) => null),
        );

  final int xSize;
  final int ySize;
  final List<List<GridCell?>> _matrix;

  GridCell? getCell(int x, int y) =>
      (y >= 0 && y < ySize && x >= 0 && x < xSize) ? _matrix[y][x] : null;
  void setCell(int x, int y, {GridCell? cell}) => _matrix[y][x] = cell;

  void canSetCell(int x, int y, {GridCell? cell}) {}
}

enum PortType {
  input,
  output,
}

enum Direction {
  up,
  down,
  left,
  right,
}

class Port {
  const Port({
    required this.type,
    required this.materials,
  });
  final PortType type;
  final List<String> materials;
}

class GridCell {
  const GridCell({
    required this.color,
    this.portUp,
    this.portDown,
    this.portLeft,
    this.portRight,
  });

  bool willAccept(Direction direction, GridCell cell) {
    switch (direction) {
      case Direction.up:
        return willAcceptUp(cell);
      case Direction.down:
        return willAcceptDown(cell);
      case Direction.left:
        return willAcceptLeft(cell);
      case Direction.right:
        return willAcceptRight(cell);
    }
  }

  final Color color;

  final Port? portUp;
  final Port? portDown;
  final Port? portLeft;
  final Port? portRight;

  bool willConnectPorts(Port input, Port output) {
    final inputMaterials = [...input.materials];
    final outputMaterials = [...output.materials];
    outputMaterials.removeWhere(inputMaterials.contains);
    return outputMaterials.isEmpty;
  }

  bool willAcceptUp(GridCell cell) {
    if (cell.portDown?.type == PortType.input) {
      if (portUp?.type == PortType.output) {
        return willConnectPorts(cell.portDown!, portUp!);
      } else {
        return true;
      }
    } else if (cell.portDown?.type == PortType.output) {
      if (portUp?.type == PortType.input) {
        return willConnectPorts(portUp!, cell.portDown!);
      } else {
        return false;
      }
    } else {
      return portUp?.type != PortType.output;
    }
  }

  bool willAcceptDown(GridCell cell) {
    if (cell.portUp?.type == PortType.input) {
      if (portDown?.type == PortType.output) {
        return willConnectPorts(cell.portUp!, portDown!);
      } else {
        return true;
      }
    } else if (cell.portUp?.type == PortType.output) {
      if (portDown?.type == PortType.input) {
        return willConnectPorts(portUp!, cell.portDown!);
      } else {
        return false;
      }
    } else {
      return portDown?.type != PortType.output;
    }
  }

  bool willAcceptLeft(GridCell cell) {
    if (cell.portRight?.type == PortType.input) {
      if (portLeft?.type == PortType.output) {
        return willConnectPorts(cell.portRight!, portLeft!);
      } else {
        return true;
      }
    } else if (cell.portRight?.type == PortType.output) {
      if (portLeft?.type == PortType.input) {
        return willConnectPorts(portLeft!, cell.portRight!);
      } else {
        return false;
      }
    } else {
      return portLeft?.type != PortType.output;
    }
  }

  bool willAcceptRight(GridCell cell) {
    if (cell.portLeft?.type == PortType.input) {
      if (portRight?.type == PortType.output) {
        return willConnectPorts(cell.portLeft!, portRight!);
      } else {
        return true;
      }
    } else if (cell.portLeft?.type == PortType.output) {
      if (portRight?.type == PortType.input) {
        return willConnectPorts(portRight!, cell.portLeft!);
      } else {
        return false;
      }
    } else {
      return portRight?.type != PortType.output;
    }
  }

  Widget buildOutput(Direction direction) {
    return Positioned(
      top: (direction == Direction.left || direction == Direction.right)
          ? 0
          : direction == Direction.up
              ? -11
              : null,
      bottom: (direction == Direction.left || direction == Direction.right)
          ? 0
          : direction == Direction.down
              ? -11
              : null,
      left: (direction == Direction.up || direction == Direction.down)
          ? 0
          : direction == Direction.left
              ? -11
              : null,
      right: (direction == Direction.up || direction == Direction.down)
          ? 0
          : direction == Direction.right
              ? -11
              : null,
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget buildWidget() {
    return ClipPath(
      clipper: PuzzleClipper(
        up: portUp?.type == PortType.input,
        down: portDown?.type == PortType.input,
        left: portLeft?.type == PortType.input,
        right: portRight?.type == PortType.input,
      ),
      child: Container(
        height: 50,
        width: 50,
        color: color,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (portUp?.type == PortType.output) buildOutput(Direction.up),
            if (portDown?.type == PortType.output) buildOutput(Direction.down),
            if (portLeft?.type == PortType.output) buildOutput(Direction.left),
            if (portRight?.type == PortType.output)
              buildOutput(Direction.right),
          ],
        ),
      ),
    );
  }
}

class PuzzleClipper extends CustomClipper<Path> {
  const PuzzleClipper({
    this.up = false,
    this.down = false,
    this.left = false,
    this.right = false,
  });

  final bool up;
  final bool down;
  final bool left;
  final bool right;
  @override
  Path getClip(Size size) {
    final inputsPath = Path();
    if (up) {
      inputsPath.addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, 5),
          radius: 6,
        ),
      );
    }

    if (down) {
      inputsPath.addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height - 5),
          radius: 6,
        ),
      );
    }

    if (left) {
      inputsPath.addOval(
        Rect.fromCircle(
          center: Offset(5, size.height / 2),
          radius: 6,
        ),
      );
    }

    if (right) {
      inputsPath.addOval(
        Rect.fromCircle(
          center: Offset(size.width - 5, size.height / 2),
          radius: 6,
        ),
      );
    }

    return Path.combine(
      PathOperation.difference,
      Path()
        ..addRect(Rect.fromLTWH(-11, -11, size.width + 22, size.height + 22)),
      inputsPath..close(),
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
