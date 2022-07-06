import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/machine_definition.dart';
import 'package:simtech/ui/screens/recycler/components/instructions_dialog.dart';
import 'package:simtech/ui/screens/recycler/components/machine_list_option.dart';
import 'package:simtech/ui/widgets/my_card.dart';
import 'package:simtech/ui/widgets/my_scrollbar.dart';

class MachineList extends HookWidget {
  const MachineList({
    super.key,
    required this.machines,
  });

  final List<MachineDefinition> machines;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return MyScrollbar(
      controller: scrollController,
      thumbColor: AppColors.lightGreen,
      radius: const Radius.circular(5),
      thickness: 8,
      crossAxisMargin: 12,
      mainAxisMargin: 30,
      isAlwaysShown: true,
      scrollbarOrientation: ScrollbarOrientation.left,
      child: MyCard(
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(60, 25, 60, 25),
          children: [
            RichText(
              text: TextSpan(
                style: AppTextStyles.paragraph(context.layout),
                children: [
                  const TextSpan(
                    text:
                        'Arraste os icons referentes a cada máquina para a grelha. Com cada máquina e passadeira, vai construindo a sua linha de triagem. Se tiver dúvidas, consulte as ',
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
                          barrierColor: Colors.black12,
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
