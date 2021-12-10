// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../models/package.dart' as _i11;
import '../services/packager_service.dart' as _i12;
import '../ui/screens/consumer/bin_selection_screen.dart' as _i4;
import '../ui/screens/consumer/categories_screen.dart' as _i3;
import '../ui/screens/consumer/consumer_screen.dart' as _i2;
import '../ui/screens/landing/landing_screen.dart' as _i1;
import '../ui/screens/packager/form_screen.dart' as _i6;
import '../ui/screens/packager/packager_screen.dart' as _i5;
import '../ui/screens/packager/results_screen.dart' as _i7;
import '../ui/screens/recycler/recycler_screen.dart' as _i8;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LandingScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i1.LandingScreen());
    },
    ConsumerScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i2.ConsumerScreen());
    },
    CategoriesScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i3.CategoriesScreen());
    },
    BinSelectionScreenRoute.name: (routeData) {
      final args = routeData.argsAs<BinSelectionScreenRouteArgs>();
      return _i9.MaterialPageX<void>(
          routeData: routeData,
          child: _i4.BinSelectionScreen(key: args.key, package: args.package));
    },
    PackagerScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i5.PackagerScreen());
    },
    FormScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i6.FormScreen());
    },
    ResultsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ResultsScreenRouteArgs>();
      return _i9.MaterialPageX<void>(
          routeData: routeData,
          child: _i7.ResultsScreen(key: args.key, rating: args.rating));
    },
    RecyclerScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i8.RecyclerScreen());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(LandingScreenRoute.name, path: '/'),
        _i9.RouteConfig(ConsumerScreenRoute.name, path: '/consumer'),
        _i9.RouteConfig(CategoriesScreenRoute.name,
            path: '/consumer/categories'),
        _i9.RouteConfig(BinSelectionScreenRoute.name,
            path: '/consumer/bin_selection?package=:package'),
        _i9.RouteConfig(PackagerScreenRoute.name, path: '/packager'),
        _i9.RouteConfig(FormScreenRoute.name, path: '/packager/form'),
        _i9.RouteConfig(ResultsScreenRoute.name,
            path: '/packager/results?rating=:rating'),
        _i9.RouteConfig(RecyclerScreenRoute.name, path: '/recycler'),
        _i9.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for [_i1.LandingScreen]
class LandingScreenRoute extends _i9.PageRouteInfo<void> {
  const LandingScreenRoute() : super(name, path: '/');

  static const String name = 'LandingScreenRoute';
}

/// generated route for [_i2.ConsumerScreen]
class ConsumerScreenRoute extends _i9.PageRouteInfo<void> {
  const ConsumerScreenRoute() : super(name, path: '/consumer');

  static const String name = 'ConsumerScreenRoute';
}

/// generated route for [_i3.CategoriesScreen]
class CategoriesScreenRoute extends _i9.PageRouteInfo<void> {
  const CategoriesScreenRoute() : super(name, path: '/consumer/categories');

  static const String name = 'CategoriesScreenRoute';
}

/// generated route for [_i4.BinSelectionScreen]
class BinSelectionScreenRoute
    extends _i9.PageRouteInfo<BinSelectionScreenRouteArgs> {
  BinSelectionScreenRoute({_i10.Key? key, required _i11.Package package})
      : super(name,
            path: '/consumer/bin_selection?package=:package',
            args: BinSelectionScreenRouteArgs(key: key, package: package),
            rawPathParams: {});

  static const String name = 'BinSelectionScreenRoute';
}

class BinSelectionScreenRouteArgs {
  const BinSelectionScreenRouteArgs({this.key, required this.package});

  final _i10.Key? key;

  final _i11.Package package;
}

/// generated route for [_i5.PackagerScreen]
class PackagerScreenRoute extends _i9.PageRouteInfo<void> {
  const PackagerScreenRoute() : super(name, path: '/packager');

  static const String name = 'PackagerScreenRoute';
}

/// generated route for [_i6.FormScreen]
class FormScreenRoute extends _i9.PageRouteInfo<void> {
  const FormScreenRoute() : super(name, path: '/packager/form');

  static const String name = 'FormScreenRoute';
}

/// generated route for [_i7.ResultsScreen]
class ResultsScreenRoute extends _i9.PageRouteInfo<ResultsScreenRouteArgs> {
  ResultsScreenRoute({_i10.Key? key, required _i12.Rating rating})
      : super(name,
            path: '/packager/results?rating=:rating',
            args: ResultsScreenRouteArgs(key: key, rating: rating),
            rawPathParams: {});

  static const String name = 'ResultsScreenRoute';
}

class ResultsScreenRouteArgs {
  const ResultsScreenRouteArgs({this.key, required this.rating});

  final _i10.Key? key;

  final _i12.Rating rating;
}

/// generated route for [_i8.RecyclerScreen]
class RecyclerScreenRoute extends _i9.PageRouteInfo<void> {
  const RecyclerScreenRoute() : super(name, path: '/recycler');

  static const String name = 'RecyclerScreenRoute';
}
