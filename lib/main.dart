import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simtech/src/simtech_app.dart';
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
