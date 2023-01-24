import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';
import 'package:simrecicla/gen/assets.gen.dart';
import 'package:simrecicla/router/router.dart';
import 'package:simrecicla/theme/app_scroll_behavior.dart';
import 'package:simrecicla/theme/theme.dart';
import 'package:url_strategy/url_strategy.dart';

extension SvgGenImageX on SvgGenImage {
  Future<void> precache() => precachePicture(
        ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder,
          path,
        ),
        null,
      );
}

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>([
    Assets.svgs.logo.precache(),
    Assets.svgs.waves.precache(),
    Assets.svgs.circles.precache(),
    Assets.svgs.bigArrow.precache(),
    Assets.svgs.consumerOption.precache(),
    Assets.svgs.packagerOption.precache(),
    Assets.svgs.recyclerOption.precache(),
    Assets.svgs.yellowBin.precache(),
    Assets.svgs.greenBin.precache(),
    Assets.svgs.blueBin.precache(),
    Assets.svgs.greyBin.precache(),
    Assets.svgs.right.precache(),
    Assets.svgs.wrong.precache(),
    Assets.svgs.sameBin.precache(),
  ]);
  runApp(const ProviderScope(child: SimReciclaApp()));
}

class SimReciclaApp extends ConsumerStatefulWidget {
  const SimReciclaApp({super.key});

  @override
  ConsumerState<SimReciclaApp> createState() => _SimReciclaAppState();
}

class _SimReciclaAppState extends ConsumerState<SimReciclaApp> {
  @override
  void initState() {
    precacheImage(
      AssetImage(Assets.images.consumerIntro.path),
      context,
    );
    precacheImage(
      AssetImage(Assets.images.packagerIntro.path),
      context,
    );
    precacheImage(
      AssetImage(Assets.images.recyclerIntro.path),
      context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: ref.watch(routerProvider),
        theme: theme,
        scrollBehavior: AppScrollBehavior(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt')],
      ),
    );
  }
}
