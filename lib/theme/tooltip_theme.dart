import 'package:flutter/material.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/text_styles.dart';

final tooltipTheme = TooltipThemeData(
  textStyle: AppTextStyles.tooltip(),
  decoration: BoxDecoration(
    color: AppColors.grey3,
    borderRadius: BorderRadius.circular(4),
  ),
);
