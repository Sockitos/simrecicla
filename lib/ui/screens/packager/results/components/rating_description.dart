import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/packager/enums.dart';

class RatingDescription extends StatelessWidget {
  const RatingDescription({
    super.key,
    required this.rating,
  });

  final Rating rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 48,
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                34,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                25,
                context.layout.value(xs: 40, lg: 60),
                25,
                25,
              ),
              child: Text(
                rating.description,
                style: context.layout.value(
                  xs: AppTextStyles.bodyM(context.layout),
                  lg: AppTextStyles.bodyL(context.layout),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: context.layout.value(xs: 0, md: 25),
          right: context.layout.breakpoint < LayoutBreakpoint.md ? 0 : null,
          child: CircleAvatar(
            backgroundColor: rating.color,
            radius: context.layout.value(xs: 40, lg: 50),
            child: Text(
              rating.name.toUpperCase(),
              style: GoogleFonts.dosis(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: context.layout.value(xs: 45, lg: 60),
                  color: AppColors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
