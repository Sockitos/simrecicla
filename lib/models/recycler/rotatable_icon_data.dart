import 'package:flutter/widgets.dart';

class RotatableIconData {
  const RotatableIconData({required this.icons});

  final List<IconData> icons;

  RotatableIconData rotate() {
    return RotatableIconData(
      icons: [...icons]
        ..removeAt(0)
        ..add(icons.first),
    );
  }

  IconData get icon => icons.first;
}

extension IconDataX on IconData {
  RotatableIconData toRotatable() => RotatableIconData(icons: [this]);
}
