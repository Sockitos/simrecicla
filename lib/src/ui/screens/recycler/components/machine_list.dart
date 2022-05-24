import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/services/recycler_service.dart';
import 'package:simtech/src/ui/screens/recycler/components/machine_list_option.dart';
import 'package:simtech/src/ui/widgets/my_scrollbar.dart';

class MachineList extends HookWidget {
  const MachineList({super.key});

  @override
  Widget build(BuildContext context) {
    final machines = RecyclerService.getMachines();
    final scrollController = useScrollController();
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 70),
          child: Ink(color: AppColors.grey1),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Text(
                'Criar uma linha de triagem?',
                textAlign: TextAlign.left,
                style: AppTextStyles.h2(context.layout)
                    .copyWith(color: AppColors.lightGreen),
              ),
              const SizedBox(height: 30),
              MyScrollbar(
                controller: scrollController,
                thumbColor: AppColors.lightGreen,
                radius: const Radius.circular(5),
                thickness: 8,
                crossAxisMargin: 12,
                mainAxisMargin: 30,
                isAlwaysShown: true,
                scrollbarOrientation: ScrollbarOrientation.left,
                child: Ink(
                  height: 750,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(34),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 3),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(60, 25, 60, 25),
                      children: [
                        RichText(
                          text: TextSpan(
                            style: AppTextStyles.paragraph(context.layout),
                            children: const [
                              TextSpan(
                                text:
                                    'Arraste os icons referentes a cada máquina para a grelha. Com cada máquina e passadeira, vai construindo a sua linha de triagem. Se tiver dúvidas, consulte as ',
                              ),
                              TextSpan(
                                text: 'instruções',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        for (final m in machines) MachineListOption(machine: m),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 80, 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    iconSize: 40,
                    splashRadius: 24,
                    color: AppColors.lightGreen,
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
