import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Center(
            child: CustomText.s18(
              AppLocalizations.of(context)!.whyChooseUs,
              color: Palette.dayBreakBlue.color7,
              bold: true,
            ),
          ),
          8.verticalSpace,
          Center(
            child: CustomText.s14(
              AppLocalizations.of(context)!.whyChooseUsSubtitle,
              color: Palette.dayBreakBlue.color7.withOpacity(0.7),
            ),
          ),
          20.verticalSpace,
          
          // Features List
          _buildFeatureItem(
            context,
            icon: Icons.verified_outlined,
            iconColor: Colors.orange,
            title: AppLocalizations.of(context)!.guaranteedQuality,
            description: AppLocalizations.of(context)!.guaranteedQualityDesc,
          ),
          16.verticalSpace,
          
          _buildFeatureItem(
            context,
            icon: Icons.trending_down,
            iconColor: Colors.green,
            title: AppLocalizations.of(context)!.competitivePrices,
            description: AppLocalizations.of(context)!.competitivePricesDesc,
          ),
          16.verticalSpace,
          
          _buildFeatureItem(
            context,
            icon: Icons.support_agent,
            iconColor: Palette.dayBreakBlue.color7,
            title: AppLocalizations.of(context)!.support247,
            description: AppLocalizations.of(context)!.support247Desc,
          ),
          16.verticalSpace,
          
          _buildFeatureItem(
            context,
            icon: Icons.local_shipping_outlined,
            iconColor: Colors.blue,
            title: AppLocalizations.of(context)!.fastDelivery,
            description: AppLocalizations.of(context)!.fastDeliveryDesc,
          ),
          16.verticalSpace,
          
          _buildFeatureItem(
            context,
            icon: Icons.health_and_safety_outlined,
            iconColor: Colors.teal,
            title: AppLocalizations.of(context)!.healthGuarantee,
            description: AppLocalizations.of(context)!.healthGuaranteeDesc,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24.sp,
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s16(
                  title,
                  color: Palette.dayBreakBlue.color7,
                  bold: true,
                ),
                8.verticalSpace,
                CustomText.s12(
                  description,
                  color: Palette.dayBreakBlue.color7.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}