// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simrecicla/constants/colors.dart';

const double _kScrollbarMargin = 0;
const double _kScrollbarMinLength = 48;
const Radius _kScrollbarRadius = Radius.circular(8);
const Duration _kScrollbarFadeDuration = Duration(milliseconds: 300);
const Duration _kScrollbarTimeToFade = Duration(milliseconds: 600);

class AppScrollbar extends RawScrollbar {
  const AppScrollbar({
    super.key,
    required super.child,
    super.controller,
    super.thumbVisibility,
    super.trackVisibility,
    this.showTrackOnHover,
    this.hoverThickness,
    super.thickness,
    super.radius,
    super.padding = EdgeInsets.zero,
    ScrollNotificationPredicate? notificationPredicate,
    super.interactive,
    super.scrollbarOrientation,
  }) : super(
          fadeDuration: _kScrollbarFadeDuration,
          timeToFade: _kScrollbarTimeToFade,
          pressDuration: Duration.zero,
          notificationPredicate:
              notificationPredicate ?? defaultScrollNotificationPredicate,
        );

  final bool? showTrackOnHover;
  final double? hoverThickness;

  @override
  AppScrollbarState createState() => AppScrollbarState();
}

class AppScrollbarState extends RawScrollbarState<AppScrollbar> {
  late AnimationController _hoverAnimationController;
  bool _dragIsActive = false;
  bool _hoverIsActive = false;
  late ScrollbarThemeData _scrollbarTheme;

  @override
  bool get showScrollbar => true;

  @override
  bool get enableGestures =>
      widget.interactive ?? _scrollbarTheme.interactive ?? true;

  Set<MaterialState> get _states => <MaterialState>{
        if (_dragIsActive) MaterialState.dragged,
        if (_hoverIsActive) MaterialState.hovered,
      };

  MaterialStateProperty<Color> get _thumbColor =>
      const MaterialStatePropertyAll(AppColors.lightGreen);

  MaterialStateProperty<Color> get _trackColor =>
      const MaterialStatePropertyAll(AppColors.grey4);

  MaterialStateProperty<Color> get _trackBorderColor =>
      const MaterialStatePropertyAll(Color(0x00000000));

  MaterialStateProperty<double> get _thickness =>
      const MaterialStatePropertyAll(8);

  @override
  void initState() {
    super.initState();
    _hoverAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _hoverAnimationController.addListener(updateScrollbarPainter);
  }

  @override
  void didChangeDependencies() {
    final theme = Theme.of(context);
    _scrollbarTheme = theme.scrollbarTheme;
    super.didChangeDependencies();
  }

  @override
  void updateScrollbarPainter() {
    scrollbarPainter
      ..color = _thumbColor.resolve(_states)
      ..trackColor = _trackColor.resolve(_states)
      ..trackBorderColor = _trackBorderColor.resolve(_states)
      ..textDirection = Directionality.of(context)
      ..thickness = _thickness.resolve(_states)
      ..radius = widget.radius ?? _scrollbarTheme.radius ?? _kScrollbarRadius
      ..trackRadius =
          widget.radius ?? _scrollbarTheme.radius ?? _kScrollbarRadius
      ..crossAxisMargin = _scrollbarTheme.crossAxisMargin ?? _kScrollbarMargin
      ..mainAxisMargin = _scrollbarTheme.mainAxisMargin ?? 0.0
      ..minLength = _scrollbarTheme.minThumbLength ?? _kScrollbarMinLength
      ..padding = widget.padding ?? EdgeInsets.zero
      ..scrollbarOrientation = widget.scrollbarOrientation
      ..ignorePointer = !enableGestures;
  }

  @override
  void handleThumbPressStart(Offset localPosition) {
    super.handleThumbPressStart(localPosition);
    setState(() {
      _dragIsActive = true;
    });
  }

  @override
  void handleThumbPressEnd(Offset localPosition, Velocity velocity) {
    super.handleThumbPressEnd(localPosition, velocity);
    setState(() {
      _dragIsActive = false;
    });
  }

  @override
  void handleHover(PointerHoverEvent event) {
    super.handleHover(event);
    // Check if the position of the pointer falls over the painted scrollbar
    if (isPointerOverScrollbar(event.position, event.kind, forHover: true)) {
      // Pointer is hovering over the scrollbar
      setState(() {
        _hoverIsActive = true;
      });
      _hoverAnimationController.forward();
    } else if (_hoverIsActive) {
      // Pointer was, but is no longer over painted scrollbar.
      setState(() {
        _hoverIsActive = false;
      });
      _hoverAnimationController.reverse();
    }
  }

  @override
  void handleHoverExit(PointerExitEvent event) {
    super.handleHoverExit(event);
    setState(() {
      _hoverIsActive = false;
    });
    _hoverAnimationController.reverse();
  }

  @override
  void dispose() {
    _hoverAnimationController.dispose();
    super.dispose();
  }
}
