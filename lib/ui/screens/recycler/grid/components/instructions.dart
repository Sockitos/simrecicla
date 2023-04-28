import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/gen/assets.gen.dart';
import 'package:simrecicla/ui/widgets/app_dialog.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ListView(
          shrinkWrap: true,
          padding: AppSpacings.dialogPadding(context.layout) +
              EdgeInsets.symmetric(
                horizontal: context.layout.value(
                  xs: 5,
                  md: 10,
                ),
              ),
          children: [
            Text(
              'Instruções',
              textAlign: TextAlign.center,
              style: AppTextStyles.h2(context.layout),
            ),
            SizedBox(height: AppSpacings.small(context.layout)),
            if (context.layout.breakpoint > LayoutBreakpoint.sm)
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _Instruction(
                            index: 1,
                            text:
                                'O circuito de reciclagem será criado em forma de grelha - cada quadrado representa uma máquina.',
                            illustration: Assets.svgs.instructions1.svg(),
                          ),
                          const Divider(
                            color: AppColors.grey4,
                            height: 4,
                            thickness: 2,
                          ),
                          _Instruction(
                            index: 2,
                            text:
                                'Para acrescentar a máquina ao seu circuito, arraste para a grelha o icon quadrado referente à máquina que pretende adicionar.',
                            illustration: Assets.svgs.instructions2.svg(),
                          ),
                          const Divider(
                            color: AppColors.grey4,
                            height: 4,
                            thickness: 2,
                          ),
                          _Instruction(
                            index: 3,
                            text:
                                'Escolha a orientação da máquina que lhe convém para o seu circuito.',
                            illustration: Assets.svgs.instructions3.svg(),
                          ),
                          const Divider(
                            color: AppColors.grey4,
                            height: 4,
                            thickness: 2,
                          ),
                          _Instruction(
                            index: 4,
                            text:
                                'O quadrado vazio para dentro representa um input e os quadrados para fora representam outputs. Pode ver a legenda de cada máquina clicando no +.',
                            illustration: Assets.svgs.instructions4.svg(),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: AppColors.grey4,
                      width: context.layout.value(xs: 60, md: 80),
                      thickness: 2,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _Instruction(
                            index: 5,
                            text:
                                'Um circuito só é válido quando todas as saídas estiverem fechadas com “produtos finais”.',
                            illustration: Assets.svgs.instructions5.svg(),
                          ),
                          const Divider(
                            color: AppColors.grey4,
                            height: 4,
                            thickness: 2,
                          ),
                          _Instruction(
                            index: 6,
                            text:
                                'Clique nas “Opções de Entrada” para costumizar os materiais a entrar no circuito.',
                            illustration: Assets.svgs.instructions6.svg(),
                          ),
                          const Divider(
                            color: AppColors.grey4,
                            height: 4,
                            thickness: 2,
                          ),
                          _Instruction(
                            index: 7,
                            text:
                                'Depois do circuito estar válido (icons passam a verde), pode clicar em cada máquina para ver detalhadamente os materiais a entrar e sair.',
                            illustration: Assets.svgs.instructions7.svg(),
                          ),
                          const Divider(
                            color: AppColors.grey4,
                            height: 4,
                            thickness: 2,
                          ),
                          _Instruction(
                            index: 8,
                            text:
                                'Se pretender eliminar uma máquina que já esteja colocado na grelha, basta arrastá-la para o “caixote do lixo”.',
                            illustration: Assets.svgs.instructions8.svg(),
                          ),
                          const Divider(
                            color: AppColors.grey4,
                            height: 4,
                            thickness: 2,
                          ),
                          _Instruction(
                            index: 9,
                            text:
                                'Clicar em “Ver resultados” para ver a composição de cada produto final e eficiência global da linha.',
                            illustration: Assets.svgs.instructions9.svg(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              _Instruction(
                index: 1,
                text:
                    'O circuito de reciclagem será criado em forma de grelha - cada quadrado representa uma máquina.',
                illustration: Assets.svgs.instructions1.svg(),
              ),
              const Divider(
                color: AppColors.grey4,
                height: 8,
                thickness: 2,
              ),
              _Instruction(
                index: 2,
                text:
                    'Para acrescentar a máquina ao seu circuito, arraste para a grelha o icon quadrado referente à máquina que pretende adicionar.',
                illustration: Assets.svgs.instructions2.svg(),
              ),
              const Divider(
                color: AppColors.grey4,
                height: 8,
                thickness: 2,
              ),
              _Instruction(
                index: 3,
                text:
                    'Escolha a orientação da máquina que lhe convém para o seu circuito.',
                illustration: Assets.svgs.instructions3.svg(),
              ),
              const Divider(
                color: AppColors.grey4,
                height: 8,
                thickness: 2,
              ),
              _Instruction(
                index: 4,
                text:
                    'O quadrado vazio para dentro representa um input e os quadrados para fora representam outputs. Pode ver a legenda de cada máquina clicando no +.',
                illustration: Assets.svgs.instructions4.svg(),
              ),
              const Divider(
                color: AppColors.grey4,
                height: 8,
                thickness: 2,
              ),
              _Instruction(
                index: 5,
                text:
                    'Um circuito só é válido quando todas as saídas estiverem fechadas com “produtos finais”.',
                illustration: Assets.svgs.instructions5.svg(),
              ),
              const Divider(
                color: AppColors.grey4,
                height: 8,
                thickness: 2,
              ),
              _Instruction(
                index: 6,
                text:
                    'Clique nas “Opções de Entrada” para costumizar os materiais a entrar no circuito.',
                illustration: Assets.svgs.instructions6.svg(),
              ),
              const Divider(
                color: AppColors.grey4,
                height: 8,
                thickness: 2,
              ),
              _Instruction(
                index: 7,
                text:
                    'Depois do circuito estar válido (icons passam a verde), pode clicar em cada máquina para ver detalhadamente os materiais a entrar e sair.',
                illustration: Assets.svgs.instructions7.svg(),
              ),
              const Divider(
                color: AppColors.grey4,
                height: 8,
                thickness: 2,
              ),
              _Instruction(
                index: 8,
                text:
                    'Se pretender eliminar uma máquina que já esteja colocado na grelha, basta arrastá-la para o “caixote do lixo”.',
                illustration: Assets.svgs.instructions8.svg(),
              ),
              const Divider(
                color: AppColors.grey4,
                height: 8,
                thickness: 2,
              ),
              _Instruction(
                index: 9,
                text:
                    'Clicar em “Ver resultados” para ver a composição de cada produto final e eficiência global da linha.',
                illustration: Assets.svgs.instructions9.svg(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Instruction extends StatelessWidget {
  const _Instruction({
    required this.index,
    required this.text,
    required this.illustration,
  });
  final int index;
  final String text;
  final Widget illustration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodyM(context.layout),
                children: [
                  TextSpan(
                    text: '$index. ',
                    style: const TextStyle(
                      color: AppColors.lightGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: text),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 100,
            child: illustration,
          ),
        ],
      ),
    );
  }
}
