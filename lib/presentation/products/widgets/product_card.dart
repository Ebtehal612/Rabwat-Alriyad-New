import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';
import 'package:go_router/go_router.dart';
import '../pages/details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubits/additions_cubit.dart';

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
                            AppLocalizations.of(context)!.imageNotFound,
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
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
                  Row(
                    children: [
                      // Order Now Button (Filled)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.push(
                              '${DetailsScreen.routeName}/$name',
                              extra: {
                                'productName': name,
                                'productImage': imagePath,
                                'productPrice': price,
                                'actionType': 'orderNow',
                              },
                            );
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
                          child: CustomText.s14(
                            AppLocalizations.of(context)!.ordernow,
                            color: Colors.white,
                            bold: true,
                          ),
                        ),
                      ),
                    ],
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
