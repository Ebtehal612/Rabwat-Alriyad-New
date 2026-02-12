import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';

class QuantitySelector extends StatelessWidget {
  final String label;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.label,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText.s20(label, color: Palette.dayBreakBlue.color7, bold: true),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onDecrement,
              icon: Icon(
                Icons.remove_circle_outline,
                color: Palette.dayBreakBlue.color7,
                size: 24.sp,
              ),
              padding: EdgeInsets.zero,
            ),
            Container(
              alignment: Alignment.center,
              child: CustomText.s20(
                quantity.toString(),
                color: Palette.dayBreakBlue.color7,
                bold: true,
              ),
            ),
            IconButton(
              onPressed: onIncrement,
              icon: Icon(
                Icons.add_circle_outline,
                color: Palette.dayBreakBlue.color7,
                size: 24.sp,
              ),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ],
    );
  }
}
