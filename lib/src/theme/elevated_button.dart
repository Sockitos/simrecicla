import 'package:flutter/material.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: AppColors.lightGreen,
    elevation: 0,
    shape: const StadiumBorder(),
    minimumSize: const Size(0, 62),
    maximumSize: const Size(double.maxFinite, 62),
    padding: const EdgeInsets.symmetric(
      horizontal: 40,
    ),
    textStyle: AppTextStyles.buttonStyle,
  ),
);
