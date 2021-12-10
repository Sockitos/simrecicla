import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/services/packager_service.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final Rating rating;

  double _getArrowPosition(Rating rating) {
    switch (rating) {
      case Rating.a:
        return 35;
      case Rating.b:
        return 145;
      case Rating.c:
        return 255;
      case Rating.d:
        return 365;
      case Rating.e:
        return 475;
      case Rating.f:
        return 585;
    }
  }

  Color _getColor(Rating rating) {
    switch (rating) {
      case Rating.a:
        return AppColors.ratingA;
      case Rating.b:
        return AppColors.ratingB;
      case Rating.c:
        return AppColors.ratingC;
      case Rating.d:
        return AppColors.ratingD;
      case Rating.e:
        return AppColors.ratingE;
      case Rating.f:
        return AppColors.ratingF;
    }
  }

  String _getLetter(Rating rating) {
    switch (rating) {
      case Rating.a:
        return 'A';
      case Rating.b:
        return 'B';
      case Rating.c:
        return 'C';
      case Rating.d:
        return 'D';
      case Rating.e:
        return 'E';
      case Rating.f:
        return 'F';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      padding: EdgeInsets.zero,
      body: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Ink(
                    color: AppColors.grey2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resultado',
                            style: AppTextStyles.h2
                                .copyWith(color: AppColors.lightGreen),
                          ),
                          const SizedBox(height: 300),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recomendações',
                          style: AppTextStyles.h2
                              .copyWith(color: AppColors.lightGreen),
                        ),
                        const SizedBox(height: 40),
                        const Recommendation(),
                        const SizedBox(height: 40),
                        const Recommendation(),
                        const SizedBox(height: 40),
                        const Recommendation(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 550,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: _getColor(rating).withOpacity(0.2),
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 320),
                          child: SizedBox(
                            height: _getArrowPosition(rating) + 50,
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 48),
                              child: SizedBox(
                                width: 300,
                                child: Material(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(34),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      36,
                                      86,
                                      36,
                                      36,
                                    ),
                                    child: Text(
                                      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                                      style: AppTextStyles.paragraph,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 48,
                              child: CircleAvatar(
                                backgroundColor: _getColor(rating),
                                radius: 50,
                                child: Text(
                                  _getLetter(rating),
                                  style: GoogleFonts.dosis(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 60,
                                      color: AppColors.white,
                                      height: 1.1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Hero(
                      tag: 'rating_bar',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Totalmente reciclável',
                              style: AppTextStyles.paragraph,
                            ),
                            const SizedBox(height: 30),
                            Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                SizedBox(
                                  height: 660,
                                  width: 60,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: const [
                                      Expanded(
                                        child:
                                            Material(color: AppColors.ratingA),
                                      ),
                                      Expanded(
                                        child:
                                            Material(color: AppColors.ratingB),
                                      ),
                                      Expanded(
                                        child:
                                            Material(color: AppColors.ratingC),
                                      ),
                                      Expanded(
                                        child:
                                            Material(color: AppColors.ratingD),
                                      ),
                                      Expanded(
                                        child:
                                            Material(color: AppColors.ratingE),
                                      ),
                                      Expanded(
                                        child:
                                            Material(color: AppColors.ratingF),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 85,
                                  right: 0,
                                  child: SizedBox(
                                    height: 660,
                                    child: DefaultTextStyle(
                                      style: AppTextStyles.h2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: const [
                                          Expanded(
                                            child: Center(child: Text('A')),
                                          ),
                                          Expanded(
                                            child: Center(child: Text('B')),
                                          ),
                                          Expanded(
                                            child: Center(child: Text('C')),
                                          ),
                                          Expanded(
                                            child: Center(child: Text('D')),
                                          ),
                                          Expanded(
                                            child: Center(child: Text('E')),
                                          ),
                                          Expanded(
                                            child: Center(child: Text('F')),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 300),
                                  left: -90,
                                  top: _getArrowPosition(rating),
                                  child: SvgPicture.asset(
                                    'assets/svgs/arrow_right.svg',
                                    color: AppColors.lightGreen,
                                    height: 40,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Não reciclável',
                              style: AppTextStyles.paragraph,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Recommendation extends StatelessWidget {
  const Recommendation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 64,
          width: 64,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 4,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: AppTextStyles.paragraph,
          ),
        ),
        const SizedBox(width: 24),
        SvgPicture.asset(
          'assets/svgs/arrow_right.svg',
          color: AppColors.lightGreen,
          height: 40,
        ),
        const SizedBox(width: 48),
        SizedBox(
          height: 64,
          width: 64,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 4,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: AppTextStyles.paragraph,
          ),
        ),
      ],
    );
  }
}
