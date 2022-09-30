import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/machine_definition.dart';
import 'package:simtech/models/material_sample.dart';
import 'package:simtech/ui/screens/recycler/components/feed_options.dart';
import 'package:simtech/ui/screens/recycler/components/machine_grid.dart';
import 'package:simtech/ui/screens/recycler/components/machine_io_info.dart';
import 'package:simtech/ui/screens/recycler/components/machine_list.dart';
import 'package:simtech/ui/screens/recycler/grid_screen_notifier.dart';
import 'package:simtech/ui/widgets/screen_wrapper.dart';

import 'components/results.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({
    super.key,
    required this.machines,
    required this.defaultWeight,
    required this.defaultSample,
  });

  final List<MachineDefinition> machines;
  final double defaultWeight;
  final MaterialSample defaultSample;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        gridScreenSNProvider.overrideWithValue(
          GridScreenNotifier(
            feedWeight: defaultWeight,
            feedSample: defaultSample,
          ),
        ),
      ],
      child: Consumer(
        builder: (context, ref, child) {
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 50),
                                    Text(
                                      'Criar uma linha de triagem?',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyles.h2(context.layout)
                                          .copyWith(
                                        color: AppColors.lightGreen,
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    if (!state.showResults)
                                      Expanded(
                                        child: MachineList(machines: machines),
                                      ),
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
                                  onPressed: state.graph.isValidated
                                      ? () {
                                          final notifier = ref.read(
                                            gridScreenSNProvider.notifier,
                                          );
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
                        final notifier =
                            ref.read(gridScreenSNProvider.notifier);
                        notifier.hideResults();
                      },
                    ),
                    const Center(child: Results()),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
