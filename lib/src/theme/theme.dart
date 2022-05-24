import 'package:flutter/material.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/theme/app_bar.dart';
import 'package:simtech/src/theme/color_scheme.dart';
import 'package:simtech/src/theme/elevated_button.dart';
import 'package:simtech/src/theme/tooltip_theme.dart';

final theme = ThemeData(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: AppColors.grey1,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  tooltipTheme: tooltipTheme,
);
