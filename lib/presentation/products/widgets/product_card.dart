import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';
import 'package:go_router/go_router.dart';
import '../../order_completion/pages/order_completion_screen.dart';
import '../pages/additions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubits/additions_cubit.dart';
import '../../../core/cubits/cart_cubit.dart';
import '../../../core/models/cart_item.dart';
import 'package:toastification/toastification.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String price;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    this.onTap,
  });

  static Map<String, double> _getAdditionPrices() {
    return {
      'Lamb Liver': 85,
      'كبدة غنم': 85,
      'Lamb Trotters': 50,
      'كوارع غنم': 50,
      'Lamb Tripe': 35,
      'كرشة غنم': 35,
    };
  }

  double _calculateTotalPrice(BuildContext context) {
    final basePrice = double.tryParse(price) ?? 0;
    final additionsCubit = context.read<AdditionsCubit>();
    final additions = additionsCubit.getAdditions(name);
    final additionPrices = _getAdditionPrices();

    double additionsTotal = 0;
    for (var addition in additions) {
      additionsTotal += additionPrices[addition] ?? 0;
    }

    return basePrice + additionsTotal;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                color: Palette.dayBreakBlue.color7.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.asset(
                  imagePath,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Palette.dayBreakBlue.color7.withOpacity(0.1),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            size: 40.sp,
                            color: Palette.dayBreakBlue.color7.withOpacity(0.5),
                          ),
                          8.verticalSpace,
                          CustomText.s12(
                            'Image not found',
                            color: Palette.dayBreakBlue.color7.withOpacity(0.5),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Content Section
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name on the right
                      CustomText.s20(
                        name,
                        color: Palette.dayBreakBlue.color7,
                        bold: true,
                      ),
                      // Price on the left
                      Row(
                        children: [
                          CustomText.s10(
                            AppLocalizations.of(context)!.priceLabel,
                            color: Palette.neutral.color7,
                          ),
                          4.horizontalSpace,
                          CustomText.s24(
                            price,
                            color: Palette.dayBreakBlue.color7,
                            bold: true,
                          ),
                          4.horizontalSpace,
                          CustomText.s14(
                            AppLocalizations.of(context)!.sar,
                            color: Palette.dayBreakBlue.color7,
                            bold: true,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Additions Display
                  BlocBuilder<AdditionsCubit, Map<String, List<String>>>(
                    builder: (context, state) {
                      final additions = state[name] ?? [];
                      if (additions.isEmpty) return const SizedBox.shrink();

                      return Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Wrap(
                          spacing: 6.w,
                          runSpacing: 6.h,
                          children: additions.map((addition) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText.s10(
                                    addition,
                                    color: Colors.green.shade700,
                                  ),
                                  4.horizontalSpace,
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<AdditionsCubit>()
                                          .removeAddition(name, addition);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 14.sp,
                                      color: Colors.green.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),

                  16.verticalSpace,

                  // Two Outlined Buttons Row
                  Row(
                    children: [
                      // Add to Cart Button
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            final cartCubit = context.read<CartCubit>();
                            final additionsCubit = context
                                .read<AdditionsCubit>();
                            final additions = additionsCubit.getAdditions(name);
                            final additionPrices = _getAdditionPrices();

                            final cartItem = CartItem(
                              productName: name,
                              imagePath: imagePath,
                              basePrice: double.tryParse(price) ?? 0,
                              additions: additions,
                              additionPrices: additionPrices,
                              quantity: 1,
                            );

                            cartCubit.addToCart(cartItem);

                            // Clear additions after adding to cart
                            additionsCubit.clearAdditions(name);

                            toastification.show(
                              context: context,
                              type: ToastificationType.success,
                              style: ToastificationStyle.flat,
                              backgroundColor: Colors.green.shade500,
                              autoCloseDuration: const Duration(seconds: 3),
                              title: CustomText.s14(
                                AppLocalizations.of(context)!.orderAddedToCart,
                                color: Colors.white,
                                bold: true,
                              ),
                              primaryColor: Colors.white,
                              foregroundColor: Colors.white,
                              alignment: Alignment.topCenter,
                              showProgressBar: false,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Palette.dayBreakBlue.color7,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          child: CustomText.s14(
                            AppLocalizations.of(context)!.addtocart,
                            color: Palette.dayBreakBlue.color7,
                          ),
                        ),
                      ),

                      12.horizontalSpace,

                      // Additions Button
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            context.push('${AdditionsScreen.routeName}/$name');
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Palette.dayBreakBlue.color7,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Palette.dayBreakBlue.color7,
                                size: 18.sp,
                              ),
                              4.horizontalSpace,
                              CustomText.s14(
                                AppLocalizations.of(context)!.additions,
                                color: Palette.dayBreakBlue.color7,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  12.verticalSpace,

                  // Full Width Pay Now Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final totalPrice = _calculateTotalPrice(context);
                        final additionsCubit = context.read<AdditionsCubit>();

                        context.push(
                          OrderCompletionScreen.routeName,
                          extra: totalPrice,
                        );

                        // Clear additions after paying
                        additionsCubit.clearAdditions(name);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.dayBreakBlue.color7,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        elevation: 0,
                      ),
                      child: CustomText.s16(
                        AppLocalizations.of(context)!.ordernow,
                        color: Colors.white,
                        bold: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
