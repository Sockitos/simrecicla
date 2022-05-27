import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/spacings.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/router/router.gr.dart';
import 'package:simtech/src/ui/screens/landing/components/landing_option.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: -200,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 1100,
                  maxWidth: 1100,
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: OverflowBox(
                    minWidth: 1100,
                    maxWidth: 1100,
                    minHeight: 1100,
                    maxHeight: 1100,
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.grey3.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          top: 250,
                          right: -40,
                          child: SvgPicture.asset(
                            'assets/svgs/circles.svg',
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: AppSpacings.big(context.layout)),
              Text(
                'Circular SimTech',
                textAlign: TextAlign.center,
                style: AppTextStyles.h1(context.layout),
              ),
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/svgs/waves.svg',
                color: AppColors.darkGreen,
              ),
              SizedBox(height: AppSpacings.small(context.layout)),
              SizedBox(
                width: 859,
                child: Text(
                  'O projeto Circular SimTech surge do desafio de promover a economia circular, a descarbonização da gestão de resíduos e o uso eficiente dos recursos, através do desenvolvimento e da disponibilização de simuladores precisos, baseados na caracterização detalhada dos processos e tecnologias de produção, processamento e reciclagem de resíduos de embalagens.\nExperimenta os três simuladores!',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.paragraph(context.layout),
                ),
              ),
              SizedBox(height: AppSpacings.big(context.layout)),
              AdaptiveBuilder(
                xs: (context) => Center(
                  child: Column(
                    children: [
                      LandingOption(
                        svg: 'assets/svgs/consumer_option.svg',
                        description: 'Onde coloco a minha embalagem',
                        tooltip:
                            'Permite calcular o impacte das práticas de separação e encaminhamento dos resíduos de embalagens',
                        onPressed: () => AutoRouter.of(context).push(
                          const ConsumerScreenRoute(),
                        ),
                      ),
                      const SizedBox(height: 60),
                      LandingOption(
                        svg: 'assets/svgs/packager_option.svg',
                        description:
                            'Quero melhorar a reciclabilidade de uma embalagem',
                        tooltip:
                            'Permite perceber o impacte das opções de produção, materiais e componentes adotados',
                        onPressed: () => AutoRouter.of(context).push(
                          const PackagerScreenRoute(),
                        ),
                      ),
                      const SizedBox(height: 60),
                      LandingOption(
                        svg: 'assets/svgs/recycler_option.svg',
                        description: 'Quero optimizar uma linha de triagem',
                        tooltip:
                            'Permite otimizar os resultados uma linha de triagem de embalagens, de acordo com a sequenciação de diferentes operações e equipamentos',
                        onPressed: () => AutoRouter.of(context).push(
                          const RecyclerScreenRoute(),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                md: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.layout.value(
                        xs: 40,
                        lg: 80,
                      ),
                    ),
                    Flexible(
                      child: LandingOption(
                        svg: 'assets/svgs/consumer_option.svg',
                        description: 'Onde coloco a minha embalagem',
                        tooltip:
                            'Permite calcular o impacte das práticas de separação e encaminhamento dos resíduos de embalagens',
                        onPressed: () => AutoRouter.of(context).push(
                          const ConsumerScreenRoute(),
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
                        svg: 'assets/svgs/packager_option.svg',
                        description:
                            'Quero melhorar a reciclabilidade de uma embalagem',
                        tooltip:
                            'Permite perceber o impacte das opções de produção, materiais e componentes adotados',
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
                        tooltip:
                            'Permite calcular o impacte das práticas de separação e encaminhamento dos resíduos de embalagens',
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
              SizedBox(height: AppSpacings.big(context.layout)),
            ],
          ),
        ],
      ),
    );
  }
}
