// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: deprecated_member_use_from_same_package, avoid_private_typedef_functions, prefer_asserts_with_message

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart'
    show
        BuildContext,
        IgnorePointer,
        Listener,
        MetaData,
        MouseRegion,
        Overlay,
        OverlayEntry,
        OverlayState,
        Positioned,
        State,
        StatefulWidget,
        Widget,
        WidgetsBinding,
        protected;

typedef DragTargetWillAccept<T> = bool Function(T? data);

typedef DragTargetAccept<T> = void Function(T data);

typedef DragTargetAcceptWithDetails<T> = void Function(
  MyDragTargetDetails<T> details,
);

typedef DragTargetBuilder<T> = Widget Function(
  BuildContext context,
  List<T?> candidateData,
  List<dynamic> rejectedData,
);

typedef DragUpdateCallback = void Function(DragUpdateDetails details);

typedef DraggableCanceledCallback = void Function(
  Velocity velocity,
  Offset offset,
);

typedef DragEndCallback = void Function(MyDraggableDetails details);

typedef DragTargetLeave<T> = void Function(T? data);

typedef DragTargetMove<T> = void Function(MyDragTargetDetails<T> details);

typedef DragAnchorStrategy = Offset Function(
  MyDraggable<Object> draggable,
  BuildContext context,
  Offset position,
);

Offset childDragAnchorStrategy(
  MyDraggable<Object> draggable,
  BuildContext context,
  Offset position,
) {
  final renderObject = context.findRenderObject()! as RenderBox;
  return renderObject.globalToLocal(position);
}

Offset pointerDragAnchorStrategy(
  MyDraggable<Object> draggable,
  BuildContext context,
  Offset position,
) {
  return Offset.zero;
}

@Deprecated(
  'Use dragAnchorStrategy instead. '
  'This feature was deprecated after v2.1.0-10.0.pre.',
)
enum MyDragAnchor {
  @Deprecated(
    'Use childDragAnchorStrategy instead. '
    'This feature was deprecated after v2.1.0-10.0.pre.',
  )
  child,

  @Deprecated(
    'Use pointerDragAnchorStrategy instead. '
    'This feature was deprecated after v2.1.0-10.0.pre.',
  )
  pointer,
}

class MyDraggable<T extends Object> extends StatefulWidget {
  const MyDraggable({
    super.key,
    required this.child,
    required this.feedback,
    this.data,
    this.axis,
    this.childWhenDragging,
    this.feedbackOffset = Offset.zero,
    @Deprecated(
      'Use dragAnchorStrategy instead. '
      'Replace "dragAnchor: DragAnchor.child" with "dragAnchorStrategy: childDragAnchorStrategy". '
      'Replace "dragAnchor: DragAnchor.pointer" with "dragAnchorStrategy: pointerDragAnchorStrategy". '
      'This feature was deprecated after v2.1.0-10.0.pre.',
    )
        this.dragAnchor = MyDragAnchor.child,
    this.dragAnchorStrategy,
    this.affinity,
    this.maxSimultaneousDrags,
    this.onDragStarted,
    this.onDragUpdate,
    this.onDraggableCanceled,
    this.onDragEnd,
    this.onDragCompleted,
    this.ignoringFeedbackSemantics = true,
    this.rootOverlay = false,
    this.hitTestBehavior = HitTestBehavior.deferToChild,
  }) : assert(maxSimultaneousDrags == null || maxSimultaneousDrags >= 0);

  final T? data;

  final Axis? axis;

  final Widget child;

  final Widget? childWhenDragging;

  final Widget feedback;

  final Offset feedbackOffset;

  @Deprecated(
    'Use dragAnchorStrategy instead. '
    'This feature was deprecated after v2.1.0-10.0.pre.',
  )
  final MyDragAnchor dragAnchor;

  final DragAnchorStrategy? dragAnchorStrategy;

  final bool ignoringFeedbackSemantics;

  final Axis? affinity;

  final int? maxSimultaneousDrags;

  final VoidCallback? onDragStarted;

  final DragUpdateCallback? onDragUpdate;

  final DraggableCanceledCallback? onDraggableCanceled;

  final VoidCallback? onDragCompleted;

  final DragEndCallback? onDragEnd;

  final bool rootOverlay;

  final HitTestBehavior hitTestBehavior;

  @protected
  MultiDragGestureRecognizer createRecognizer(
    GestureMultiDragStartCallback onStart,
  ) {
    switch (affinity) {
      case Axis.horizontal:
        return HorizontalMultiDragGestureRecognizer()..onStart = onStart;
      case Axis.vertical:
        return VerticalMultiDragGestureRecognizer()..onStart = onStart;
      case null:
        return ImmediateMultiDragGestureRecognizer()..onStart = onStart;
    }
  }

  @override
  State<MyDraggable<T>> createState() => _DraggableState<T>();
}

class _DraggableState<T extends Object> extends State<MyDraggable<T>> {
  @override
  void initState() {
    super.initState();
    _recognizer = widget.createRecognizer(_startDrag);
  }

  @override
  void dispose() {
    _disposeRecognizerIfInactive();
    super.dispose();
  }

  // This gesture recognizer has an unusual lifetime. We want to support the use
  // case of removing the Draggable from the tree in the middle of a drag. That
  // means we need to keep this recognizer alive after this state object has
  // been disposed because it's the one listening to the pointer events that are
  // driving the drag.
  //
  // We achieve that by keeping count of the number of active drags and only
  // disposing the gesture recognizer after (a) this state object has been
  // disposed and (b) there are no more active drags.
  GestureRecognizer? _recognizer;
  int _activeCount = 0;

  void _disposeRecognizerIfInactive() {
    if (_activeCount > 0) return;
    _recognizer!.dispose();
    _recognizer = null;
  }

  void _routePointer(PointerDownEvent event) {
    if (widget.maxSimultaneousDrags != null &&
        _activeCount >= widget.maxSimultaneousDrags!) return;
    _recognizer!.addPointer(event);
  }

  _DragAvatar<T>? _startDrag(Offset position) {
    if (widget.maxSimultaneousDrags != null &&
        _activeCount >= widget.maxSimultaneousDrags!) return null;
    final Offset dragStartPoint;
    if (widget.dragAnchorStrategy == null) {
      switch (widget.dragAnchor) {
        case MyDragAnchor.child:
          dragStartPoint = childDragAnchorStrategy(widget, context, position);
          break;
        case MyDragAnchor.pointer:
          dragStartPoint = pointerDragAnchorStrategy(widget, context, position);
          break;
      }
    } else {
      dragStartPoint = widget.dragAnchorStrategy!(widget, context, position);
    }
    setState(() {
      _activeCount += 1;
    });
    final avatar = _DragAvatar<T>(
      overlayState: Overlay.of(
        context,
        debugRequiredFor: widget,
        rootOverlay: widget.rootOverlay,
      )!,
      data: widget.data,
      axis: widget.axis,
      initialPosition: position,
      dragStartPoint: dragStartPoint,
      feedback: widget.feedback,
      feedbackOffset: widget.feedbackOffset,
      ignoringFeedbackSemantics: widget.ignoringFeedbackSemantics,
      onDragUpdate: (details) {
        if (mounted && widget.onDragUpdate != null) {
          widget.onDragUpdate!(details);
        }
      },
      onDragEnd: (velocity, offset, wasAccepted) {
        if (mounted) {
          setState(() {
            _activeCount -= 1;
          });
        } else {
          _activeCount -= 1;
          _disposeRecognizerIfInactive();
        }
        if (mounted && widget.onDragEnd != null) {
          widget.onDragEnd!(
            MyDraggableDetails(
              wasAccepted: wasAccepted,
              velocity: velocity,
              offset: offset,
            ),
          );
        }
        if (wasAccepted && widget.onDragCompleted != null) {
          widget.onDragCompleted!();
        }
        if (!wasAccepted && widget.onDraggableCanceled != null) {
          widget.onDraggableCanceled!(velocity, offset);
        }
      },
    );
    widget.onDragStarted?.call();
    return avatar;
  }

  @override
  Widget build(BuildContext context) {
    assert(
      Overlay.of(
            context,
            debugRequiredFor: widget,
            rootOverlay: widget.rootOverlay,
          ) !=
          null,
    );
    final canDrag = widget.maxSimultaneousDrags == null ||
        _activeCount < widget.maxSimultaneousDrags!;
    final showChild = _activeCount == 0 || widget.childWhenDragging == null;
    return Listener(
      behavior: widget.hitTestBehavior,
      onPointerDown: canDrag ? _routePointer : null,
      child: showChild
          ? MouseRegion(cursor: SystemMouseCursors.grab, child: widget.child)
          : widget.childWhenDragging,
    );
  }
}

class MyDraggableDetails {
  MyDraggableDetails({
    this.wasAccepted = false,
    required this.velocity,
    required this.offset,
  });

  final bool wasAccepted;

  final Velocity velocity;

  final Offset offset;
}

class MyDragTargetDetails<T> {
  MyDragTargetDetails({required this.data, required this.offset});

  final T data;

  final Offset offset;
}

class MyDragTarget<T extends Object> extends StatefulWidget {
  const MyDragTarget({
    super.key,
    required this.builder,
    this.onWillAccept,
    this.onAccept,
    this.onAcceptWithDetails,
    this.onLeave,
    this.onMove,
    this.hitTestBehavior = HitTestBehavior.translucent,
  });

  final DragTargetBuilder<T> builder;

  final DragTargetWillAccept<T>? onWillAccept;

  final DragTargetAccept<T>? onAccept;

  final DragTargetAcceptWithDetails<T>? onAcceptWithDetails;

  final DragTargetLeave<T>? onLeave;

  final DragTargetMove<T>? onMove;

  final HitTestBehavior hitTestBehavior;

  @override
  State<MyDragTarget<T>> createState() => _DragTargetState<T>();
}

List<T?> _mapAvatarsToData<T extends Object>(
  List<_DragAvatar<Object>> avatars,
) {
  return avatars.map<T?>((avatar) => avatar.data as T?).toList();
}

class _DragTargetState<T extends Object> extends State<MyDragTarget<T>> {
  final List<_DragAvatar<Object>> _candidateAvatars = <_DragAvatar<Object>>[];
  final List<_DragAvatar<Object>> _rejectedAvatars = <_DragAvatar<Object>>[];

  // On non-web platforms, checks if data Object is equal to type[T] or subtype of [T].
  // On web, it does the same, but requires a check for ints and doubles
  // because dart doubles and ints are backed by the same kind of object on web.
  // JavaScript does not support integers.
  bool isExpectedDataType(Object? data, Type type) {
    if (kIsWeb &&
        ((type == int && T == double) || (type == double && T == int))) {
      return false;
    }
    return data is T?;
  }

  bool didEnter(_DragAvatar<Object> avatar) {
    assert(!_candidateAvatars.contains(avatar));
    assert(!_rejectedAvatars.contains(avatar));
    if (widget.onWillAccept == null ||
        widget.onWillAccept!(avatar.data as T?)) {
      setState(() {
        _candidateAvatars.add(avatar);
      });
      return true;
    } else {
      setState(() {
        _rejectedAvatars.add(avatar);
      });
      return false;
    }
  }

  void didLeave(_DragAvatar<Object> avatar) {
    assert(
      _candidateAvatars.contains(avatar) || _rejectedAvatars.contains(avatar),
    );
    if (!mounted) return;
    setState(() {
      _candidateAvatars.remove(avatar);
      _rejectedAvatars.remove(avatar);
    });
    widget.onLeave?.call(avatar.data as T?);
  }

  void didDrop(_DragAvatar<Object> avatar) {
    assert(_candidateAvatars.contains(avatar));
    if (!mounted) return;
    setState(() {
      _candidateAvatars.remove(avatar);
    });
    widget.onAccept?.call(avatar.data! as T);
    widget.onAcceptWithDetails?.call(
      MyDragTargetDetails<T>(
        data: avatar.data! as T,
        offset: avatar._lastOffset!,
      ),
    );
  }

  void didMove(_DragAvatar<Object> avatar) {
    if (!mounted) return;
    widget.onMove?.call(
      MyDragTargetDetails<T>(
        data: avatar.data! as T,
        offset: avatar._lastOffset!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MetaData(
      metaData: this,
      behavior: widget.hitTestBehavior,
      child: widget.builder(
        context,
        _mapAvatarsToData<T>(_candidateAvatars),
        _mapAvatarsToData<Object>(_rejectedAvatars),
      ),
    );
  }
}

enum _DragEndKind { dropped, canceled }

typedef _OnDragEnd = void Function(
  Velocity velocity,
  Offset offset,
  bool wasAccepted,
);

// The lifetime of this object is a little dubious right now. Specifically, it
// lives as long as the pointer is down. Arguably it should self-immolate if the
// overlay goes away. _DraggableState has some delicate logic to continue
// needing this object pointer events even after it has been disposed.
class _DragAvatar<T extends Object> extends Drag {
  _DragAvatar({
    required this.overlayState,
    this.data,
    this.axis,
    required Offset initialPosition,
    this.dragStartPoint = Offset.zero,
    this.feedback,
    this.feedbackOffset = Offset.zero,
    this.onDragUpdate,
    this.onDragEnd,
    required this.ignoringFeedbackSemantics,
  }) : _position = initialPosition {
    _entry = OverlayEntry(builder: _build);
    overlayState.insert(_entry!);
    updateDrag(initialPosition);
  }

  final T? data;
  final Axis? axis;
  final Offset dragStartPoint;
  final Widget? feedback;
  final Offset feedbackOffset;
  final DragUpdateCallback? onDragUpdate;
  final _OnDragEnd? onDragEnd;
  final OverlayState overlayState;
  final bool ignoringFeedbackSemantics;

  _DragTargetState<Object>? _activeTarget;
  final List<_DragTargetState<Object>> _enteredTargets =
      <_DragTargetState<Object>>[];
  Offset _position;
  Offset? _lastOffset;
  OverlayEntry? _entry;

  @override
  void update(DragUpdateDetails details) {
    final oldPosition = _position;
    _position += _restrictAxis(details.delta);
    updateDrag(_position);
    if (onDragUpdate != null && _position != oldPosition) {
      onDragUpdate!(details);
    }
  }

  @override
  void end(DragEndDetails details) {
    finishDrag(_DragEndKind.dropped, _restrictVelocityAxis(details.velocity));
  }

  @override
  void cancel() {
    finishDrag(_DragEndKind.canceled);
  }

  void updateDrag(Offset globalPosition) {
    _lastOffset = globalPosition - dragStartPoint;
    _entry!.markNeedsBuild();
    final result = HitTestResult();
    WidgetsBinding.instance.hitTest(result, globalPosition + feedbackOffset);

    final targets = _getDragTargets(result.path).toList();

    var listsMatch = false;
    if (targets.length >= _enteredTargets.length &&
        _enteredTargets.isNotEmpty) {
      listsMatch = true;
      final iterator = targets.iterator;
      for (var i = 0; i < _enteredTargets.length; i += 1) {
        iterator.moveNext();
        if (iterator.current != _enteredTargets[i]) {
          listsMatch = false;
          break;
        }
      }
    }

    // If everything's the same, report moves, and bail early.
    if (listsMatch) {
      for (final target in _enteredTargets) {
        target.didMove(this);
      }
      return;
    }

    // Leave old targets.
    _leaveAllEntered();

    // Enter new targets.
    final newTarget = targets.cast<_DragTargetState<Object>?>().firstWhere(
      (target) {
        if (target == null) return false;
        _enteredTargets.add(target);
        return target.didEnter(this);
      },
      orElse: () => null,
    );

    // Report moves to the targets.
    for (final target in _enteredTargets) {
      target.didMove(this);
    }

    _activeTarget = newTarget;
  }

  Iterable<_DragTargetState<Object>> _getDragTargets(
    Iterable<HitTestEntry> path,
  ) sync* {
    // Look for the RenderBoxes that corresponds to the hit target (the hit target
    // widgets build RenderMetaData boxes for us for this purpose).
    for (final entry in path) {
      final target = entry.target;
      if (target is RenderMetaData) {
        final dynamic metaData = target.metaData;
        if (metaData is _DragTargetState &&
            metaData.isExpectedDataType(data, T)) yield metaData;
      }
    }
  }

  void _leaveAllEntered() {
    for (var i = 0; i < _enteredTargets.length; i += 1) {
      _enteredTargets[i].didLeave(this);
    }
    _enteredTargets.clear();
  }

  void finishDrag(_DragEndKind endKind, [Velocity? velocity]) {
    var wasAccepted = false;
    if (endKind == _DragEndKind.dropped && _activeTarget != null) {
      _activeTarget!.didDrop(this);
      wasAccepted = true;
      _enteredTargets.remove(_activeTarget);
    }
    _leaveAllEntered();
    _activeTarget = null;
    _entry!.remove();
    _entry = null;
    // TODO(ianh): consider passing _entry as well so the client can perform an animation.
    onDragEnd?.call(velocity ?? Velocity.zero, _lastOffset!, wasAccepted);
  }

  Widget _build(BuildContext context) {
    final box = overlayState.context.findRenderObject()! as RenderBox;
    final overlayTopLeft = box.localToGlobal(Offset.zero);
    return Positioned(
      left: _lastOffset!.dx - overlayTopLeft.dx,
      top: _lastOffset!.dy - overlayTopLeft.dy,
      child: MouseRegion(
        cursor: SystemMouseCursors.grabbing,
        opaque: false,
        child: IgnorePointer(
          ignoringSemantics: ignoringFeedbackSemantics,
          child: feedback,
        ),
      ),
    );
  }

  Velocity _restrictVelocityAxis(Velocity velocity) {
    if (axis == null) {
      return velocity;
    }
    return Velocity(
      pixelsPerSecond: _restrictAxis(velocity.pixelsPerSecond),
    );
  }

  Offset _restrictAxis(Offset offset) {
    if (axis == null) {
      return offset;
    }
    if (axis == Axis.horizontal) {
      return Offset(offset.dx, 0);
    }
    return Offset(0, offset.dy);
  }
}
