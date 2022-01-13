import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MouseRegion extends StatefulWidget {
  const MouseRegion({
    Key? key,
    this.onEnter,
    this.onExit,
    this.onHover,
    this.cursor = MouseCursor.defer,
    this.opaque = true,
    this.child,
  }) : super(key: key);

  final PointerEnterEventListener? onEnter;

  final PointerHoverEventListener? onHover;

  final PointerExitEventListener? onExit;

  final MouseCursor cursor;

  final bool opaque;

  final Widget? child;

  @override
  State<MouseRegion> createState() => _MouseRegionState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final listeners = <String>[];
    if (onEnter != null) listeners.add('enter');
    if (onExit != null) listeners.add('exit');
    if (onHover != null) listeners.add('hover');
    properties.add(
      IterableProperty<String>('listeners', listeners, ifEmpty: '<none>'),
    );
    properties.add(
      DiagnosticsProperty<MouseCursor>('cursor', cursor, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<bool>('opaque', opaque, defaultValue: true),
    );
  }
}

class _MouseRegionState extends State<MouseRegion> {
  void handleExit(PointerExitEvent event) {
    if (widget.onExit != null && mounted) widget.onExit!(event);
  }

  PointerExitEventListener? getHandleExit() {
    return widget.onExit == null ? null : handleExit;
  }

  @override
  Widget build(BuildContext context) {
    return _RawMouseRegion(this);
  }
}

class _RawMouseRegion extends SingleChildRenderObjectWidget {
  _RawMouseRegion(this.owner) : super(child: owner.widget.child);

  final _MouseRegionState owner;

  @override
  RenderMouseRegion createRenderObject(BuildContext context) {
    final widget = owner.widget;
    return RenderMouseRegion(
      onEnter: widget.onEnter,
      onHover: widget.onHover,
      onExit: owner.getHandleExit(),
      cursor: widget.cursor,
      opaque: widget.opaque,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderMouseRegion renderObject,
  ) {
    final widget = owner.widget;
    renderObject
      ..onEnter = widget.onEnter
      ..onHover = widget.onHover
      ..onExit = owner.getHandleExit()
      ..cursor = widget.cursor
      ..opaque = widget.opaque;
  }
}

class RenderMouseRegion extends RenderProxyBox
    implements MouseTrackerAnnotation {
  RenderMouseRegion({
    this.onEnter,
    this.onHover,
    this.onExit,
    MouseCursor cursor = MouseCursor.defer,
    bool validForMouseTracker = true,
    bool opaque = true,
    RenderBox? child,
  })  : _cursor = cursor,
        _validForMouseTracker = validForMouseTracker,
        _opaque = opaque,
        super(child);

  // @protected
  // @override
  // bool hitTestSelf(Offset position) => false;

  // @override
  // bool hitTest(BoxHitTestResult result, {required Offset position}) {
  //   log('${super.hitTest(result, position: position) && _opaque}');
  //   return super.hitTest(result, position: position) && _opaque;
  // }

  @override
  void handleEvent(PointerEvent event, HitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (onHover != null && event is PointerHoverEvent) return onHover!(event);
  }

  bool get opaque => _opaque;
  bool _opaque;
  set opaque(bool value) {
    if (_opaque != value) {
      _opaque = value;
      // Trigger [MouseTracker]'s device update to recalculate mouse states.
      markNeedsPaint();
    }
  }

  @override
  PointerEnterEventListener? onEnter;

  PointerHoverEventListener? onHover;

  @override
  PointerExitEventListener? onExit;

  @override
  MouseCursor get cursor => _cursor;
  MouseCursor _cursor;
  set cursor(MouseCursor value) {
    if (_cursor != value) {
      _cursor = value;
      // A repaint is needed in order to trigger a device update of
      // [MouseTracker] so that this new value can be found.
      markNeedsPaint();
    }
  }

  @override
  bool get validForMouseTracker => _validForMouseTracker;
  bool _validForMouseTracker;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _validForMouseTracker = true;
  }

  @override
  void detach() {
    // It's possible that the renderObject be detached during mouse events
    // dispatching, set the [MouseTrackerAnnotation.validForMouseTracker] false to prevent
    // the callbacks from being called.
    _validForMouseTracker = false;
    super.detach();
  }

  @override
  Size computeSizeForNoChild(BoxConstraints constraints) {
    return constraints.biggest;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      FlagsSummary<Function?>(
        'listeners',
        <String, Function?>{
          'enter': onEnter,
          'hover': onHover,
          'exit': onExit,
        },
        ifEmpty: '<none>',
      ),
    );
    properties.add(
      DiagnosticsProperty<MouseCursor>(
        'cursor',
        cursor,
        defaultValue: MouseCursor.defer,
      ),
    );
    properties
        .add(DiagnosticsProperty<bool>('opaque', opaque, defaultValue: true));
    properties.add(
      FlagProperty(
        'validForMouseTracker',
        value: validForMouseTracker,
        defaultValue: true,
        ifFalse: 'invalid for MouseTracker',
      ),
    );
  }
}
