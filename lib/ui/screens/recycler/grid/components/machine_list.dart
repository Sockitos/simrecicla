import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/recycler/machine_definition.dart';
import 'package:simtech/ui/screens/recycler/grid/components/instructions_dialog.dart';
import 'package:simtech/ui/screens/recycler/grid/components/machine_list_option.dart';
import 'package:simtech/ui/widgets/app_card.dart';
import 'package:simtech/ui/widgets/app_scrollbar.dart';

class MachineList extends HookWidget {
  const MachineList({
    super.key,
    required this.machines,
  });

  final List<MachineDefinition> machines;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return AppScrollbar(
      controller: scrollController,
      scrollbarOrientation: ScrollbarOrientation.left,
      child: AppCard(
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(60, 25, 60, 25),
          children: [
            RichText(
              text: TextSpan(
                style: AppTextStyles.bodyL(context.layout),
                children: [
                  const TextSpan(
                    text:
                        'Arraste os ícones referentes a cada máquina para a grelha. Com cada máquina e passadeira, vai construindo a sua linha de triagem. Se tiver dúvidas, consulte as ',
                  ),
                  TextSpan(
                    text: 'instruções',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showDialog<void>(
                          context: context,
                          barrierColor: AppColors.blackShadow,
                          builder: (_) => const InstructionsDialog(),
                        );
                      },
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
            for (final m in machines) MachineListOption(machine: m),
          ],
        ),
      ),
    );
  }
}
