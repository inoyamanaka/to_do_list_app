/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Belajar.png
  AssetGenImage get belajar => const AssetGenImage('assets/images/Belajar.png');

  /// File path: assets/images/Hiburan.png
  AssetGenImage get hiburan => const AssetGenImage('assets/images/Hiburan.png');

  /// File path: assets/images/Hobi.png
  AssetGenImage get hobi => const AssetGenImage('assets/images/Hobi.png');

  /// File path: assets/images/Ibadah.png
  AssetGenImage get ibadah => const AssetGenImage('assets/images/Ibadah.png');

  /// File path: assets/images/Olahraga.png
  AssetGenImage get olahraga =>
      const AssetGenImage('assets/images/Olahraga.png');

  /// File path: assets/images/Pekerjaan.png
  AssetGenImage get pekerjaan =>
      const AssetGenImage('assets/images/Pekerjaan.png');

  /// File path: assets/images/decoration.png
  AssetGenImage get decoration =>
      const AssetGenImage('assets/images/decoration.png');

  /// File path: assets/images/ic_launcher.png
  AssetGenImage get icLauncher =>
      const AssetGenImage('assets/images/ic_launcher.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        belajar,
        hiburan,
        hobi,
        ibadah,
        olahraga,
        pekerjaan,
        decoration,
        icLauncher
      ];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/beach.json
  String get beach => 'assets/lotties/beach.json';

  /// File path: assets/lotties/gaming.json
  String get gaming => 'assets/lotties/gaming.json';

  /// File path: assets/lotties/not_found.json
  String get notFound => 'assets/lotties/not_found.json';

  /// File path: assets/lotties/reading_book.json
  String get readingBook => 'assets/lotties/reading_book.json';

  /// File path: assets/lotties/sleep_cat.json
  String get sleepCat => 'assets/lotties/sleep_cat.json';

  /// File path: assets/lotties/sport.json
  String get sport => 'assets/lotties/sport.json';

  /// List of all assets
  List<String> get values =>
      [beach, gaming, notFound, readingBook, sleepCat, sport];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
