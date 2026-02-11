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
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                color: Palette.dayBreakBlue.color7.withValues(alpha: 0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Image.asset(
                  imagePath,
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            Palette.dayBreakBlue.color7.withValues(alpha: 0.1),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12.r)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            size: 40.sp,
                            color: Palette.dayBreakBlue.color7
                                .withValues(alpha: 0.5),
                          ),
                          8.verticalSpace,
                          CustomText.s12(
                            'Image not found',
                            color: Palette.dayBreakBlue.color7
                                .withValues(alpha: 0.5),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.s18(
                        name,
                        color: Palette.dayBreakBlue.color7,
                        bold: true,
                        overflow: true,
                      ),
                      4.verticalSpace,
                      CustomText.s10(
                        AppLocalizations.of(context)!.priceLabel,
                        color: Palette.neutral.color7,
                      ),
                      4.verticalSpace,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText.s18(
                            price,
                            color: Palette.dayBreakBlue.color7,
                            bold: true,
                          ),
                          4.horizontalSpace,
                          CustomText.s12(
                            AppLocalizations.of(context)!.sar,
                            color: Palette.dayBreakBlue.color7,
                            bold: true,
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      BlocBuilder<AdditionsCubit, Map<String, List<String>>>(
                        builder: (context, state) {
                          final additions = state[name] ?? [];
                          if (additions.isEmpty) return const SizedBox.shrink();
                          return Padding(
                            padding: EdgeInsets.only(top: 4.h),
                            child: CustomText.s9(
                              "+ ${additions.join('، ')}",
                              color: Colors.green,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // Left Side: Buttons and Actions
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Palette.dayBreakBlue.color7,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.w, vertical: 8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                        child: CustomText.s12(
                          AppLocalizations.of(context)!.addtocart,
                          color: Colors.white,
                        ),
                      ),
                      12.verticalSpace,
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              context.push(OrderCompletionScreen.routeName);
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: Palette.dayBreakBlue.color7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 2.h),
                            ),
                            child: CustomText.s10(
                              AppLocalizations.of(context)!.payNow,
                              color: Palette.dayBreakBlue.color7,
                            ),
                          ),
                          10.horizontalSpace,
                          InkWell(
                            onTap: () {
                              context
                                  .push('${AdditionsScreen.routeName}/$name');
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Palette.dayBreakBlue.color7,
                                  size: 20.sp,
                                ),
                                4.horizontalSpace,
                                CustomText.s12(
                                  AppLocalizations.of(context)!.additions,
                                  color: Palette.dayBreakBlue.color7,
                                ),
                              ],
                            ),
                          ),
                        ],
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
