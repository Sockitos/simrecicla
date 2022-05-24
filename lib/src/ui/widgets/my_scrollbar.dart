// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: comment_references, prefer_asserts_with_message

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

const double _kMinThumbExtent = 18;
const double _kMinInteractiveSize = 48;
const double _kScrollbarThickness = 6;
const Duration _kScrollbarFadeDuration = Duration(milliseconds: 300);
const Duration _kScrollbarTimeToFade = Duration(milliseconds: 600);

class ScrollbarPainter extends ChangeNotifier implements CustomPainter {
  ScrollbarPainter({
    required Color color,
    required this.fadeoutOpacityAnimation,
    Color trackColor = const Color(0x00000000),
    Color trackBorderColor = const Color(0x00000000),
    TextDirection? textDirection,
    double thickness = _kScrollbarThickness,
    EdgeInsets padding = const EdgeInsets.all(20),
    double mainAxisMargin = 0.0,
    double crossAxisMargin = 0.0,
    Radius? radius,
    double minLength = _kMinThumbExtent,
    double? minOverscrollLength,
    ScrollbarOrientation? scrollbarOrientation,
  })  : assert(minLength >= 0),
        assert(minOverscrollLength == null || minOverscrollLength <= minLength),
        assert(minOverscrollLength == null || minOverscrollLength >= 0),
        assert(padding.isNonNegative),
        _color = color,
        _textDirection = textDirection,
        _thickness = thickness,
        _radius = radius,
        _padding = padding,
        _mainAxisMargin = mainAxisMargin,
        _crossAxisMargin = crossAxisMargin,
        _minLength = minLength,
        _trackColor = trackColor,
        _trackBorderColor = trackBorderColor,
        _scrollbarOrientation = scrollbarOrientation,
        _minOverscrollLength = minOverscrollLength ?? minLength {
    fadeoutOpacityAnimation.addListener(notifyListeners);
  }

  Color get color => _color;
  Color _color;
  set color(Color value) {
    if (color == value) return;

    _color = value;
    notifyListeners();
  }

  Color get trackColor => _trackColor;
  Color _trackColor;
  set trackColor(Color value) {
    if (trackColor == value) return;

    _trackColor = value;
    notifyListeners();
  }

  Color get trackBorderColor => _trackBorderColor;
  Color _trackBorderColor;
  set trackBorderColor(Color value) {
    if (trackBorderColor == value) return;

    _trackBorderColor = value;
    notifyListeners();
  }

  TextDirection? get textDirection => _textDirection;
  TextDirection? _textDirection;
  set textDirection(TextDirection? value) {
    assert(value != null);
    if (textDirection == value) return;

    _textDirection = value;
    notifyListeners();
  }

  double get thickness => _thickness;
  double _thickness;
  set thickness(double value) {
    if (thickness == value) return;

    _thickness = value;
    notifyListeners();
  }

  final Animation<double> fadeoutOpacityAnimation;

  double get mainAxisMargin => _mainAxisMargin;
  double _mainAxisMargin;
  set mainAxisMargin(double value) {
    if (mainAxisMargin == value) return;

    _mainAxisMargin = value;
    notifyListeners();
  }

  double get crossAxisMargin => _crossAxisMargin;
  double _crossAxisMargin;
  set crossAxisMargin(double value) {
    if (crossAxisMargin == value) return;

    _crossAxisMargin = value;
    notifyListeners();
  }

  Radius? get radius => _radius;
  Radius? _radius;
  set radius(Radius? value) {
    if (radius == value) return;

    _radius = value;
    notifyListeners();
  }

  EdgeInsets get padding => _padding;
  EdgeInsets _padding;
  set padding(EdgeInsets value) {
    if (padding == value) return;

    _padding = value;
    notifyListeners();
  }

  double get minLength => _minLength;
  double _minLength;
  set minLength(double value) {
    if (minLength == value) return;

    _minLength = value;
    notifyListeners();
  }

  double get minOverscrollLength => _minOverscrollLength;
  double _minOverscrollLength;
  set minOverscrollLength(double value) {
    if (minOverscrollLength == value) return;

    _minOverscrollLength = value;
    notifyListeners();
  }

  ScrollbarOrientation? get scrollbarOrientation => _scrollbarOrientation;
  ScrollbarOrientation? _scrollbarOrientation;
  set scrollbarOrientation(ScrollbarOrientation? value) {
    if (scrollbarOrientation == value) return;

    _scrollbarOrientation = value;
    notifyListeners();
  }

  void _debugAssertIsValidOrientation(ScrollbarOrientation orientation) {
    assert(
      (_isVertical && _isVerticalOrientation(orientation)) ||
          (!_isVertical && !_isVerticalOrientation(orientation)),
      'The given ScrollbarOrientation: $orientation is incompatible with the current AxisDirection: $_lastAxisDirection.',
    );
  }

  bool _isVerticalOrientation(ScrollbarOrientation orientation) =>
      orientation == ScrollbarOrientation.left ||
      orientation == ScrollbarOrientation.right;

  ScrollMetrics? _lastMetrics;
  AxisDirection? _lastAxisDirection;
  Rect? _thumbRect;
  Rect? _trackRect;
  late double _thumbOffset;

  void update(
    ScrollMetrics metrics,
    AxisDirection axisDirection,
  ) {
    if (_lastMetrics != null &&
        _lastMetrics!.extentBefore == metrics.extentBefore &&
        _lastMetrics!.extentInside == metrics.extentInside &&
        _lastMetrics!.extentAfter == metrics.extentAfter &&
        _lastAxisDirection == axisDirection) return;

    final oldMetrics = _lastMetrics;
    _lastMetrics = metrics;
    _lastAxisDirection = axisDirection;

    bool _needPaint(ScrollMetrics? metrics) =>
        metrics != null && metrics.maxScrollExtent > metrics.minScrollExtent;
    if (!_needPaint(oldMetrics) && !_needPaint(metrics)) return;

    notifyListeners();
  }

  void updateThickness(double nextThickness, Radius nextRadius) {
    thickness = nextThickness;
    radius = nextRadius;
  }

  Paint get _paintThumb {
    return Paint()
      ..color =
          color.withOpacity(color.opacity * fadeoutOpacityAnimation.value);
  }

  Paint _paintTrack({bool isBorder = false}) {
    if (isBorder) {
      return Paint()
        ..color = trackBorderColor.withOpacity(
          trackBorderColor.opacity * fadeoutOpacityAnimation.value,
        )
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
    }
    return Paint()
      ..color = trackColor
          .withOpacity(trackColor.opacity * fadeoutOpacityAnimation.value);
  }

  void _paintScrollbar(
    Canvas canvas,
    Size size,
    double thumbExtent,
    AxisDirection direction,
  ) {
    assert(
      textDirection != null,
      'A TextDirection must be provided before a Scrollbar can be painted.',
    );

    final ScrollbarOrientation resolvedOrientation;

    if (scrollbarOrientation == null) {
      if (_isVertical) {
        resolvedOrientation = textDirection == TextDirection.ltr
            ? ScrollbarOrientation.right
            : ScrollbarOrientation.left;
      } else {
        resolvedOrientation = ScrollbarOrientation.bottom;
      }
    } else {
      resolvedOrientation = scrollbarOrientation!;
    }

    final double x;
    final double y;
    final Size thumbSize;
    final Size trackSize;
    final Offset trackOffset;

    _debugAssertIsValidOrientation(resolvedOrientation);
    switch (resolvedOrientation) {
      case ScrollbarOrientation.left:
        thumbSize = Size(thickness, thumbExtent);
        trackSize = Size(thickness, _trackExtent);
        x = crossAxisMargin + padding.left;
        y = _thumbOffset;
        trackOffset = Offset(x, 0.0 + mainAxisMargin);
        break;
      case ScrollbarOrientation.right:
        thumbSize = Size(thickness, thumbExtent);
        trackSize = Size(thickness, _trackExtent);
        x = size.width - thickness - crossAxisMargin - padding.right;
        y = _thumbOffset;
        trackOffset = Offset(x, 0.0 + mainAxisMargin);
        break;
      case ScrollbarOrientation.top:
        thumbSize = Size(thumbExtent, thickness);
        trackSize = Size(_trackExtent, thickness);
        x = _thumbOffset;
        y = crossAxisMargin + padding.top;
        trackOffset = Offset(0.0 + mainAxisMargin, y);
        break;
      case ScrollbarOrientation.bottom:
        thumbSize = Size(thumbExtent, thickness);
        trackSize = Size(_trackExtent, thickness);
        x = _thumbOffset;
        y = size.height - thickness - crossAxisMargin - padding.bottom;
        trackOffset = Offset(0.0 + mainAxisMargin, y - crossAxisMargin);
        break;
    }

    _trackRect = trackOffset & trackSize;

    if (radius == null) {
      canvas.drawRect(_trackRect!, _paintTrack());
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(_trackRect!, radius!),
        _paintTrack(),
      );
    }

    canvas.drawLine(
      trackOffset,
      Offset(trackOffset.dx, trackOffset.dy + _trackExtent),
      _paintTrack(isBorder: true),
    );

    _thumbRect = Offset(x, y) & thumbSize;
    if (radius == null) {
      canvas.drawRect(_thumbRect!, _paintThumb);
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(_thumbRect!, radius!),
        _paintThumb,
      );
    }
  }

  double _thumbExtent() {
    // Thumb extent reflects fraction of content visible, as long as this
    // isn't less than the absolute minimum size.
    // _totalContentExtent >= viewportDimension, so (_totalContentExtent - _mainAxisPadding) > 0
    final fractionVisible = ((_lastMetrics!.extentInside - _mainAxisPadding) /
            (_totalContentExtent - _mainAxisPadding))
        .clamp(0.0, 1.0);

    final thumbExtent = math.max(
      math.min(_trackExtent, minOverscrollLength),
      _trackExtent * fractionVisible,
    );

    final fractionOverscrolled =
        1.0 - _lastMetrics!.extentInside / _lastMetrics!.viewportDimension;
    final safeMinLength = math.min(minLength, _trackExtent);
    final newMinLength = (_beforeExtent > 0 && _afterExtent > 0)
        // Thumb extent is no smaller than minLength if scrolling normally.
        ? safeMinLength
        // User is overscrolling. Thumb extent can be less than minLength
        // but no smaller than minOverscrollLength. We can't use the
        // fractionVisible to produce intermediate values between minLength and
        // minOverscrollLength when the user is transitioning from regular
        // scrolling to overscrolling, so we instead use the percentage of the
        // content that is still in the viewport to determine the size of the
        // thumb. iOS behavior appears to have the thumb reach its minimum size
        // with ~20% of overscroll. We map the percentage of minLength from
        // [0.8, 1.0] to [0.0, 1.0], so 0% to 20% of overscroll will produce
        // values for the thumb that range between minLength and the smallest
        // possible value, minOverscrollLength.
        : safeMinLength * (1.0 - fractionOverscrolled.clamp(0.0, 0.2) / 0.2);

    // The `thumbExtent` should be no greater than `trackSize`, otherwise
    // the scrollbar may scroll towards the wrong direction.
    return thumbExtent.clamp(newMinLength, _trackExtent);
  }

  @override
  void dispose() {
    fadeoutOpacityAnimation.removeListener(notifyListeners);
    super.dispose();
  }

  bool get _isVertical =>
      _lastAxisDirection == AxisDirection.down ||
      _lastAxisDirection == AxisDirection.up;
  bool get _isReversed =>
      _lastAxisDirection == AxisDirection.up ||
      _lastAxisDirection == AxisDirection.left;
  // The amount of scroll distance before and after the current position.
  double get _beforeExtent =>
      _isReversed ? _lastMetrics!.extentAfter : _lastMetrics!.extentBefore;
  double get _afterExtent =>
      _isReversed ? _lastMetrics!.extentBefore : _lastMetrics!.extentAfter;
  // Padding of the thumb track.
  double get _mainAxisPadding =>
      _isVertical ? padding.vertical : padding.horizontal;
  // The size of the thumb track.
  double get _trackExtent =>
      _lastMetrics!.viewportDimension - 2 * mainAxisMargin - _mainAxisPadding;

  // The total size of the scrollable content.
  double get _totalContentExtent {
    return _lastMetrics!.maxScrollExtent -
        _lastMetrics!.minScrollExtent +
        _lastMetrics!.viewportDimension;
  }

  double getTrackToScroll(double thumbOffsetLocal) {
    final scrollableExtent =
        _lastMetrics!.maxScrollExtent - _lastMetrics!.minScrollExtent;
    final thumbMovableExtent = _trackExtent - _thumbExtent();

    return scrollableExtent * thumbOffsetLocal / thumbMovableExtent;
  }

  // Converts between a scroll position and the corresponding position in the
  // thumb track.
  double _getScrollToTrack(ScrollMetrics metrics, double thumbExtent) {
    final scrollableExtent = metrics.maxScrollExtent - metrics.minScrollExtent;

    final fractionPast = (scrollableExtent > 0)
        ? ((metrics.pixels - metrics.minScrollExtent) / scrollableExtent)
            .clamp(0.0, 1.0)
        : 0;

    return (_isReversed ? 1 - fractionPast : fractionPast) *
        (_trackExtent - thumbExtent);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_lastAxisDirection == null ||
        _lastMetrics == null ||
        fadeoutOpacityAnimation.value == 0.0 ||
        _lastMetrics!.maxScrollExtent <= _lastMetrics!.minScrollExtent) return;

    // Skip painting if there's not enough space.
    if (_lastMetrics!.viewportDimension <= _mainAxisPadding ||
        _trackExtent <= 0) {
      return;
    }

    final beforePadding = _isVertical ? padding.top : padding.left;
    final thumbExtent = _thumbExtent();
    final thumbOffsetLocal = _getScrollToTrack(_lastMetrics!, thumbExtent);
    _thumbOffset = thumbOffsetLocal + mainAxisMargin + beforePadding;

    // Do not paint a scrollbar if the scroll view is infinitely long.
    // TODO(Piinks): Special handling for infinite scroll views, https://github.com/flutter/flutter/issues/41434
    if (_lastMetrics!.maxScrollExtent.isInfinite) return;

    return _paintScrollbar(canvas, size, thumbExtent, _lastAxisDirection!);
  }

  bool hitTestInteractive(
    Offset position,
    PointerDeviceKind kind, {
    bool forHover = false,
  }) {
    if (_thumbRect == null) {
      // We have never painted the scrollbar, so we do not know where it will be.
      return false;
    }

    final interactiveRect = _trackRect ?? _thumbRect!;
    final paddedRect = interactiveRect.expandToInclude(
      Rect.fromCircle(
        center: _thumbRect!.center,
        radius: _kMinInteractiveSize / 2,
      ),
    );

    // The scrollbar is not able to be hit when transparent - except when
    // hovering with a mouse. This should bring the scrollbar into view so the
    // mouse can interact with it.
    if (fadeoutOpacityAnimation.value == 0.0) {
      if (forHover && kind == PointerDeviceKind.mouse) {
        return paddedRect.contains(position);
      }
      return false;
    }

    switch (kind) {
      case PointerDeviceKind.touch:
        return paddedRect.contains(position);
      case PointerDeviceKind.mouse:
      case PointerDeviceKind.stylus:
      case PointerDeviceKind.invertedStylus:
      case PointerDeviceKind.trackpad:
      case PointerDeviceKind.unknown:
        return interactiveRect.contains(position);
    }
  }

  bool hitTestOnlyThumbInteractive(Offset position, PointerDeviceKind kind) {
    if (_thumbRect == null) {
      return false;
    }
    // The thumb is not able to be hit when transparent.
    if (fadeoutOpacityAnimation.value == 0.0) {
      return false;
    }

    switch (kind) {
      case PointerDeviceKind.touch:
        final touchThumbRect = _thumbRect!.expandToInclude(
          Rect.fromCircle(
            center: _thumbRect!.center,
            radius: _kMinInteractiveSize / 2,
          ),
        );
        return touchThumbRect.contains(position);
      case PointerDeviceKind.mouse:
      case PointerDeviceKind.stylus:
      case PointerDeviceKind.invertedStylus:
      case PointerDeviceKind.trackpad:
      case PointerDeviceKind.unknown:
        return _thumbRect!.contains(position);
    }
  }

  // Scrollbars are interactive.
  @override
  bool? hitTest(Offset? position) {
    if (_thumbRect == null) {
      return null;
    }
    // The thumb is not able to be hit when transparent.
    if (fadeoutOpacityAnimation.value == 0.0) {
      return false;
    }
    return _thumbRect!.contains(position!);
  }

  @override
  bool shouldRepaint(ScrollbarPainter old) {
    // Should repaint if any properties changed.
    return color != old.color ||
        trackColor != old.trackColor ||
        trackBorderColor != old.trackBorderColor ||
        textDirection != old.textDirection ||
        thickness != old.thickness ||
        fadeoutOpacityAnimation != old.fadeoutOpacityAnimation ||
        mainAxisMargin != old.mainAxisMargin ||
        crossAxisMargin != old.crossAxisMargin ||
        radius != old.radius ||
        minLength != old.minLength ||
        padding != old.padding ||
        minOverscrollLength != old.minOverscrollLength ||
        scrollbarOrientation != old.scrollbarOrientation;
  }

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;

  @override
  SemanticsBuilderCallback? get semanticsBuilder => null;
}

class MyScrollbar extends StatefulWidget {
  const MyScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.isAlwaysShown,
    this.radius,
    this.thickness,
    this.thumbColor,
    this.trackColor,
    this.minThumbLength = _kMinThumbExtent,
    this.minOverscrollLength,
    this.fadeDuration = _kScrollbarFadeDuration,
    this.timeToFade = _kScrollbarTimeToFade,
    this.pressDuration = Duration.zero,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.interactive,
    this.scrollbarOrientation,
    this.mainAxisMargin = 0.0,
    this.crossAxisMargin = 0.0,
  })  : assert(minThumbLength >= 0),
        assert(
          minOverscrollLength == null || minOverscrollLength <= minThumbLength,
        ),
        assert(minOverscrollLength == null || minOverscrollLength >= 0);

  final Widget child;

  final ScrollController? controller;

  final bool? isAlwaysShown;

  final Radius? radius;

  final double? thickness;

  final Color? thumbColor;

  final Color? trackColor;

  final double minThumbLength;

  final double? minOverscrollLength;

  final Duration fadeDuration;

  final Duration timeToFade;

  final Duration pressDuration;

  final ScrollNotificationPredicate notificationPredicate;

  final bool? interactive;

  final ScrollbarOrientation? scrollbarOrientation;

  final double mainAxisMargin;

  final double crossAxisMargin;

  @override
  MyScrollbarState<MyScrollbar> createState() =>
      MyScrollbarState<MyScrollbar>();
}

class MyScrollbarState<T extends MyScrollbar> extends State<T>
    with TickerProviderStateMixin<T> {
  Offset? _dragScrollbarAxisOffset;
  ScrollController? _currentController;
  Timer? _fadeoutTimer;
  late AnimationController _fadeoutAnimationController;
  late Animation<double> _fadeoutOpacityAnimation;
  final GlobalKey _scrollbarPainterKey = GlobalKey();
  bool _hoverIsActive = false;

  @protected
  late final ScrollbarPainter scrollbarPainter;

  @protected
  bool get showScrollbar => widget.isAlwaysShown ?? false;

  @protected
  bool get enableGestures => widget.interactive ?? true;

  @override
  void initState() {
    super.initState();
    _fadeoutAnimationController = AnimationController(
      vsync: this,
      duration: widget.fadeDuration,
    )..addStatusListener(_validateInteractions);
    _fadeoutOpacityAnimation = CurvedAnimation(
      parent: _fadeoutAnimationController,
      curve: Curves.fastOutSlowIn,
    );
    scrollbarPainter = ScrollbarPainter(
      color: widget.thumbColor ?? const Color(0x66BCBCBC),
      trackColor: widget.trackColor ?? const Color(0x66BCBCBC),
      minLength: widget.minThumbLength,
      minOverscrollLength: widget.minOverscrollLength ?? widget.minThumbLength,
      thickness: widget.thickness ?? _kScrollbarThickness,
      fadeoutOpacityAnimation: _fadeoutOpacityAnimation,
      scrollbarOrientation: widget.scrollbarOrientation,
      mainAxisMargin: widget.mainAxisMargin,
      crossAxisMargin: widget.crossAxisMargin,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _maybeTriggerScrollbar();
  }

  // Waits one frame and cause an empty scroll event (zero delta pixels).
  //
  // This allows the thumb to show immediately when isAlwaysShown is true.
  // A scroll event is required in order to paint the thumb.
  void _maybeTriggerScrollbar() {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      final scrollController =
          widget.controller ?? PrimaryScrollController.of(context);
      if (showScrollbar) {
        _fadeoutTimer?.cancel();
        // Wait one frame and cause an empty scroll event.  This allows the
        // thumb to show immediately when isAlwaysShown is true. A scroll
        // event is required in order to paint the thumb.
        assert(_debugCheckHasValidScrollPosition());
        scrollController!.position.didUpdateScrollPositionBy(0);
      }
    });
  }

  void _validateInteractions(AnimationStatus status) {
    final scrollController =
        widget.controller ?? PrimaryScrollController.of(context);
    if (status == AnimationStatus.dismissed) {
      assert(_fadeoutOpacityAnimation.value == 0.0);
      // We do not check for a valid scroll position if the scrollbar is not
      // visible, because it cannot be interacted with.
    } else if (scrollController != null && enableGestures) {
      // Interactive scrollbars need to be properly configured. If it is visible
      // for interaction, ensure we are set up properly.
      assert(_debugCheckHasValidScrollPosition());
    }
  }

  bool _debugCheckHasValidScrollPosition() {
    final scrollController =
        widget.controller ?? PrimaryScrollController.of(context);
    final tryPrimary = widget.controller == null;
    final controllerForError =
        tryPrimary ? 'PrimaryScrollController' : 'provided ScrollController';

    var when = '';
    if (showScrollbar) {
      when = 'Scrollbar.isAlwaysShown is true';
    } else if (enableGestures) {
      when = 'the scrollbar is interactive';
    } else {
      when = 'using the Scrollbar';
    }

    assert(
      scrollController != null,
      'A ScrollController is required when $when. '
      '${tryPrimary ? 'The Scrollbar was not provided a ScrollController, '
          'and attempted to use the PrimaryScrollController, but none was found.' : ''}',
    );
    assert(
      () {
        if (!scrollController!.hasClients) {
          throw FlutterError.fromParts(<DiagnosticsNode>[
            ErrorSummary(
              "The Scrollbar's ScrollController has no ScrollPosition attached.",
            ),
            ErrorDescription(
              'A Scrollbar cannot be painted without a ScrollPosition. ',
            ),
            ErrorHint(
              'The Scrollbar attempted to use the $controllerForError. This '
              'ScrollController should be associated with the ScrollView that '
              'the Scrollbar is being applied to. '
              '${tryPrimary ? 'A ScrollView with an Axis.vertical '
                  'ScrollDirection will automatically use the '
                  'PrimaryScrollController if the user has not provided a '
                  'ScrollController, but a ScrollDirection of Axis.horizontal will '
                  'not. To use the PrimaryScrollController explicitly, set ScrollView.primary '
                  'to true for the Scrollable widget.' : 'When providing your own ScrollController, ensure both the '
                  'Scrollbar and the Scrollable widget use the same one.'}',
            ),
          ]);
        }
        return true;
      }(),
    );
    assert(
      () {
        try {
          scrollController!.position;
        } catch (_) {
          throw FlutterError.fromParts(<DiagnosticsNode>[
            ErrorSummary(
              'The $controllerForError is currently attached to more than one '
              'ScrollPosition.',
            ),
            ErrorDescription(
              'The Scrollbar requires a single ScrollPosition in order to be painted.',
            ),
            ErrorHint(
              'When $when, the associated Scrollable '
              'widgets must have unique ScrollControllers. '
              '${tryPrimary ? 'The PrimaryScrollController is used by default for '
                  'ScrollViews with an Axis.vertical ScrollDirection, '
                  'unless the ScrollView has been provided its own '
                  'ScrollController. More than one Scrollable may have tried '
                  'to use the PrimaryScrollController of the current context.' : 'The provided ScrollController must be unique to a '
                  'Scrollable widget.'}',
            ),
          ]);
        }
        return true;
      }(),
    );
    return true;
  }

  @protected
  void updateScrollbarPainter() {
    scrollbarPainter
      ..color = widget.thumbColor ?? const Color(0x66BCBCBC)
      ..trackColor = widget.trackColor ?? const Color(0x66BCBCBC)
      ..textDirection = Directionality.of(context)
      ..thickness = widget.thickness ?? _kScrollbarThickness
      ..radius = widget.radius
      ..padding = MediaQuery.of(context).padding
      ..scrollbarOrientation = widget.scrollbarOrientation
      ..mainAxisMargin = widget.mainAxisMargin
      ..crossAxisMargin = widget.crossAxisMargin
      ..minLength = widget.minThumbLength
      ..minOverscrollLength =
          widget.minOverscrollLength ?? widget.minThumbLength;
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAlwaysShown != oldWidget.isAlwaysShown) {
      if (widget.isAlwaysShown ?? false) {
        _maybeTriggerScrollbar();
        _fadeoutAnimationController.animateTo(1);
      } else {
        _fadeoutAnimationController.reverse();
      }
    }
  }

  void _updateScrollPosition(Offset updatedOffset) {
    assert(_currentController != null);
    assert(_dragScrollbarAxisOffset != null);
    final position = _currentController!.position;
    late double primaryDelta;
    switch (position.axisDirection) {
      case AxisDirection.up:
        primaryDelta = _dragScrollbarAxisOffset!.dy - updatedOffset.dy;
        break;
      case AxisDirection.right:
        primaryDelta = updatedOffset.dx - _dragScrollbarAxisOffset!.dx;
        break;
      case AxisDirection.down:
        primaryDelta = updatedOffset.dy - _dragScrollbarAxisOffset!.dy;
        break;
      case AxisDirection.left:
        primaryDelta = _dragScrollbarAxisOffset!.dx - updatedOffset.dx;
        break;
    }

    // Convert primaryDelta, the amount that the scrollbar moved since the last
    // time _updateScrollPosition was called, into the coordinate space of the scroll
    // position, and jump to that position.
    final scrollOffsetLocal = scrollbarPainter.getTrackToScroll(primaryDelta);
    final scrollOffsetGlobal = scrollOffsetLocal + position.pixels;
    if (scrollOffsetGlobal != position.pixels) {
      // Ensure we don't drag into overscroll if the physics do not allow it.
      final physicsAdjustment = position.physics
          .applyBoundaryConditions(position, scrollOffsetGlobal);
      position.jumpTo(scrollOffsetGlobal - physicsAdjustment);
    }
  }

  void _maybeStartFadeoutTimer() {
    if (!showScrollbar) {
      _fadeoutTimer?.cancel();
      _fadeoutTimer = Timer(widget.timeToFade, () {
        _fadeoutAnimationController.reverse();
        _fadeoutTimer = null;
      });
    }
  }

  @protected
  Axis? getScrollbarDirection() {
    assert(_currentController != null);
    if (_currentController!.hasClients) {
      return _currentController!.position.axis;
    }
    return null;
  }

  @protected
  @mustCallSuper
  void handleThumbPress() {
    assert(_debugCheckHasValidScrollPosition());
    if (getScrollbarDirection() == null) {
      return;
    }
    _fadeoutTimer?.cancel();
  }

  @protected
  @mustCallSuper
  void handleThumbPressStart(Offset localPosition) {
    assert(_debugCheckHasValidScrollPosition());
    _currentController =
        widget.controller ?? PrimaryScrollController.of(context);
    final direction = getScrollbarDirection();
    if (direction == null) {
      return;
    }
    _fadeoutTimer?.cancel();
    _fadeoutAnimationController.forward();
    _dragScrollbarAxisOffset = localPosition;
  }

  @protected
  @mustCallSuper
  void handleThumbPressUpdate(Offset localPosition) {
    assert(_debugCheckHasValidScrollPosition());
    final direction = getScrollbarDirection();
    if (direction == null) {
      return;
    }
    _updateScrollPosition(localPosition);
    _dragScrollbarAxisOffset = localPosition;
  }

  @protected
  @mustCallSuper
  void handleThumbPressEnd(Offset localPosition, Velocity velocity) {
    assert(_debugCheckHasValidScrollPosition());
    final direction = getScrollbarDirection();
    if (direction == null) {
      return;
    }
    _maybeStartFadeoutTimer();
    _dragScrollbarAxisOffset = null;
    _currentController = null;
  }

  void _handleTrackTapDown(TapDownDetails details) {
    // The Scrollbar should page towards the position of the tap on the track.
    assert(_debugCheckHasValidScrollPosition());
    _currentController =
        widget.controller ?? PrimaryScrollController.of(context);

    double scrollIncrement;
    // Is an increment calculator available?
    final calculator = Scrollable.of(
      _currentController!.position.context.notificationContext!,
    )?.widget.incrementCalculator;
    if (calculator != null) {
      scrollIncrement = calculator(
        ScrollIncrementDetails(
          type: ScrollIncrementType.page,
          metrics: _currentController!.position,
        ),
      );
    } else {
      // Default page increment
      scrollIncrement = 0.8 * _currentController!.position.viewportDimension;
    }

    // Adjust scrollIncrement for direction
    switch (_currentController!.position.axisDirection) {
      case AxisDirection.up:
        if (details.localPosition.dy > scrollbarPainter._thumbOffset) {
          scrollIncrement = -scrollIncrement;
        }
        break;
      case AxisDirection.down:
        if (details.localPosition.dy < scrollbarPainter._thumbOffset) {
          scrollIncrement = -scrollIncrement;
        }
        break;
      case AxisDirection.right:
        if (details.localPosition.dx < scrollbarPainter._thumbOffset) {
          scrollIncrement = -scrollIncrement;
        }
        break;
      case AxisDirection.left:
        if (details.localPosition.dx > scrollbarPainter._thumbOffset) {
          scrollIncrement = -scrollIncrement;
        }
        break;
    }

    _currentController!.position.moveTo(
      _currentController!.position.pixels + scrollIncrement,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  bool _handleScrollMetricsNotification(
    ScrollMetricsNotification notification,
  ) {
    if (!widget.notificationPredicate(
      ScrollUpdateNotification(
        metrics: notification.metrics,
        context: notification.context,
      ),
    )) return false;
    if (showScrollbar) {
      if (_fadeoutAnimationController.status != AnimationStatus.forward &&
          _fadeoutAnimationController.status != AnimationStatus.completed) {
        _fadeoutAnimationController.forward();
      }
    }
    scrollbarPainter.update(
      notification.metrics,
      notification.metrics.axisDirection,
    );
    return false;
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) return false;

    final metrics = notification.metrics;
    if (metrics.maxScrollExtent <= metrics.minScrollExtent) {
      // Hide the bar when the Scrollable widget has no space to scroll.
      if (_fadeoutAnimationController.status != AnimationStatus.dismissed &&
          _fadeoutAnimationController.status != AnimationStatus.reverse) {
        _fadeoutAnimationController.reverse();
      }
      scrollbarPainter.update(metrics, metrics.axisDirection);
      return false;
    }

    if (notification is ScrollUpdateNotification ||
        notification is OverscrollNotification) {
      // Any movements always makes the scrollbar start showing up.
      if (_fadeoutAnimationController.status != AnimationStatus.forward &&
          _fadeoutAnimationController.status != AnimationStatus.completed) {
        _fadeoutAnimationController.forward();
      }

      _fadeoutTimer?.cancel();
      scrollbarPainter.update(
        notification.metrics,
        notification.metrics.axisDirection,
      );
    } else if (notification is ScrollEndNotification) {
      if (_dragScrollbarAxisOffset == null) _maybeStartFadeoutTimer();
    }
    return false;
  }

  Map<Type, GestureRecognizerFactory> get _gestures {
    final gestures = <Type, GestureRecognizerFactory>{};
    final controller = widget.controller ?? PrimaryScrollController.of(context);
    if (controller == null || !enableGestures) return gestures;

    gestures[_ThumbPressGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<_ThumbPressGestureRecognizer>(
      () => _ThumbPressGestureRecognizer(
        debugOwner: this,
        customPaintKey: _scrollbarPainterKey,
        pressDuration: widget.pressDuration,
      ),
      (instance) {
        instance.onLongPress = handleThumbPress;
        instance.onLongPressStart =
            (details) => handleThumbPressStart(details.localPosition);
        instance.onLongPressMoveUpdate =
            (details) => handleThumbPressUpdate(details.localPosition);
        instance.onLongPressEnd = (details) =>
            handleThumbPressEnd(details.localPosition, details.velocity);
      },
    );

    gestures[_TrackTapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<_TrackTapGestureRecognizer>(
      () => _TrackTapGestureRecognizer(
        debugOwner: this,
        customPaintKey: _scrollbarPainterKey,
      ),
      (instance) {
        instance.onTapDown = _handleTrackTapDown;
      },
    );

    return gestures;
  }

  @protected
  bool isPointerOverTrack(Offset position, PointerDeviceKind kind) {
    if (_scrollbarPainterKey.currentContext == null) {
      return false;
    }
    final localOffset = _getLocalOffset(_scrollbarPainterKey, position);
    return scrollbarPainter.hitTestInteractive(localOffset, kind) &&
        !scrollbarPainter.hitTestOnlyThumbInteractive(localOffset, kind);
  }

  @protected
  bool isPointerOverThumb(Offset position, PointerDeviceKind kind) {
    if (_scrollbarPainterKey.currentContext == null) {
      return false;
    }
    final localOffset = _getLocalOffset(_scrollbarPainterKey, position);
    return scrollbarPainter.hitTestOnlyThumbInteractive(localOffset, kind);
  }

  @protected
  bool isPointerOverScrollbar(
    Offset position,
    PointerDeviceKind kind, {
    bool forHover = false,
  }) {
    if (_scrollbarPainterKey.currentContext == null) {
      return false;
    }
    final localOffset = _getLocalOffset(_scrollbarPainterKey, position);
    return scrollbarPainter.hitTestInteractive(
      localOffset,
      kind,
      forHover: true,
    );
  }

  @protected
  @mustCallSuper
  void handleHover(PointerHoverEvent event) {
    // Check if the position of the pointer falls over the painted scrollbar
    if (isPointerOverScrollbar(event.position, event.kind, forHover: true)) {
      _hoverIsActive = true;
      // Bring the scrollbar back into view if it has faded or started to fade
      // away.
      _fadeoutAnimationController.forward();
      _fadeoutTimer?.cancel();
    } else if (_hoverIsActive) {
      // Pointer is not over painted scrollbar.
      _hoverIsActive = false;
      _maybeStartFadeoutTimer();
    }
  }

  @protected
  @mustCallSuper
  void handleHoverExit(PointerExitEvent event) {
    _hoverIsActive = false;
    _maybeStartFadeoutTimer();
  }

  @override
  void dispose() {
    _fadeoutAnimationController.dispose();
    _fadeoutTimer?.cancel();
    scrollbarPainter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updateScrollbarPainter();

    return NotificationListener<ScrollMetricsNotification>(
      onNotification: _handleScrollMetricsNotification,
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: RepaintBoundary(
          child: RawGestureDetector(
            gestures: _gestures,
            child: MouseRegion(
              onExit: (event) {
                switch (event.kind) {
                  case PointerDeviceKind.mouse:
                    if (enableGestures) handleHoverExit(event);
                    break;
                  case PointerDeviceKind.stylus:
                  case PointerDeviceKind.invertedStylus:
                  case PointerDeviceKind.trackpad:
                  case PointerDeviceKind.unknown:
                  case PointerDeviceKind.touch:
                    break;
                }
              },
              onHover: (event) {
                switch (event.kind) {
                  case PointerDeviceKind.mouse:
                    if (enableGestures) handleHover(event);
                    break;
                  case PointerDeviceKind.stylus:
                  case PointerDeviceKind.invertedStylus:
                  case PointerDeviceKind.trackpad:
                  case PointerDeviceKind.unknown:
                  case PointerDeviceKind.touch:
                    break;
                }
              },
              child: CustomPaint(
                key: _scrollbarPainterKey,
                foregroundPainter: scrollbarPainter,
                child: RepaintBoundary(child: widget.child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// A long press gesture detector that only responds to events on the scrollbar's
// thumb and ignores everything else.
class _ThumbPressGestureRecognizer extends LongPressGestureRecognizer {
  _ThumbPressGestureRecognizer({
    required Object super.debugOwner,
    required GlobalKey customPaintKey,
    required Duration pressDuration,
  })  : _customPaintKey = customPaintKey,
        super(
          duration: pressDuration,
        );

  final GlobalKey _customPaintKey;

  @override
  bool isPointerAllowed(PointerDownEvent event) {
    if (!_hitTestInteractive(_customPaintKey, event.position, event.kind)) {
      return false;
    }
    return super.isPointerAllowed(event);
  }

  bool _hitTestInteractive(
    GlobalKey customPaintKey,
    Offset offset,
    PointerDeviceKind kind,
  ) {
    if (customPaintKey.currentContext == null) {
      return false;
    }
    final customPaint = customPaintKey.currentContext!.widget as CustomPaint;
    final painter = customPaint.foregroundPainter! as ScrollbarPainter;
    final localOffset = _getLocalOffset(customPaintKey, offset);
    return painter.hitTestOnlyThumbInteractive(localOffset, kind);
  }
}

// A tap gesture detector that only responds to events on the scrollbar's
// track and ignores everything else, including the thumb.
class _TrackTapGestureRecognizer extends TapGestureRecognizer {
  _TrackTapGestureRecognizer({
    required Object debugOwner,
    required GlobalKey customPaintKey,
  })  : _customPaintKey = customPaintKey,
        super(debugOwner: debugOwner);

  final GlobalKey _customPaintKey;

  @override
  bool isPointerAllowed(PointerDownEvent event) {
    if (!_hitTestInteractive(_customPaintKey, event.position, event.kind)) {
      return false;
    }
    return super.isPointerAllowed(event);
  }

  bool _hitTestInteractive(
    GlobalKey customPaintKey,
    Offset offset,
    PointerDeviceKind kind,
  ) {
    if (customPaintKey.currentContext == null) {
      return false;
    }
    final customPaint = customPaintKey.currentContext!.widget as CustomPaint;
    final painter = customPaint.foregroundPainter! as ScrollbarPainter;
    final localOffset = _getLocalOffset(customPaintKey, offset);
    // We only receive track taps that are not on the thumb.
    return painter.hitTestInteractive(localOffset, kind) &&
        !painter.hitTestOnlyThumbInteractive(localOffset, kind);
  }
}

Offset _getLocalOffset(GlobalKey scrollbarPainterKey, Offset position) {
  final renderBox =
      scrollbarPainterKey.currentContext!.findRenderObject()! as RenderBox;
  return renderBox.globalToLocal(position);
}
