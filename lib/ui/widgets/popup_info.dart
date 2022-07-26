import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simtech/ui/widgets/my_card.dart';

const Duration _kMenuDuration = Duration(milliseconds: 300);
const double _kMenuCloseIntervalEnd = 2.0 / 3.0;
const double _kMenuMaxWidth = 5.0 * _kMenuWidthStep;
const double _kMenuMinWidth = 2.0 * _kMenuWidthStep;
const double _kMenuWidthStep = 56;
const double _kMenuScreenPadding = 8;

enum PopupMenuPosition {
  over,

  under,
}

class _PopupInfo extends StatelessWidget {
  const _PopupInfo({
    required this.route,
    required this.semanticLabel,
    this.constraints,
  });

  final _PopupInfoRoute route;
  final String? semanticLabel;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final opacity = CurveTween(curve: const Interval(0, 1 / 2));
    final width = CurveTween(curve: const Interval(0, 1));
    final height = CurveTween(curve: const Interval(0, 1));

    final Widget child = ConstrainedBox(
      constraints: constraints ??
          const BoxConstraints(
            minWidth: _kMenuMinWidth,
            maxWidth: _kMenuMaxWidth,
          ),
      child: Semantics(
        scopesRoute: true,
        namesRoute: true,
        explicitChildNodes: true,
        label: semanticLabel,
        child: MyCard(
          child: SingleChildScrollView(
            child: route.child,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: route.animation!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: opacity.animate(route.animation!),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            widthFactor: width.evaluate(route.animation!),
            heightFactor: height.evaluate(route.animation!),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

// Positioning of the menu on the screen.
class _PopupInfoRouteLayout extends SingleChildLayoutDelegate {
  _PopupInfoRouteLayout(
    this.position,
    this.textDirection,
    this.padding,
    this.avoidBounds,
  );

  final RelativeRect position;

  final TextDirection textDirection;

  EdgeInsets padding;

  final Set<Rect> avoidBounds;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest).deflate(padding);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final buttonHeight = size.height - position.top - position.bottom;
    var y = position.top;
    double x;
    if (position.left > position.right) {
      x = size.width - position.right - childSize.width;
    } else if (position.left < position.right) {
      x = position.left;
    } else {
      switch (textDirection) {
        case TextDirection.rtl:
          x = size.width - position.right - childSize.width;
          break;
        case TextDirection.ltr:
          x = position.left;
          break;
      }
    }
    final wantedPosition = Offset(x, y);
    final originCenter = position.toRect(Offset.zero & size).center;
    final subScreens = DisplayFeatureSubScreen.subScreensInBounds(
      Offset.zero & size,
      avoidBounds,
    );
    final subScreen = _closestScreen(subScreens, originCenter);
    return _fitInsideScreen(subScreen, childSize, wantedPosition);
  }

  Rect _closestScreen(Iterable<Rect> screens, Offset point) {
    var closest = screens.first;
    for (final screen in screens) {
      if ((screen.center - point).distance <
          (closest.center - point).distance) {
        closest = screen;
      }
    }
    return closest;
  }

  Offset _fitInsideScreen(Rect screen, Size childSize, Offset wantedPosition) {
    var x = wantedPosition.dx;
    var y = wantedPosition.dy;
    if (x < screen.left + _kMenuScreenPadding + padding.left) {
      x = screen.left + _kMenuScreenPadding + padding.left;
    } else if (x + childSize.width >
        screen.right - _kMenuScreenPadding - padding.right) {
      x = screen.right - childSize.width - _kMenuScreenPadding - padding.right;
    }
    if (y < screen.top + _kMenuScreenPadding + padding.top) {
      y = _kMenuScreenPadding + padding.top;
    } else if (y + childSize.height >
        screen.bottom - _kMenuScreenPadding - padding.bottom) {
      y = screen.bottom -
          childSize.height -
          _kMenuScreenPadding -
          padding.bottom;
    }

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupInfoRouteLayout oldDelegate) {
    return position != oldDelegate.position ||
        textDirection != oldDelegate.textDirection ||
        padding != oldDelegate.padding ||
        !setEquals(avoidBounds, oldDelegate.avoidBounds);
  }
}

class _PopupInfoRoute extends PopupRoute<void> {
  _PopupInfoRoute({
    required this.position,
    required this.child,
    this.elevation,
    required this.barrierLabel,
    this.semanticLabel,
    this.shape,
    this.color,
    required this.capturedThemes,
    this.constraints,
  });

  final RelativeRect position;
  final Widget child;
  final double? elevation;
  final String? semanticLabel;
  final ShapeBorder? shape;
  final Color? color;
  final CapturedThemes capturedThemes;
  final BoxConstraints? constraints;

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0, _kMenuCloseIntervalEnd),
    );
  }

  @override
  Duration get transitionDuration => _kMenuDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => null;

  @override
  final String barrierLabel;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget info = _PopupInfo(
      route: this,
      semanticLabel: semanticLabel,
      constraints: constraints,
    );
    final mediaQuery = MediaQuery.of(context);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: Builder(
        builder: (BuildContext context) {
          return CustomSingleChildLayout(
            delegate: _PopupInfoRouteLayout(
              position,
              Directionality.of(context),
              mediaQuery.padding,
              _avoidBounds(mediaQuery),
            ),
            child: capturedThemes.wrap(info),
          );
        },
      ),
    );
  }

  Set<Rect> _avoidBounds(MediaQueryData mediaQuery) {
    return DisplayFeatureSubScreen.avoidBounds(mediaQuery).toSet();
  }
}

Future<void> showInfo({
  required BuildContext context,
  required RelativeRect position,
  required Widget child,
  double? elevation,
  String? semanticLabel,
  ShapeBorder? shape,
  Color? color,
  bool useRootNavigator = false,
  BoxConstraints? constraints,
}) {
  assert(debugCheckHasMaterialLocalizations(context));

  switch (Theme.of(context).platform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      break;
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      semanticLabel ??= MaterialLocalizations.of(context).popupMenuLabel;
  }

  final navigator = Navigator.of(context, rootNavigator: useRootNavigator);
  return navigator.push(
    _PopupInfoRoute(
      position: position,
      child: child,
      elevation: elevation,
      semanticLabel: semanticLabel,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      shape: shape,
      color: color,
      capturedThemes:
          InheritedTheme.capture(from: context, to: navigator.context),
      constraints: constraints,
    ),
  );
}

typedef PopupMenuItemSelected<T> = void Function(T value);

typedef PopupMenuCanceled = void Function();

typedef PopupMenuItemBuilder<T> = List<PopupMenuEntry<T>> Function(
  BuildContext context,
);
