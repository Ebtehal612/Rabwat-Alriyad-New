import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/palette.dart';
import '../text/custom_text.dart';

class DebugImage extends StatelessWidget {
  final String assetPath;
  final BoxFit fit;
  final Color? color;
  final BlendMode? colorBlendMode;
  final double? width;
  final double? height;

  const DebugImage({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.cover,
    this.color,
    this.colorBlendMode,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        // Print debug info
        debugPrint('Failed to load image: $assetPath');
        debugPrint('Error: $error');
        
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Palette.dayBreakBlue.color7.withOpacity(0.8),
                Palette.dayBreakBlue.color9.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image_not_supported,
                size: 40.sp,
                color: Colors.white.withOpacity(0.7),
              ),
              8.verticalSpace,
              CustomText.s12(
                'Image not found',
                color: Colors.white.withOpacity(0.7),
                center: true,
              ),
              4.verticalSpace,
              CustomText.s10(
                assetPath.split('/').last,
                color: Colors.white.withOpacity(0.5),
                center: true,
              ),
            ],
          ),
        );
      },
    );
  }
}