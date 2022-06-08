import 'package:layout/layout.dart';

class AppSpacings {
  const AppSpacings._();

  static double small(LayoutData layout) {
    return layout.value<double>(
      xs: 20,
      sm: 30,
      lg: 40,
      xl: 50,
    );
  }

  static double big(LayoutData layout) {
    return layout.value<double>(
      xs: 30,
      sm: 40,
      lg: 60,
      xl: 70,
    );
  }
}
