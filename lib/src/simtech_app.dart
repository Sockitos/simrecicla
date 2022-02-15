import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simtech/src/router/router.gr.dart';
import 'package:simtech/src/theme/theme.dart';
import 'package:universal_html/html.dart';

class SimtechApp extends StatefulWidget {
  const SimtechApp({Key? key}) : super(key: key);

  @override
  State<SimtechApp> createState() => _SimtechAppState();
}

class _SimtechAppState extends State<SimtechApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    precacheImage(
      const AssetImage('assets/images/consumer_intro.png'),
      context,
    );
    precacheImage(
      const AssetImage('assets/images/packager_intro.png'),
      context,
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final loader = document.getElementById('loading');
      loader?.remove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      format: MaterialLayoutFormat(),
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
