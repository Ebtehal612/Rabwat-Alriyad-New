import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/palette.dart';
import '../../../core/localization/localization_manager.dart';
import 'package:go_router/go_router.dart';
import '../../order_completion/pages/order_completion_screen.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final double price;
  final int quantity;
  final double subtotal;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.quantity,
    required this.subtotal,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(
          0xffEEEEEE,
        ), // Matching the light grey background in image
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      imagePath,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 100.w,
                        height: 80.h,
                        color: Colors.grey[300],
                        child: Icon(Icons.image, color: Colors.grey),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  ElevatedButton(
                    onPressed: () {
                      context.push(
                        OrderCompletionScreen.routeName,
                        extra: subtotal,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.dayBreakBlue.color7,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 6.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      minimumSize: Size(90.w, 32.h),
                    ),
                    child: Text(
                      lz.pay,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              20.horizontalSpace,
              // Product Details
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.dayBreakBlue.color7,
                                ),
                              ),
                              12.verticalSpace,
                              Text(
                                '${price.toInt()} ${lz.sar}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Palette.dayBreakBlue.color7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: 24.w,
                            thickness: 1.h,
                            color: Palette.neutral.color6,
                          ),
                          Column(
                            children: [
                              Text(
                                lz.quantity,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Palette.dayBreakBlue.color7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              _buildQuantityControls(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 24.h, color: Palette.neutral.color6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${lz.total}:',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Palette.dayBreakBlue.color7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        7.horizontalSpace,
                        Text(
                          '${subtotal.toInt()} ${lz.sar}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Palette.dayBreakBlue.color7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Remove Button
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.all(2.r),
                decoration: BoxDecoration(
                  color: Palette.dustRed.color5,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 18.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onIncrement,
          icon: Icon(
            Icons.add_circle_outline,
            color: Palette.dayBreakBlue.color7,
            size: 24.sp,
          ),
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
        ),
        Text(
          '$quantity',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Palette.dayBreakBlue.color7,
          ),
        ),
        IconButton(
          onPressed: onDecrement,
          icon: Icon(
            Icons.remove_circle_outline,
            color: Palette.dayBreakBlue.color7,
            size: 24.sp,
          ),
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
