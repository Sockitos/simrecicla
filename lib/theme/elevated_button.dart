import 'package:flutter/material.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: AppColors.lightGreen,
    shadowColor: Colors.transparent,
    elevation: 0,
    shape: const StadiumBorder(),
    fixedSize: const Size.fromHeight(56),
    padding: const EdgeInsets.symmetric(
      horizontal: 40,
    ),
    textStyle: AppTextStyles.buttonStyle,
  ),
);
