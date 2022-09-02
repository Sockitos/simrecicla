import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/constants/machines_icons.dart';
import 'package:simtech/constants/text_styles.dart';
import 'package:simtech/models/machine.dart';
import 'package:simtech/ui/screens/recycler/components/draggable_machine.dart';
import 'package:simtech/ui/screens/recycler/grid_screen_notifier.dart';
import 'package:simtech/ui/widgets/my_drag_target.dart';

class MachineGrid extends ConsumerWidget {
  const MachineGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gridScreenSNProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        SizedBox(
          width: 50.0 * state.grid.xSize,
          height: 50.0 * state.grid.ySize,
          child: Stack(
            children: [
              Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    padding: const EdgeInsets.only(top: 50),
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
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.grid.xSize,
                    ),
                    itemBuilder: (context, index) {
                      final x = index % (state.grid.ySize - 1);
                      final y = index ~/ state.grid.xSize;
                      final cell = state.grid.getCell(x, y);
                      return MyDragTarget<Machine>(
                        onWillAccept: (newCell) {
                          if (newCell == null) return false;
                          if (cell != null) return false;
                          for (final d in AxisDirection.values) {
                            final otherCell =
                                state.grid.getCellFromDirection(x, y, d);
                            if (!newCell.isCompatible(
                              d,
                              otherCell,
                            )) {
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
                          if (cell == null) {
                            return const SizedBox();
                          } else {
                            var machineState = MachineState.disconnected;
                            if (state.graph.graph.vertices.contains(cell.id0)) {
                              machineState = state.graph.isValidated
                                  ? MachineState.validated
                                  : MachineState.connected;
                            }

                            return InkResponse(
                              radius: 25,
                              onTap: machineState == MachineState.validated &&
                                      cell.id != 'feed'
                                  ? () {
                                      final notifier = ref
                                          .read(gridScreenSNProvider.notifier);
                                      notifier.showMachineIOInfo(cell.id0);
                                    }
                                  : null,
                              child: DraggableMachine(
                                machine: cell,
                                size: const Size(50, 50),
                                portSize: const Size(13, 9),
                                isInGrid: true,
                                state: machineState,
                              ),
                            );
                          }
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
                    const SizedBox(width: 50, height: 50),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 5),
                          IconButton(
                            onPressed: () {
                              final notifier =
                                  ref.read(gridScreenSNProvider.notifier);
                              notifier.showFeedOptions();
                            },
                            color: AppColors.lightGreen,
                            icon: const Icon(
                              Icons.add_circle_outline_rounded,
                            ),
                            splashRadius: 24,
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                          ),
                          Text(
                            'Opções de Entrada',
                            style: AppTextStyles.dropdown(
                              context.layout,
                            ),
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
          child: Align(
            alignment: Alignment.bottomLeft,
            child: MyDragTarget<Machine>(
              onWillAccept: (_) => true,
              onAccept: (data) {
                final notifier = ref.read(gridScreenSNProvider.notifier);
                notifier.removeMachine(data);
              },
              builder: (context, candidates, _) {
                return Icon(
                  MachinesIcons.lixo,
                  size: 64,
                  color: candidates.isEmpty ? null : AppColors.ratingF,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
