import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/router/router.gr.dart';
import 'package:simtech/src/ui/screens/landing/components/landing_option.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -200,
            child: Container(
              height: 1100,
              width: 1100,
              decoration: BoxDecoration(
                color: AppColors.grey3.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 1050,
            right: 0,
            child: SvgPicture.asset(
              'assets/svgs/circles.svg',
              color: AppColors.white,
            ),
          ),
          Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Lorem ipsum dolor sit',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1,
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    'assets/svgs/waves.svg',
                    color: AppColors.darkGreen,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 650,
                    child: Text(
                      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.paragraph,
                    ),
                  ),
                  const SizedBox(height: 60),
                  AdaptiveBuilder(
                    xs: (context) => Center(
                      child: Column(
                        children: [
                          LandingOption(
                            svg: 'assets/svgs/consumer_option.svg',
                            description: 'Quero reciclar uma embalagem',
                            onPressed: () => AutoRouter.of(context).push(
                              const ConsumerScreenRoute(),
                            ),
                          ),
                          const SizedBox(height: 80),
                          LandingOption(
                            svg: 'assets/svgs/packager_option.svg',
                            description:
                                'Quero melhorar a reciclabilidade de uma embalagem',
                            onPressed: () => AutoRouter.of(context).push(
                              const PackagerScreenRoute(),
                            ),
                          ),
                          const SizedBox(height: 80),
                          LandingOption(
                            svg: 'assets/svgs/recycler_option.svg',
                            description: 'Quero optimizar uma linha de triagem',
                            onPressed: () => AutoRouter.of(context).push(
                              const RecyclerScreenRoute(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    md: (context) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: context.layout.value(
                            xs: 30,
                            lg: 60,
                          ),
                        ),
                        Flexible(
                          child: LandingOption(
                            svg: 'assets/svgs/consumer_option.svg',
                            description: 'Quero reciclar uma embalagem',
                            onPressed: () => AutoRouter.of(context).push(
                              const ConsumerScreenRoute(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.layout.value(
                            xs: 30,
                            lg: 60,
                          ),
                        ),
                        Flexible(
                          child: LandingOption(
                            svg: 'assets/svgs/packager_option.svg',
                            description:
                                'Quero melhorar a reciclabilidade de uma embalagem',
                            onPressed: () => AutoRouter.of(context).push(
                              const PackagerScreenRoute(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.layout.value(
                            xs: 40,
                            lg: 80,
                          ),
                        ),
                        Flexible(
                          child: LandingOption(
                            svg: 'assets/svgs/recycler_option.svg',
                            description: 'Quero optimizar uma linha de triagem',
                            onPressed: () => AutoRouter.of(context).push(
                              const RecyclerScreenRoute(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.layout.value(
                            xs: 40,
                            lg: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
