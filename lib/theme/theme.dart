import 'package:flutter/material.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/theme/app_bar.dart';
import 'package:simtech/theme/color_scheme.dart';
import 'package:simtech/theme/elevated_button.dart';
import 'package:simtech/theme/tooltip_theme.dart';

final theme = ThemeData(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: AppColors.grey1,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  tooltipTheme: tooltipTheme,
);
