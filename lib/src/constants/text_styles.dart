import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simtech/src/constants/colors.dart';

class AppTextStyles {
  static final h1 = GoogleFonts.dosis(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 70,
      color: AppColors.lightGreen,
      height: 1.1,
    ),
  );

  static final h2 = GoogleFonts.dosis(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      color: AppColors.black,
      height: 1.3,
    ),
  );

  static final h3 = GoogleFonts.dosis(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      color: AppColors.black,
      height: 1.2,
    ),
  );

  static final h4 = GoogleFonts.dosis(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: AppColors.black,
      height: 1.2,
    ),
  );

  static final paragraph = GoogleFonts.barlow(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: AppColors.black,
      height: 1.3,
    ),
  );

  static final dropdown = GoogleFonts.barlow(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: AppColors.black,
      height: 1.3,
    ),
  );

  static final button = GoogleFonts.barlow(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: AppColors.white,
      height: 1.1,
    ),
  );

  static final small = GoogleFonts.barlow(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: AppColors.white,
      height: 1.2,
    ),
  );
}
