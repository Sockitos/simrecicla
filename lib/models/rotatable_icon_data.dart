import 'package:flutter/widgets.dart';

class RotatableIconData extends IconData {
  RotatableIconData({required this.icons}) : super(icons.first.codePoint);

  final List<IconData> icons;

  RotatableIconData rotate() {
    return RotatableIconData(
      icons: [...icons]
        ..removeAt(0)
        ..add(icons.first),
    );
  }

  IconData get _icon => icons.first;

  @override
  int get codePoint => _icon.codePoint;

  @override
  String? get fontFamily => _icon.fontFamily;

  @override
  String? get fontPackage => _icon.fontPackage;

  @override
  bool get matchTextDirection => _icon.matchTextDirection;
}

extension IconDataX on IconData {
  RotatableIconData toRotatable() => RotatableIconData(icons: [this]);
}
