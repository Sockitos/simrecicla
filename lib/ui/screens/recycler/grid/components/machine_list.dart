import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/spacings.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/recycler/machine_definition.dart';
import 'package:simtech/ui/screens/recycler/grid/components/instructions.dart';
import 'package:simtech/ui/screens/recycler/grid/components/machine_list_option.dart';
import 'package:simtech/ui/widgets/app_card.dart';
import 'package:simtech/ui/widgets/app_scrollbar.dart';

class MachineList extends HookWidget {
  const MachineList({
    super.key,
    required this.machines,
    this.onShowOptions,
    this.centerOptionsInGrid = false,
    this.onClose,
  });

  final List<MachineDefinition> machines;
  final VoidCallback? onShowOptions;
  final bool centerOptionsInGrid;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: AppScrollbar(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 12,
        ),
        scrollbarOrientation: ScrollbarOrientation.left,
        child: AppCard(
          child: Stack(
            children: [
              ListView(
                controller: scrollController,
                padding: AppSpacings.dialogPadding(context.layout) +
                    EdgeInsets.symmetric(
                      horizontal: context.layout.value(
                        xs: 15,
                        sm: 25,
                        md: 30,
                      ),
                    ),
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
                                builder: (_) => const Instructions(),
                              );
                            },
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                  for (final m in machines)
                    MachineListOption(
                      machine: m,
                      onShowOptions: onShowOptions,
                      centerOptionsInGrid: centerOptionsInGrid,
                    ),
                ],
              ),
              if (onClose != null)
                Positioned(
                  right: 15,
                  top: 15,
                  child: IconButton(
                    onPressed: onClose,
                    iconSize: 40,
                    color: AppColors.lightGreen,
                    icon: const Icon(Icons.close_outlined),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
