// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/machine.dart';
import 'package:simtech/src/ui/screens/recycler/components/draggable_machine.dart';
import 'package:simtech/src/ui/screens/recycler/components/machine_list.dart';
import 'package:simtech/src/ui/screens/recycler/grid_screen_notifier.dart';
import 'package:simtech/src/ui/widgets/my_drag_target.dart';
import 'package:simtech/src/ui/widgets/screen_wrapper.dart';

class GridScreen extends ConsumerWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gridScreenSNProvider);
    log('${state.connections}');
    return ScreenWrapper(
      backgroundColor: AppColors.grey4,
      padding: EdgeInsets.zero,
      body: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: 750,
              child: MachineList(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 55.0 * state.grid.xSize,
                    height: 55.0 * state.grid.ySize,
                    child: Stack(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.white,
                              width: 2,
                            ),
                          ),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: state.grid.xSize,
                            ),
                            itemBuilder: (context, _) => DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white),
                              ),
                            ),
                            itemCount: state.grid.xSize * state.grid.ySize,
                          ),
                        ),
                        GridView.builder(
                          clipBehavior: Clip.none,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: state.grid.xSize,
                          ),
                          itemBuilder: (context, index) {
                            final x = index % state.grid.ySize;
                            final y = index ~/ state.grid.xSize;
                            final cell = state.grid.getCell(x, y);
                            return MyDragTarget<Machine>(
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
                                if (cell == null) {
                                  return const SizedBox();
                                } else {
                                  return DraggableMachine(
                                    machine: cell,
                                    size: const Size(55, 55),
                                    portSize: const Size(13, 9),
                                    isInGrid: true,
                                  );
                                }
                              },
                            );
                          },
                          itemCount: state.grid.ySize * state.grid.xSize,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  MyDragTarget<Machine>(
                    onWillAccept: (_) => true,
                    onAccept: (data) {
                      final notifier = ref.read(gridScreenSNProvider.notifier);
                      notifier.removeMachine(data);
                    },
                    builder: (context, _, __) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.lightGreen,
                        onSurface: AppColors.grey7,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        minimumSize: const Size(0, 62),
                        maximumSize: const Size(double.maxFinite, 62),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        textStyle: AppTextStyles.button(context.layout),
                      ),
                      onPressed: state.connections.values.contains(null)
                          ? null
                          : () {},
                      child: const Text('Correr Simulação'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
