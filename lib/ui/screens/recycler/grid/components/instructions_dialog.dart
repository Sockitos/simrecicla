import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/ui/widgets/app_dialog.dart';

class InstructionsDialog extends StatelessWidget {
  const InstructionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 30,
          ),
          children: [
            Text(
              'Instructions',
              textAlign: TextAlign.center,
              style: AppTextStyles.h2(context.layout),
            ),
            SizedBox(height: AppSpacings.small(context.layout)),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _Instruction(
                          index: 1,
                          text:
                              'O circuito de reciclagem será criado em forma de grelha - cada quadrado representa uma máquina.',
                        ),
                        Divider(
                          color: AppColors.grey4,
                          height: 4,
                          thickness: 2,
                        ),
                        _Instruction(
                          index: 2,
                          text:
                              'Para acrescentar a máquina ao seu circuito, arraste para a grelha o icon quadrado referente à máquina que pretende adicionar.',
                        ),
                        Divider(
                          color: AppColors.grey4,
                          height: 4,
                          thickness: 2,
                        ),
                        _Instruction(
                          index: 3,
                          text:
                              'Escolha a orientação da máquina que lhe convém para o seu circuito.',
                        ),
                        Divider(
                          color: AppColors.grey4,
                          height: 4,
                          thickness: 2,
                        ),
                        _Instruction(
                          index: 4,
                          text:
                              'O quadrado vazio para dentro representa um input e os quadrados para fora representam outputs. Pode ver a legenda de cada máquina clicando no +.',
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: AppColors.grey4,
                    width: 80,
                    thickness: 2,
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        _Instruction(
                          index: 5,
                          text:
                              'Um circuito só é válido quando todas as saídas estiverem fechadas com “produtos finais”.',
                        ),
                        Divider(
                          color: AppColors.grey4,
                          height: 4,
                          thickness: 2,
                        ),
                        _Instruction(
                          index: 6,
                          text:
                              'Clique nas “Opções de Entrada” para costumizar os materiais a entrar no circuito.',
                        ),
                        Divider(
                          color: AppColors.grey4,
                          height: 4,
                          thickness: 2,
                        ),
                        _Instruction(
                          index: 7,
                          text:
                              'Depois do circuito estar válido (icons passam a verde), pode clicar em cada máquina para ver detalhadamente os materiais a entrar e sair.',
                        ),
                        Divider(
                          color: AppColors.grey4,
                          height: 4,
                          thickness: 2,
                        ),
                        _Instruction(
                          index: 8,
                          text:
                              'Se pretender eliminar uma máquina que já esteja colocado na grelha, basta arrastá-la para o “caixote do lixo”.',
                        ),
                        Divider(
                          color: AppColors.grey4,
                          height: 4,
                          thickness: 2,
                        ),
                        _Instruction(
                          index: 9,
                          text:
                              'Clicar em “Ver resultados” para ver a composição de cada produto final e eficiência global da linha.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
    //this.illustration,
  });
  final int index;
  final String text;
  //final Widget? illustration;

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
        ],
      ),
    );
  }
}
