import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';

class AppTextStyles {
  static TextStyle h1(LayoutData layout) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout.value(xs: 40, sm: 50, lg: 60, xl: 70),
        color: AppColors.lightGreen,
        height: 1.1,
      ),
    );
  }

  static TextStyle h2(LayoutData layout) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout.value(xs: 30, lg: 34, xl: 36),
        color: AppColors.black,
        height: 1.3,
      ),
    );
  }

  static TextStyle h3(LayoutData layout) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout.value(xs: 30),
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }

  static TextStyle h4(LayoutData layout) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: layout.value(xs: 24),
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }

  static TextStyle paragraph(LayoutData layout) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: layout.value(xs: 20),
        color: AppColors.black,
        height: 1.3,
      ),
    );
  }

  static TextStyle dropdown(LayoutData layout) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: layout.value(xs: 18),
        color: AppColors.black,
        height: 1.3,
      ),
    );
  }

  static TextStyle button(LayoutData layout) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: layout.value(xs: 25),
        color: AppColors.white,
        height: 1.1,
      ),
    );
  }

  static final buttonStyle = GoogleFonts.dosis(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: AppColors.white,
      height: 1.1,
    ),
  );

  static TextStyle small(LayoutData layout) {
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: layout.value(xs: 15),
        color: AppColors.white,
        height: 1.2,
      ),
    );
  }
}
