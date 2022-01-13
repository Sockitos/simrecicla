import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';

class LandingOption extends StatelessWidget {
  const LandingOption({
    Key? key,
    required this.svg,
    required this.description,
    required this.tooltip,
    required this.onPressed,
  }) : super(key: key);

  final String svg;
  final String description;
  final String tooltip;
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
            padding: const EdgeInsets.only(top: 20),
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
                child: Tooltip(
                  message: tooltip,
                  verticalOffset: 220,
                  waitDuration: const Duration(milliseconds: 500),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: onPressed,
                  ),
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
                  SizedBox(
                    height: 180,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(svg),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SvgPicture.asset(
                    'assets/svgs/arrow_right.svg',
                    color: AppColors.lightGreen,
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
