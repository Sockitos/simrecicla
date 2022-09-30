import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/data/recycler_data.dart';
import 'package:simtech/router/router.gr.dart';
import 'package:simtech/ui/widgets/arrow_widget.dart';
import 'package:simtech/ui/widgets/screen_wrapper.dart';

class RecyclerScreen extends StatelessWidget {
  const RecyclerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      padding: EdgeInsets.zero,
      body: AdaptiveBuilder(
        xs: (context) => const _RecyclerIntro(),
        md: (context) => IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: _RecyclerIntro()),
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
                        'assets/images/recycler_intro.png',
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

class _RecyclerIntro extends StatelessWidget {
  const _RecyclerIntro();

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
            'Criar e optimizar uma linha de triagem',
            style: AppTextStyles.h1(context.layout),
            textAlign: textAlign,
          ),
          SizedBox(height: AppSpacings.small(context.layout)),
          Text(
            'Este simulador permite ao utilizador desenhar uma linha de triagem através da escolha um conjunto de equipamentos e avaliar as eficiências de recuperação de materiais de embalagem, inerentes às diferentes sequências dos equipamentos mais usados nestas instalações.',
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
                      color: AppColors.darkGreen,
                      direction: AxisDirection.down,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Quero criar uma linha de triagem',
                      style: AppTextStyles.h2(context.layout),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () => AutoRouter.of(context).push(
                        GridScreenRoute(
                          machines: machinesPC,
                          defaultWeight: defaultWeight,
                          defaultSample: defaultSamplePC,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                      ),
                      child: const Text('Papel e Cartão'),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () => AutoRouter.of(context).push(
                        GridScreenRoute(
                          machines: machinesPM,
                          defaultWeight: defaultWeight,
                          defaultSample: defaultSamplePM,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellow,
                      ),
                      child: const Text('Plástico e Metal'),
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
