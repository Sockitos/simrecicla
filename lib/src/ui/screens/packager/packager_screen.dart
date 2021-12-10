import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/router/router.gr.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class PackagerScreen extends StatelessWidget {
  const PackagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      padding: EdgeInsets.zero,
      body: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'Melhorar a reciclabilidade de uma embalagem',
                      style: AppTextStyles.h1,
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Column(
                        children: [
                          Text(
                            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: AppTextStyles.paragraph,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: AppTextStyles.paragraph,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 400,
                        width: 500,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 20,
                              child: SizedBox(
                                height: 360,
                                width: 360,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.grey3.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SvgPicture.asset('assets/svgs/arrow_down.svg'),
                                const SizedBox(height: 40),
                                Text(
                                  'Quero testar a minha embalagem',
                                  style: AppTextStyles.h2,
                                ),
                                const SizedBox(height: 40),
                                ElevatedButton(
                                  onPressed: () => AutoRouter.of(context).push(
                                    const FormScreenRoute(),
                                  ),
                                  child: const Text('Questionário'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2),
            Expanded(
              flex: 5,
              child: Material(
                color: AppColors.yellow,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: SvgPicture.asset('assets/svgs/packager_2.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
