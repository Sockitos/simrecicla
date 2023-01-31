import 'package:circular_widgets/circular_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/constants/colors.dart';
import 'package:simrecicla/constants/machines_icons.dart';
import 'package:simrecicla/constants/text_styles.dart';
import 'package:simrecicla/models/recycler/machine_definition.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/draggable_machine.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/machine_grid.dart';
import 'package:simrecicla/ui/screens/recycler/grid/components/output_indicator.dart';
import 'package:simrecicla/ui/widgets/popup_info.dart';

class MachineListOption extends HookWidget {
  const MachineListOption({
    super.key,
    required this.machine,
    this.onShowOptions,
    this.centerOptionsInGrid = false,
  });

  final MachineDefinition machine;
  final VoidCallback? onShowOptions;
  final bool centerOptionsInGrid;

  static final openOptions = <OverlayEntry>[];

  void _showOptions(BuildContext context) {
    onShowOptions?.call();

    OverlayEntry? entry;

    void removeEntry() {
      entry?.remove();
      openOptions.clear();
    }

    entry = OverlayEntry(
      builder: (_) {
        final overlay = Navigator.of(context)
            .overlay!
            .context
            .findRenderObject()! as RenderBox;

        final box = context.findRenderObject()! as RenderBox;
        final size = box.size;
        final topLeft =
            size.topLeft(box.localToGlobal(Offset.zero, ancestor: overlay));
        final bottomRight =
            size.bottomRight(box.localToGlobal(Offset.zero, ancestor: overlay));
        final position = Rect.fromLTRB(
          topLeft.dx,
          topLeft.dy,
          bottomRight.dx,
          bottomRight.dy,
        );

        return HookBuilder(
          builder: (context) {
            final isBeingDragged = useState(false);
            final machines = useState(
              machine.getMachineVersions(),
            );
            final options = isBeingDragged.value
                ? const SizedBox.shrink()
                : Center(
                    child: Material(
                      type: MaterialType.transparency,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Listener(
                            behavior: HitTestBehavior.opaque,
                            onPointerSignal: (pointerSignal) {
                              if (pointerSignal is PointerScrollEvent) {
                                removeEntry();
                              }
                            },
                            child: Ink(
                              height: 250,
                              width: 250,
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.blackShadow,
                                    offset: Offset(0, 3),
                                    blurRadius: 20,
                                  )
                                ],
                              ),
                              child: Center(
                                child: CircularWidgets(
                                  config: const CircularWidgetConfig(
                                    itemRadius: 25,
                                    centerWidgetRadius: 25,
                                    innerSpacing: 20,
                                  ),
                                  centerWidgetBuilder: (context) => IconButton(
                                    iconSize: 36,
                                    color: AppColors.lightGreen,
                                    onPressed: () {
                                      machines.value = machines.value
                                          .map((m) => m.rotate())
                                          .toList();
                                    },
                                    icon: const Icon(MachinesIcons.rotacao),
                                  ),
                                  itemBuilder: (context, index) {
                                    final machine = machines.value[index];
                                    return DraggableMachine(
                                      machine: machine,
                                      size: const Size(44, 44),
                                      portSize: const Size(11, 7),
                                      draggingSize: MachineGrid.machineSize(
                                        context.layout,
                                      ),
                                      draggingPortSize:
                                          MachineGrid.portSize(context.layout),
                                      onDragStart: () =>
                                          isBeingDragged.value = true,
                                      onDragEnd: () =>
                                          isBeingDragged.value = false,
                                    );
                                  },
                                  itemsLength: machines.value.length,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
            return Stack(
              children: [
                Listener(
                  behavior: HitTestBehavior.translucent,
                  onPointerDown: (_) => removeEntry(),
                  onPointerSignal: (pointerSignal) {
                    if (pointerSignal is PointerScrollEvent) {
                      removeEntry();
                    }
                  },
                ),
                if (centerOptionsInGrid)
                  options
                else
                  Positioned(
                    left: position.right,
                    top: position.top + size.height / 2 - 145,
                    child: options,
                  ),
              ],
            );
          },
        );
      },
    );
    for (final e in openOptions) {
      e.remove();
    }
    openOptions.clear();
    Overlay.of(context).insert(entry);
    openOptions.add(entry);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.layout.value(xs: 80, sm: 100),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  machine.name,
                  style: AppTextStyles.h5(context.layout),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () {
                            final button =
                                context.findRenderObject()! as RenderBox;
                            final overlay = Navigator.of(context)
                                .overlay!
                                .context
                                .findRenderObject()! as RenderBox;
                            final offset = Offset(
                              button.size.width + 5,
                              0,
                            );

                            final position = RelativeRect.fromRect(
                              Rect.fromPoints(
                                button.localToGlobal(offset, ancestor: overlay),
                                button.localToGlobal(
                                  button.size.bottomRight(Offset.zero) + offset,
                                  ancestor: overlay,
                                ),
                              ),
                              Offset.zero & overlay.size,
                            );

                            showInfo(
                              context: context,
                              position: position,
                              constraints: const BoxConstraints.tightFor(
                                width: 400,
                              ),
                              child: DefaultTextStyle(
                                style: context.layout.value(
                                  xs: AppTextStyles.bodyM(context.layout),
                                  lg: AppTextStyles.bodyL(context.layout),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 25,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        machine.description,
                                      ),
                                      if (machine.outputs.isNotEmpty) ...[
                                        const SizedBox(height: 15),
                                        const Text(
                                          'Outputs:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        for (final o in machine.outputs) ...[
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              OutputIndicator(
                                                output: o,
                                                width: 16,
                                                height: 16,
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Text(o.description),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ],
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          color: AppColors.lightGreen,
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                          ),
                          splashRadius: 24,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          SizedBox(
            height: 50,
            width: 50,
            child: InkResponse(
              radius: 45,
              onTap: () => _showOptions(context),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Icon(
                  machine.icon,
                  size: 42,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
