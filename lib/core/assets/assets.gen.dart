// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/adha.jpg
  AssetGenImage get adha => const AssetGenImage('assets/images/adha.jpg');

  /// File path: assets/images/cow.png
  AssetGenImage get cow => const AssetGenImage('assets/images/cow.png');

  /// File path: assets/images/hari.jpg
  AssetGenImage get hari => const AssetGenImage('assets/images/hari.jpg');

  /// File path: assets/images/hashee.png
  AssetGenImage get hashee => const AssetGenImage('assets/images/hashee.png');

  /// File path: assets/images/home.jpg
  AssetGenImage get home => const AssetGenImage('assets/images/home.jpg');

  /// File path: assets/images/insta.png
  AssetGenImage get insta => const AssetGenImage('assets/images/insta.png');

  /// File path: assets/images/kawarei.png
  AssetGenImage get kawarei => const AssetGenImage('assets/images/kawarei.png');

  /// File path: assets/images/kebda.png
  AssetGenImage get kebda => const AssetGenImage('assets/images/kebda.png');

  /// File path: assets/images/kersha.png
  AssetGenImage get kersha => const AssetGenImage('assets/images/kersha.png');

  /// File path: assets/images/nagdy.jpg
  AssetGenImage get nagdy => const AssetGenImage('assets/images/nagdy.jpg');

  /// File path: assets/images/neami.jpg
  AssetGenImage get neami => const AssetGenImage('assets/images/neami.jpg');

  /// File path: assets/images/sheep.png
  AssetGenImage get sheep => const AssetGenImage('assets/images/sheep.png');

  /// File path: assets/images/sheepwhitenum.png
  AssetGenImage get sheepwhitenum =>
      const AssetGenImage('assets/images/sheepwhitenum.png');

  /// File path: assets/images/snap.png
  AssetGenImage get snap => const AssetGenImage('assets/images/snap.png');

  /// File path: assets/images/swakni.png
  AssetGenImage get swakni => const AssetGenImage('assets/images/swakni.png');

  /// File path: assets/images/tyous.png
  AssetGenImage get tyous => const AssetGenImage('assets/images/tyous.png');

  /// File path: assets/images/vector.png
  AssetGenImage get vector => const AssetGenImage('assets/images/vector.png');

  /// File path: assets/images/whatsapp.png
  AssetGenImage get whatsapp =>
      const AssetGenImage('assets/images/whatsapp.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        adha,
        cow,
        hari,
        hashee,
        home,
        insta,
        kawarei,
        kebda,
        kersha,
        nagdy,
        neami,
        sheep,
        sheepwhitenum,
        snap,
        swakni,
        tyous,
        vector,
        whatsapp
      ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
