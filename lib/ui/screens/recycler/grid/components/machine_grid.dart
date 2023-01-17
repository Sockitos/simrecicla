import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/machines_icons.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/models/recycler/machine.dart';
import 'package:simrecicla/models/recycler/material_sample.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/draggable_machine.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/feed_options.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/machine_io_info.dart';
import 'package:simrecicla/ui/screens/recycler/grid/grid_screen_model.dart';

class MachineGrid extends ConsumerWidget {
  const MachineGrid({super.key});

  static Size machineSize(LayoutData layout) => layout.value(
        xs: const Size(28, 28),
        sm: const Size(40, 40),
        md: const Size(50, 50),
      );

  static Size portSize(LayoutData layout) => layout.value(
        xs: const Size(9, 5),
        sm: const Size(11, 7),
        md: const Size(13, 9),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateProvider = gridScreenSNProvider;
    final state = ref.watch(stateProvider);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            SizedBox(
              width: machineSize(context.layout).width * state.grid.xSize,
              height: machineSize(context.layout).height * state.grid.ySize,
              child: Stack(
                children: [
                  Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: machineSize(context.layout).height,
                        ),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: state.grid.xSize,
                          ),
                          itemBuilder: (context, _) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white),
                              ),
                            );
                          },
                          itemCount: state.grid.xSize * (state.grid.ySize - 1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: machineSize(context.layout).height,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        clipBehavior: Clip.none,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: state.grid.xSize,
                        ),
                        itemBuilder: (context, index) {
                          final x = index % (state.grid.ySize - 1);
                          final y = index ~/ state.grid.xSize;
                          final cell = state.grid.getCell(x, y);
                          return DragTarget<Machine>(
                            onWillAccept: (newCell) {
                              if (newCell == null) return false;
                              if (cell != null) return false;
                              for (final d in AxisDirection.values) {
                                final otherCell =
                                    state.grid.getCellFromDirection(x, y, d);
                                if (!newCell.isCompatible(d, otherCell)) {
                                  return false;
                                }
                              }
                              return true;
                            },
                            onAccept: (data) {
                              final notifier =
                                  ref.read(gridScreenSNProvider.notifier);
                              notifier.setMachine(x, y, machine: data);
                            },
                            builder: (context, machines, _) {
                              final cell = state.grid.getCell(x, y);
                              if (cell == null) return const SizedBox();
                              final machineState =
                                  state.getMachineState(cell.id0);
                              return InkResponse(
                                radius: machineSize(context.layout).height / 2,
                                onTap: machineState == MachineState.validated &&
                                        cell.id != 'feed'
                                    ? () => showDialog<void>(
                                          barrierColor: const Color(0x00ffffff),
                                          useRootNavigator: false,
                                          context: context,
                                          builder: (context) => MachineIOInfo(
                                            input:
                                                state.graph.inputs[cell.id0] ??
                                                    const MaterialSample(),
                                            machine: cell,
                                          ),
                                        )
                                    : null,
                                child: DraggableMachine(
                                  machine: cell,
                                  size: machineSize(context.layout),
                                  portSize: portSize(context.layout),
                                  isInGrid: true,
                                  state: machineState,
                                ),
                              );
                            },
                          );
                        },
                        itemCount: state.grid.xSize * state.grid.ySize,
                      ),
                    ],
                  ),
                  Positioned(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: machineSize(context.layout).width,
                          height: machineSize(context.layout).height,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 5),
                              IconButton(
                                onPressed: () => showDialog<void>(
                                  barrierColor: const Color(0x00ffffff),
                                  useRootNavigator: false,
                                  context: context,
                                  builder: (context) => FeedOptions(
                                    useDefault: state.useDefaultFeed,
                                    feedWeight: state.feedWeight,
                                    feedSample: state.feedSample,
                                    defaultWeight: state.defaultWeight,
                                    defaultSample: state.defaultSample,
                                    onConfirm: (useDefault, weight, sample) =>
                                        ref
                                            .read(stateProvider.notifier)
                                            .setFeedOptions(
                                              useDefault: useDefault,
                                              weight: weight,
                                              sample: sample,
                                            ),
                                  ),
                                ),
                                color: AppColors.lightGreen,
                                icon: const Icon(
                                  Icons.add_circle_outline_rounded,
                                ),
                                splashRadius: 24,
                                constraints: const BoxConstraints(),
                                padding: const EdgeInsets.all(2),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Opções de Entrada',
                                style: AppTextStyles.bodyM(context.layout),
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
            Expanded(
              child: context.layout.breakpoint > LayoutBreakpoint.sm
                  ? Align(
                      alignment: Alignment.bottomLeft,
                      child: DragTarget<Machine>(
                        onWillAccept: (_) => true,
                        onAccept: ref
                            .read(gridScreenSNProvider.notifier)
                            .removeMachine,
                        builder: (context, candidates, _) {
                          return Icon(
                            MachinesIcons.lixo,
                            size: 64,
                            color:
                                candidates.isEmpty ? null : AppColors.ratingF,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        if (context.layout.breakpoint < LayoutBreakpoint.md)
          DragTarget<Machine>(
            onWillAccept: (_) => true,
            onAccept: ref.read(gridScreenSNProvider.notifier).removeMachine,
            builder: (context, candidates, _) {
              return Icon(
                MachinesIcons.lixo,
                size: 44,
                color: candidates.isEmpty ? null : AppColors.ratingF,
              );
            },
          ),
      ],
    );
  }
}
