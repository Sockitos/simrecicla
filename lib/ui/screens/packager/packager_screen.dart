import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/router/router.gr.dart';
import 'package:simtech/ui/widgets/arrow_widget.dart';
import 'package:simtech/ui/widgets/screen_wrapper.dart';

class PackagerScreen extends StatelessWidget {
  const PackagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      padding: EdgeInsets.zero,
      body: AdaptiveBuilder(
        xs: (context) => const _PackagerIntro(),
        md: (context) => IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: _PackagerIntro()),
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
                      right: 60,
                      child: Image.asset(
                        'assets/images/packager_intro.png',
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

class _PackagerIntro extends StatelessWidget {
  const _PackagerIntro();

  @override
  Widget build(BuildContext context) {
    final textAlign = context.breakpoint < LayoutBreakpoint.md
        ? TextAlign.center
        : TextAlign.start;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacings.big(context.layout),
        vertical: AppSpacings.big(context.layout),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Melhorar a reciclabilidade de uma embalagem',
            style: AppTextStyles.h1(context.layout),
            textAlign: textAlign,
          ),
          SizedBox(height: AppSpacings.small(context.layout)),
          Text(
            'Venha descobrir como melhorar a reciclabilidade das suas embalagens através de um conjunto de questões que avaliam parâmetros de design e conceção, e de recomendações para as opções de conceção que possam ser menos favoráveis para a reciclabilidade. Este simulador determina também o impacte ou benefício ambiental das suas embalagens, tendo em conta o resultado de reciclabilidade (A-totalmente reciclável a F-não reciclável), a possibilidade de recuperação dos materiais para reciclagem e o teor de material reciclado utilizado na embalagem.',
            style: AppTextStyles.paragraph(context.layout),
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
                    const ArrowWidget(
                      size: Size(44, 80),
                      color: AppColors.yellow,
                      direction: AxisDirection.down,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Quero testar a minha embalagem',
                      style: AppTextStyles.h2(context.layout),
                      textAlign: TextAlign.center,
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
        ],
      ),
    );
  }
}