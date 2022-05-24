import 'package:flutter/material.dart';

class Grid<T> {
  Grid(
    this.xSize,
    this.ySize,
  ) : _matrix = List.generate(
          ySize,
          (_) => List.generate(xSize, (_) => null),
        );

  final int xSize;
  final int ySize;
  final List<List<T?>> _matrix;

  void remove(T cell) {
    for (final row in _matrix) {
      final index = row.indexOf(cell);
      if (index != -1) row[index] = null;
    }
  }

  T? getCell(int x, int y) =>
      (y >= 0 && y < ySize && x >= 0 && x < xSize) ? _matrix[y][x] : null;
  void setCell(int x, int y, {T? cell}) => _matrix[y][x] = cell;

  T? getCellFromDirection(int x, int y, AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return getCell(x, y - 1);
      case AxisDirection.left:
        return getCell(x - 1, y);
      case AxisDirection.down:
        return getCell(x, y + 1);
      case AxisDirection.right:
        return getCell(x + 1, y);
    }
  }
}
