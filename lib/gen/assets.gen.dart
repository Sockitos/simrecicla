/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/MachinesIcons.ttf
  String get machinesIcons => 'assets/fonts/MachinesIcons.ttf';

  /// File path: assets/fonts/PackagesIcons.ttf
  String get packagesIcons => 'assets/fonts/PackagesIcons.ttf';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/consumer_intro.png
  AssetGenImage get consumerIntro =>
      const AssetGenImage('assets/images/consumer_intro.png');

  /// File path: assets/images/packager_intro.png
  AssetGenImage get packagerIntro =>
      const AssetGenImage('assets/images/packager_intro.png');

  /// File path: assets/images/recycler_intro.png
  AssetGenImage get recyclerIntro =>
      const AssetGenImage('assets/images/recycler_intro.png');
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/big_arrow.svg
  SvgGenImage get bigArrow => const SvgGenImage('assets/svgs/big_arrow.svg');

  /// File path: assets/svgs/blue_bin.svg
  SvgGenImage get blueBin => const SvgGenImage('assets/svgs/blue_bin.svg');

  /// File path: assets/svgs/circles.svg
  SvgGenImage get circles => const SvgGenImage('assets/svgs/circles.svg');

  /// File path: assets/svgs/consumer_option.svg
  SvgGenImage get consumerOption =>
      const SvgGenImage('assets/svgs/consumer_option.svg');

  /// File path: assets/svgs/drivers.svg
  SvgGenImage get drivers => const SvgGenImage('assets/svgs/drivers.svg');

  /// File path: assets/svgs/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/svgs/facebook.svg');

  /// File path: assets/svgs/green_bin.svg
  SvgGenImage get greenBin => const SvgGenImage('assets/svgs/green_bin.svg');

  /// File path: assets/svgs/grey_bin.svg
  SvgGenImage get greyBin => const SvgGenImage('assets/svgs/grey_bin.svg');

  /// File path: assets/svgs/instagram.svg
  SvgGenImage get instagram => const SvgGenImage('assets/svgs/instagram.svg');

  /// File path: assets/svgs/ist.svg
  SvgGenImage get ist => const SvgGenImage('assets/svgs/ist.svg');

  /// File path: assets/svgs/linkedin.svg
  SvgGenImage get linkedin => const SvgGenImage('assets/svgs/linkedin.svg');

  /// File path: assets/svgs/packager_option.svg
  SvgGenImage get packagerOption =>
      const SvgGenImage('assets/svgs/packager_option.svg');

  /// File path: assets/svgs/recycler.svg
  SvgGenImage get recycler => const SvgGenImage('assets/svgs/recycler.svg');

  /// File path: assets/svgs/recycler_option.svg
  SvgGenImage get recyclerOption =>
      const SvgGenImage('assets/svgs/recycler_option.svg');

  /// File path: assets/svgs/right.svg
  SvgGenImage get right => const SvgGenImage('assets/svgs/right.svg');

  /// File path: assets/svgs/same_bin.svg
  SvgGenImage get sameBin => const SvgGenImage('assets/svgs/same_bin.svg');

  /// File path: assets/svgs/sociedade_pontoverde.svg
  SvgGenImage get sociedadePontoverde =>
      const SvgGenImage('assets/svgs/sociedade_pontoverde.svg');

  /// File path: assets/svgs/tratolixo.svg
  SvgGenImage get tratolixo => const SvgGenImage('assets/svgs/tratolixo.svg');

  /// File path: assets/svgs/waves.svg
  SvgGenImage get waves => const SvgGenImage('assets/svgs/waves.svg');

  /// File path: assets/svgs/wrong.svg
  SvgGenImage get wrong => const SvgGenImage('assets/svgs/wrong.svg');

  /// File path: assets/svgs/yellow_bin.svg
  SvgGenImage get yellowBin => const SvgGenImage('assets/svgs/yellow_bin.svg');

  /// File path: assets/svgs/youtube.svg
  SvgGenImage get youtube => const SvgGenImage('assets/svgs/youtube.svg');
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
