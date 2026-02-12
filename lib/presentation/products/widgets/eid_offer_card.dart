import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';
import '../../order_completion/pages/order_completion_screen.dart';

class EidOfferCard extends StatelessWidget {
  const EidOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Palette.dayBreakBlue.color9, // Dark blue background
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Palette.dayBreakBlue.color7,
            Palette.dayBreakBlue.color9,
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Icon(
              Icons.card_giftcard,
              size: 48.sp,
              color: Colors.white,
            ),
          ),
          16.verticalSpace,
          CustomText.s20(
            AppLocalizations.of(context)!.eidExclusiveOffers,
            color: Colors.white,
            bold: true,
          ),
          8.verticalSpace,
          CustomText.s14(
            AppLocalizations.of(context)!.bookNowDiscount,
            color: Colors.white,
            center: true,
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimerBox(
                  context, '15', AppLocalizations.of(context)!.seconds),
              _buildSeparator(),
              _buildTimerBox(
                  context, '32', AppLocalizations.of(context)!.minutes),
              _buildSeparator(),
              _buildTimerBox(
                  context, '08', AppLocalizations.of(context)!.hours),
            ],
          ),
          24.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push(OrderCompletionScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // Gold/Yellow
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText.s16(
                    AppLocalizations.of(context)!.bookYourSacrifice,
                    bold: true,
                    color: Colors.black,
                  ),
                  8.horizontalSpace,
                  Icon(Icons.shopping_bag, size: 20.sp, color: Colors.black),
                ],
              ),
            ),
          ),
          16.verticalSpace,
          CustomText.s12(
            AppLocalizations.of(context)!.offerValidUntil,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildTimerBox(BuildContext context, String value, String unit) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(minWidth: 60.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          CustomText.s18(
            value,
            color: Colors.white,
            bold: true,
          ),
          4.verticalSpace,
          CustomText.s10(
            unit,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: CustomText.s18(
        ':',
        color: Colors.white,
        bold: true,
      ),
    );
  }
}
