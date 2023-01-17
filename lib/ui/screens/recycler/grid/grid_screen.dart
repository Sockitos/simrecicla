import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/spacings.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/data/recycler_data.dart';
import 'package:simrecicla/models/recycler/machine_definition.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/machine_grid.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/machine_list.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/results.dart';
import 'package:simrecicla/ui/screens/recycler/grid/grid_screen_model.dart';
import 'package:simrecicla/ui/widgets/app_screen.dart';

final typeProvider = Provider<GridType>((ref) => throw UnimplementedError());

final machinesProvider = Provider<List<MachineDefinition>>(
  (ref) {
    final type = ref.watch(typeProvider);
    switch (type) {
      case GridType.pc:
        return RecyclerData.machinesPC;
      case GridType.pm:
        return RecyclerData.machinesPM;
    }
  },
  dependencies: [typeProvider],
);

enum GridType { pc, pm }

class GridScreen extends ConsumerWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateProvider = gridScreenSNProvider;
    final machines = ref.watch(machinesProvider);
    return AppScreen(
      backgroundColor: AppColors.grey4,
      padding: EdgeInsets.zero,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: max(
            MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom -
                60,
            context.layout.value(
              xs: 680,
              sm: 800,
              md: 1000,
            ),
          ),
          minHeight: context.layout.value(
            xs: 680,
            sm: 800,
            md: 1000,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (context.breakpoint > LayoutBreakpoint.md)
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 800,
                  minWidth: 650,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      context.layout.value(xs: 0.4, xl: 0.4),
                  child: Stack(
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
                            SizedBox(height: AppSpacings.big(context.layout)),
                            Text(
                              'Criar uma linha de triagem?',
                              textAlign: TextAlign.left,
                              style: AppTextStyles.h2(context.layout)
                                  .withColor(AppColors.lightGreen),
                            ),
                            SizedBox(height: AppSpacings.small(context.layout)),
                            Expanded(child: MachineList(machines: machines)),
                            SizedBox(height: AppSpacings.big(context.layout)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
              child: Navigator(
                key: const ValueKey('recycler_grid'),
                onGenerateRoute: (_) => MaterialPageRoute<void>(
                  builder: (context) {
                    return HookBuilder(
                      builder: (context) {
                        final showList = useState(false);
                        return Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const MachineGrid(),
                                const SizedBox(height: 50),
                                Consumer(
                                  builder: (context, ref, _) {
                                    final isValidated = ref.watch(
                                      stateProvider
                                          .select((s) => s.graph.isValidated),
                                    );
                                    return ElevatedButton(
                                      onPressed: isValidated
                                          ? () {
                                              final state =
                                                  ref.read(stateProvider);
                                              showDialog<void>(
                                                barrierColor:
                                                    const Color(0x00ffffff),
                                                useRootNavigator: false,
                                                context: context,
                                                builder: (context) => Results(
                                                  products:
                                                      state.graph.products,
                                                  feed: state.feedSample
                                                      .mulAll(state.feedWeight),
                                                  product: state.graph
                                                      .calculateProduct(),
                                                ),
                                              );
                                            }
                                          : null,
                                      child: const Text('Ver Resultados'),
                                    );
                                  },
                                ),
                              ],
                            ),
                            if (context.breakpoint <= LayoutBreakpoint.md) ...[
                              Positioned(
                                top: 20,
                                child: Padding(
                                  padding: AppSpacings.screenPadding(
                                        context.layout,
                                      ) -
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: IconButton(
                                    onPressed: () => showList.value = true,
                                    icon: const Icon(
                                      Icons.menu_open_outlined,
                                      color: AppColors.lightGreen,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedAlign(
                                duration: const Duration(milliseconds: 200),
                                alignment: Alignment.centerRight,
                                widthFactor: showList.value ? 1 : 0,
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 600,
                                    maxWidth: 600,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: MachineList(
                                      machines: machines,
                                      onShowOptions: () =>
                                          showList.value = false,
                                      centerOptionsInGrid: true,
                                      onClose: () => showList.value = false,
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
