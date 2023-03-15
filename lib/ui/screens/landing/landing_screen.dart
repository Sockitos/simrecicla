import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/gen/assets.gen.dart';
import 'package:simrecicla/ui/screens/landing/components/landing_option.dart';
import 'package:simrecicla/ui/widgets/app_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
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
                          child: Assets.svgs.circles.svg(),
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
              Assets.svgs.logo.svg(
                height: context.layout.value(xs: 36, sm: 48, lg: 64, xl: 72),
              ),
              SizedBox(
                height: context.layout.value(
                  xs: 15,
                  sm: 20,
                  lg: 30,
                ),
              ),
              Assets.svgs.waves.svg(),
              SizedBox(height: AppSpacings.small(context.layout)),
              SizedBox(
                width: 859,
                child: Text(
                  'O projeto SimRecicla surge do desafio de promover a economia circular, a descarbonização da gestão de resíduos e o uso eficiente dos recursos, através do desenvolvimento e da disponibilização de simuladores precisos, baseados na caracterização detalhada dos processos e tecnologias de produção, processamento e reciclagem de resíduos de embalagens.\nExperimenta os três simuladores!',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyL(context.layout),
                ),
              ),
              SizedBox(height: AppSpacings.big(context.layout)),
              AdaptiveBuilder(
                xs: (context) => Center(
                  child: Column(
                    children: [
                      LandingOption(
                        svg: Assets.svgs.consumerOption.path,
                        description: 'Onde coloco a minha embalagem',
                        tooltip:
                            'Permite calcular o impacte das práticas de separação e encaminhamento dos resíduos de embalagens',
                        onPressed: () => context.go('/consumer'),
                      ),
                      const SizedBox(height: 60),
                      LandingOption(
                        svg: Assets.svgs.packagerOption.path,
                        description:
                            'Quero melhorar a reciclabilidade de uma embalagem',
                        tooltip:
                            'Permite perceber o impacte das opções de produção, materiais e componentes adotados',
                        onPressed: () => context.go('/packager'),
                      ),
                      const SizedBox(height: 60),
                      LandingOption(
                        svg: Assets.svgs.recyclerOption.path,
                        description: 'Quero optimizar uma linha de triagem',
                        tooltip:
                            'Calcula a recuperação de materiais numa linha de triagem de embalagens, de acordo com a sequenciação de diferentes operações e equipamentos',
                        onPressed: () => context.go('/recycler'),
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
                        xs: 30,
                        lg: 80,
                      ),
                    ),
                    Flexible(
                      child: LandingOption(
                        svg: Assets.svgs.consumerOption.path,
                        description: 'Onde coloco a minha embalagem',
                        tooltip:
                            'Permite calcular o impacte das práticas de separação e encaminhamento dos resíduos de embalagens',
                        onPressed: () => context.go('/consumer'),
                      ),
                    ),
                    SizedBox(
                      width: context.layout.value(
                        xs: 30,
                        lg: 80,
                      ),
                    ),
                    Flexible(
                      child: LandingOption(
                        svg: Assets.svgs.packagerOption.path,
                        description:
                            'Quero melhorar a reciclabilidade de uma embalagem',
                        tooltip:
                            'Permite perceber o impacte das opções de produção, materiais e componentes adotados',
                        onPressed: () => context.go('/packager'),
                      ),
                    ),
                    SizedBox(
                      width: context.layout.value(
                        xs: 30,
                        lg: 80,
                      ),
                    ),
                    Flexible(
                      child: LandingOption(
                        svg: Assets.svgs.recyclerOption.path,
                        description: 'Quero optimizar uma linha de triagem',
                        tooltip:
                            'Calcula a recuperação de materiais numa linha de triagem de embalagens, de acordo com a sequenciação de diferentes operações e equipamentos',
                        onPressed: () => context.go('/recycler'),
                      ),
                    ),
                    SizedBox(
                      width: context.layout.value(
                        xs: 30,
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
