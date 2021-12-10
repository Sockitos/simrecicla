import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/router/router.gr.dart';
import 'package:simtech/src/theme/theme.dart';

class SimtechApp extends StatelessWidget {
  SimtechApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [HeroController()],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: theme,
      ),
    );
  }
}
