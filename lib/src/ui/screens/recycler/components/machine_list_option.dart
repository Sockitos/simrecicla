import 'package:circular_widgets/circular_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/constants/text_styles.dart';
import 'package:simtech/src/models/machine_definition.dart';
import 'package:simtech/src/ui/screens/recycler/components/draggable_machine.dart';

class MachineListOption extends HookWidget {
  const MachineListOption({
    super.key,
    required this.machine,
  });

  final MachineDefinition machine;

  static final openOptions = <OverlayEntry>[];

  void _showOptions(BuildContext context) {
    OverlayEntry? entry;

    void removeEntry() {
      try {
        entry?.remove();
        openOptions.clear();
        // ignore: empty_catches
      } catch (e) {}
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

        return Stack(
          children: [
            Listener(
              behavior: HitTestBehavior.translucent,
              onPointerSignal: (pointerSignal) {
                if (pointerSignal is PointerScrollEvent) {
                  removeEntry();
                }
              },
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (_) {
                  removeEntry();
                },
              ),
            ),
            Positioned(
              left: position.right - 60,
              top: position.top + size.height / 2 - 145,
              child: Center(
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
                                color: Colors.black12,
                                offset: Offset(0, 3),
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: Center(
                            child: HookBuilder(
                              builder: (context) {
                                final machines =
                                    useState(machine.getMachineVersions());
                                return CircularWidgets(
                                  radiusOfItem: 55,
                                  centerWidgetRadius: 50,
                                  innerSpacing: 40,
                                  centerWidgetBuilder: (context) => IconButton(
                                    iconSize: 36,
                                    color: AppColors.lightGreen,
                                    onPressed: () {
                                      machines.value = machines.value
                                          .map((m) => m.rotate())
                                          .toList();
                                    },
                                    icon:
                                        const Icon(Icons.rotate_right_rounded),
                                  ),
                                  itemBuilder: (context, index) {
                                    final machine = machines.value[index];
                                    return DraggableMachine(
                                      machine: machine,
                                      size: const Size(44, 44),
                                      portSize: const Size(11, 7),
                                      draggingSize: const Size(55, 55),
                                      draggingPortSize: const Size(13, 9),
                                    );
                                  },
                                  itemsLength: machines.value.length,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    for (final e in openOptions) {
      e.remove();
    }
    openOptions.clear();
    Overlay.of(context)?.insert(entry);
    openOptions.add(entry);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                Text(
                  machine.name,
                  style: AppTextStyles.h5(context.layout),
                ),
                const Spacer(),
                SizedBox(
                  height: 55,
                  width: 55,
                  child: InkResponse(
                    radius: 45,
                    onTapDown: (details) {},
                    onTap: () {
                      _showOptions(context);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        machine.icon,
                        size: 30,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 60),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
