import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/ui/widgets/app_scrollbar.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    switch (axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        return AppScrollbar(
          controller: details.controller,
          padding: context.layout.value(
            xs: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 6,
            ),
            sm: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 12,
            ),
          ),
          child: child,
        );
    }
  }
}
