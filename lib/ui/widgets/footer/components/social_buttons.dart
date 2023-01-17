import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/gen/assets.gen.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialButton(
          svg: Assets.svgs.facebook.path,
        ),
        const SizedBox(width: 10),
        SocialButton(
          svg: Assets.svgs.instagram.path,
        ),
        const SizedBox(width: 10),
        SocialButton(
          svg: Assets.svgs.youtube.path,
        ),
        const SizedBox(width: 10),
        SocialButton(
          svg: Assets.svgs.linkedin.path,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.svg,
  });

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: AppColors.lightGreen,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset(
        svg,
        color: AppColors.lightGreen,
      ),
    );
  }
}
