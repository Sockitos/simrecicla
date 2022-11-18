import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';

extension TextStyleX on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle h1([LayoutData? layout]) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout?.value(xs: 40, sm: 50, lg: 60, xl: 70) ?? 60,
        color: AppColors.lightGreen,
        height: 1.1,
      ),
    );
  }

  static TextStyle h2([LayoutData? layout]) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout?.value(xs: 30, lg: 34, xl: 36) ?? 34,
        color: AppColors.black,
        height: 1.3,
      ),
    );
  }

  static TextStyle h3([LayoutData? layout]) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout?.value(xs: 30) ?? 30,
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }

  static TextStyle h4([LayoutData? layout]) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout?.value(xs: 24) ?? 24,
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }

  static TextStyle h5([LayoutData? layout]) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout?.value(xs: 20) ?? 20,
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }

  static TextStyle bodyL([LayoutData? layout]) {
    return GoogleFonts.barlow(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: layout?.value(xs: 20) ?? 20,
        color: AppColors.black,
        height: 1.3,
      ),
    );
  }

  static TextStyle bodyM([LayoutData? layout]) {
    return GoogleFonts.barlow(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: layout?.value(xs: 18) ?? 18,
        color: AppColors.black,
        height: 1.3,
      ),
    );
  }

  static TextStyle bodyS([LayoutData? layout]) {
    return GoogleFonts.barlow(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: layout?.value(xs: 15) ?? 15,
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }

  static TextStyle button([LayoutData? layout]) {
    return GoogleFonts.barlow(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: layout?.value(xs: 25) ?? 25,
        color: AppColors.white,
        height: 1.1,
      ),
    );
  }

  static TextStyle smallButton([LayoutData? layout]) {
    return GoogleFonts.barlow(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: layout?.value(xs: 18) ?? 18,
        color: AppColors.black,
        height: 1,
      ),
    );
  }

  static TextStyle tooltip([LayoutData? layout]) {
    return GoogleFonts.barlow(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: layout?.value(xs: 18) ?? 18,
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }
}
