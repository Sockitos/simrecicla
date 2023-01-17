import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/gen/assets.gen.dart';
import 'package:simrecicla/ui/widgets/app_screen.dart';
import 'package:simrecicla/ui/widgets/arrow.dart';

class ConsumerScreen extends StatelessWidget {
  const ConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      padding: EdgeInsets.zero,
      body: AdaptiveBuilder(
        xs: (context) => const _ConsumerIntro(),
        md: (context) => IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: _ConsumerIntro()),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 9,
                          child: Ink(color: AppColors.grey4),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: -40,
                      right: -60,
                      child: Assets.images.consumerIntro.image(
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConsumerIntro extends StatelessWidget {
  const _ConsumerIntro();

  @override
  Widget build(BuildContext context) {
    final textAlign = context.breakpoint < LayoutBreakpoint.md
        ? TextAlign.center
        : TextAlign.start;
    return Padding(
      padding: AppSpacings.screenPadding(context.layout),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppSpacings.big(context.layout)),
          Text(
            'Quero saber como reciclar uma embalagem',
            style: AppTextStyles.h1(context.layout),
            textAlign: textAlign,
          ),
          SizedBox(height: AppSpacings.small(context.layout)),
          Text(
            'Este simulador permite ao cidadão perceber o impacte das suas práticas de separação e encaminhamento das embalagens, e quantificar as consequências das suas ações tendo em conta as soluções de tratamento disponíveis, os processos a que os resíduos serão sujeitos e o potencial de reintrodução na economia dos materiais recuperados.',
            style: AppTextStyles.bodyL(context.layout),
            textAlign: textAlign,
          ),
          SizedBox(height: AppSpacings.big(context.layout)),
          Align(
            alignment: context.breakpoint < LayoutBreakpoint.md
                ? Alignment.center
                : Alignment.centerLeft,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: context.layout.value<double>(
                      xs: 300,
                      lg: 360,
                    ),
                    width: context.layout.value<double>(
                      xs: 300,
                      lg: 360,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.grey3.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Arrow(
                      size: Size(44, 80),
                      color: AppColors.blue,
                      direction: AxisDirection.down,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Onde coloco a minha embalagem?',
                      style: AppTextStyles.h2(context.layout),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () => context.go('/consumer/categories'),
                      child: const Text('Vamos lá!'),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: AppSpacings.big(context.layout)),
        ],
      ),
    );
  }
}
