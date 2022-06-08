import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/ui/screens/recycler/components/feed_options.dart';
import 'package:simtech/ui/screens/recycler/components/machine_grid.dart';
import 'package:simtech/ui/screens/recycler/components/machine_io_info.dart';
import 'package:simtech/ui/screens/recycler/components/machine_list.dart';
import 'package:simtech/ui/screens/recycler/grid_screen_notifier.dart';
import 'package:simtech/ui/widgets/screen_wrapper.dart';

import 'components/results.dart';

class GridScreen extends ConsumerWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gridScreenSNProvider);
    return ScreenWrapper(
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
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!state.showResults)
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
                                    .copyWith(color: AppColors.lightGreen),
                              ),
                              const SizedBox(height: 50),
                              if (!state.showResults)
                                const Expanded(child: MachineList()),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MachineGrid(),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.lightGreen,
                              onSurface: AppColors.grey7,
                            ),
                            onPressed: state.graph.isValidated
                                ? () {
                                    final notifier =
                                        ref.read(gridScreenSNProvider.notifier);
                                    notifier.showResults();
                                  }
                                : null,
                            child: const Text('Ver Resultados'),
                          ),
                        ],
                      ),
                      if (state.showFeedOptions) ...[
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final notifier =
                                ref.read(gridScreenSNProvider.notifier);
                            notifier.hideFeedOptions();
                          },
                        ),
                        const Center(child: FeedOptions()),
                      ],
                      if (state.machineIOInfo != null) ...[
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final notifier =
                                ref.read(gridScreenSNProvider.notifier);
                            notifier.hideMachineIOInfo();
                          },
                        ),
                        const Center(child: MachineIOInfo()),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            if (state.showResults) ...[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  final notifier = ref.read(gridScreenSNProvider.notifier);
                  notifier.hideResults();
                },
              ),
              const Center(child: Results()),
            ],
          ],
        ),
      ),
    );
  }
}
