import 'package:flutter/material.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';

final tooltipTheme = TooltipThemeData(
  textStyle: AppTextStyles.tooltipStyle,
  decoration: BoxDecoration(
    color: AppColors.grey3,
    borderRadius: BorderRadius.circular(4),
  ),
);
