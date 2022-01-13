import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/router/router.gr.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class ConsumerScreen extends StatelessWidget {
  const ConsumerScreen({Key? key}) : super(key: key);

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
                    const SizedBox(height: 60),
                    Text(
                      'Quero saber como reciclar uma embalagem',
                      style: AppTextStyles.h1,
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Column(
                        children: [
                          Text(
                            'Este simulador permite ao cidadão perceber o impacte das suas práticas de separação e encaminhamento das embalagens, e quantificar as consequências das suas ações tendo em conta as soluções de tratamento disponíveis, os processos a que os resíduos serão sujeitos e o potencial de reintrodução na economia dos materiais recuperados.',
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
                                SvgPicture.asset(
                                  'assets/svgs/arrow_down.svg',
                                  color: AppColors.blue,
                                ),
                                const SizedBox(height: 40),
                                Text(
                                  'Onde coloco a minha embalagem?',
                                  style: AppTextStyles.h2,
                                ),
                                const SizedBox(height: 40),
                                ElevatedButton(
                                  onPressed: () => AutoRouter.of(context).push(
                                    const CategoriesScreenRoute(),
                                  ),
                                  child: const Text('Vamos lá!'),
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
            SizedBox(
              width: 800,
              child: Ink(
                color: AppColors.grey4,
                child: OverflowBox(
                  maxWidth: 1100,
                  child: Image.asset(
                    'assets/images/consumer_intro.png',
                    width: 1100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
