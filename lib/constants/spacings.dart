import 'package:flutter/cupertino.dart';
import 'package:layout/layout.dart';

class AppSpacings {
  const AppSpacings._();

  static EdgeInsets screenPadding(LayoutData layout) {
    return EdgeInsets.symmetric(
      horizontal: layout.value(
        xs: 20,
        sm: 40,
        lg: 60,
        xl: 70,
      ),
    );
  }

  static EdgeInsets dialogMargin(LayoutData layout) {
    return layout.value(
      xs: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 10,
      ),
      sm: EdgeInsets.symmetric(
        horizontal: layout.value<double>(
          xs: 20,
          sm: 40,
          lg: 60,
          xl: 70,
        ),
        vertical: layout.height / 10,
      ),
    );
  }

  static EdgeInsets dialogPadding(LayoutData layout) {
    return layout.value(
      xs: const EdgeInsets.all(20),
      sm: const EdgeInsets.all(30),
    );
  }

  static double small(LayoutData layout) {
    return layout.value<double>(
      xs: 15,
      sm: 30,
      lg: 40,
      xl: 50,
    );
  }

  static double big(LayoutData layout) {
    return layout.value<double>(
      xs: 20,
      sm: 40,
      lg: 60,
      xl: 70,
    );
  }
}
