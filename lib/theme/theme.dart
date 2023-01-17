import 'package:flutter/material.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/theme/app_bar.dart';
import 'package:simrecicla/theme/color_scheme.dart';
import 'package:simrecicla/theme/elevated_button.dart';
import 'package:simrecicla/theme/tooltip_theme.dart';

final theme = ThemeData(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: AppColors.grey1,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  tooltipTheme: tooltipTheme,
);
