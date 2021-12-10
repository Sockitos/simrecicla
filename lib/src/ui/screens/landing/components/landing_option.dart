import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';

class LandingOption extends StatelessWidget {
  const LandingOption({
    Key? key,
    required this.svg,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  final String svg;
  final String description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 350,
        maxWidth: 400,
        minHeight: 400,
        maxHeight: 400,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.grey3,
                    offset: Offset(20, 20),
                  ),
                ],
              ),
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: onPressed,
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(svg),
                  Flexible(
                    child: Center(
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h2,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svgs/arrow_right.svg',
                    color: AppColors.lightGreen,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
