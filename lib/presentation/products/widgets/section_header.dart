import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomText.s16(
          title,
          color: Palette.dayBreakBlue.color7,
          bold: true,
        ),
      ),
    );
  }
}
