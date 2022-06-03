import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simtech/router/router.gr.dart';
import 'package:simtech/theme/theme.dart';
import 'package:universal_html/html.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>([
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/waves.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/circles.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/big_arrow.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/consumer_option.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/packager_option.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/recycler_option.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/yellow_bin.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/green_bin.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/blue_bin.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/grey_bin.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/right.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svgs/wrong.svg',
      ),
      null,
    ),
  ]);
  runApp(const ProviderScope(child: SimtechApp()));
}

class SimtechApp extends StatefulWidget {
  const SimtechApp({super.key});

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
    precacheImage(
      const AssetImage('assets/images/recycler_intro.png'),
      context,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
