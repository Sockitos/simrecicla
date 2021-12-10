import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SocialButton(
          svg: 'assets/svgs/facebook.svg',
        ),
        SizedBox(width: 10),
        SocialButton(
          svg: 'assets/svgs/instagram.svg',
        ),
        SizedBox(width: 10),
        SocialButton(
          svg: 'assets/svgs/youtube.svg',
        ),
        SizedBox(width: 10),
        SocialButton(
          svg: 'assets/svgs/linkedin.svg',
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.svg,
  }) : super(key: key);

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
