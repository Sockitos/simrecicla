import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simtech/src/constants/colors.dart';

class Copyright extends StatelessWidget {
  const Copyright({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '© 2021 Sociedade Ponto Verde / Tratolixo',
      textAlign: TextAlign.end,
      style: GoogleFonts.barlow(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: AppColors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
