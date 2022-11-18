import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/data/recycler_data.dart';
import 'package:simtech/models/recycler/machine_definition.dart';
import 'package:simtech/ui/screens/recycler/grid/components/machine_grid.dart';
import 'package:simtech/ui/screens/recycler/grid/components/machine_list.dart';
import 'package:simtech/ui/screens/recycler/grid/components/results.dart';
import 'package:simtech/ui/screens/recycler/grid/grid_screen_model.dart';
import 'package:simtech/ui/widgets/app_screen.dart';

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
            850,
          ),
          minHeight: 850,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 750,
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
                        const SizedBox(height: 50),
                        Text(
                          'Criar uma linha de triagem?',
                          textAlign: TextAlign.left,
                          style: AppTextStyles.h2(context.layout)
                              .withColor(AppColors.lightGreen),
                        ),
                        const SizedBox(height: 50),
                        Expanded(child: MachineList(machines: machines)),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Navigator(
                key: const ValueKey('recycler_grid'),
                onGenerateRoute: (settings) => MaterialPageRoute<void>(
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MachineGrid(),
                      const SizedBox(height: 50),
                      Consumer(
                        builder: (context, ref, _) {
                          final isValidated = ref.watch(
                            stateProvider.select((s) => s.graph.isValidated),
                          );
                          return ElevatedButton(
                            onPressed: isValidated
                                ? () {
                                    final state = ref.read(stateProvider);
                                    showDialog<void>(
                                      barrierColor: const Color(0x00ffffff),
                                      useRootNavigator: false,
                                      context: context,
                                      builder: (context) => Results(
                                        products: state.graph.products,
                                        feed: state.feedSample
                                            .mulAll(state.feedWeight),
                                        product: state.graph.calculateProduct(),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
