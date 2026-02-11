import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';
import '../../order_completion/pages/order_completion_screen.dart';


class SpecialOfferSection extends StatelessWidget {
  const SpecialOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Palette.dayBreakBlue.color7,
              Palette.dayBreakBlue.color9,
            ],
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Palette.dayBreakBlue.color7.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with gift icon
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
                12.horizontalSpace,
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: CustomText.s14(
                    AppLocalizations.of(context)!.specialOffer,
                    color: Colors.white,
                    bold: true,
                  ),
                ),
              ],
            ),
            20.verticalSpace,

            // Main offer text
            CustomText.s20(
              AppLocalizations.of(context)!.discountUpTo,
              color: Colors.white,
              bold: true,
            ),
            8.verticalSpace,

            CustomText.s14(
              AppLocalizations.of(context)!.offerDescription,
              color: Colors.white.withOpacity(0.9),
            ),
            24.verticalSpace,

            // Countdown timer
            Row(
              children: [
                _buildTimeCard(
                  context,
                  label: AppLocalizations.of(context)!.endsin,
                  value: "5 ${AppLocalizations.of(context)!.daysLeft}",
                ),
                12.horizontalSpace,
                _buildTimeCard(
                  context,
                  label: AppLocalizations.of(context)!.remaining,
                  value: "47 ${AppLocalizations.of(context)!.piece}",
                ),
              ],
            ),
            24.verticalSpace,

            // CTA Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.push(OrderCompletionScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Palette.dayBreakBlue.color7,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: CustomText.s16(
                  AppLocalizations.of(context)!.benefitNow,
                  bold: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeCard(BuildContext context,
      {required String value, required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.s12(
            label,
            color: Colors.white.withOpacity(0.8),
          ),
          4.verticalSpace,
          CustomText.s16(
            value,
            color: Colors.white,
            bold: true,
          ),
        ],
      ),
    );
  }
}
