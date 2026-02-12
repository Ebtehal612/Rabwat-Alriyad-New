import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';

class OptionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFilled;

  const OptionChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Palette.dayBreakBlue.color7 : Colors.white,
          border: Border.all(
            color: isSelected
                ? Palette.dayBreakBlue.color7
                : Palette.neutral.color5,
            width: isSelected ? 2 : 1.5,
          ),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: CustomText.s14(
          label,
          color: isSelected ? Colors.white : Palette.dayBreakBlue.color7,
        ),
      ),
    );
  }
}
