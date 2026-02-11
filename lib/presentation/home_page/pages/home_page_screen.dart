import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rabwat_alriyad_new/presentation/cart/pages/cart_screen.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/localization/language_manager.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';
import '../../../app/di/injection_container.dart';
import '../../products/pages/products_screen.dart';
import '../widgets/why_choose_us_section.dart';
import '../widgets/special_offer_section.dart';

class HomePageScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final LanguageManager _languageManager = sl<LanguageManager>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _languageManager,
      child: Consumer<LanguageManager>(
        builder: (context, languageManager, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.h),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          'assets/images/sheep.png',
                          height: 80.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText.s18(
                                AppLocalizations.of(context)!.rabwatalriyad,
                                color: Palette.dayBreakBlue.color7,
                              ),
                              4.verticalSpace,
                              CustomText.s12(
                                AppLocalizations.of(context)!.thebestinKingdom,
                                color: Palette.neutral.color7,
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => languageManager.toggleLanguage(),
                        icon: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: Palette.dayBreakBlue.color7.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: CustomText.s12(
                            languageManager.isArabic ? 'EN' : 'AR',
                            color: Palette.dayBreakBlue.color7,
                            bold: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeroSection(context, languageManager),
                  _buildStatsSection(context),
                  _buildLivestockByTypeSection(context),
                  _buildFeaturedLivestockSection(context),
                  const WhyChooseUsSection(),
                  const SpecialOfferSection(),
                  20.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeroSection(
    BuildContext context,
    LanguageManager languageManager,
  ) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Palette.dayBreakBlue.color7, Palette.dayBreakBlue.color9],
        ),
      ),
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Assets.images.home.image(
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.darken,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Palette.dayBreakBlue.color7.withOpacity(0.8),
                        Palette.dayBreakBlue.color9.withOpacity(0.8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Content
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Palette.dayBreakBlue.color7,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 4.0,
                    ),
                    child: CustomText.s14(
                      AppLocalizations.of(context)!.morethanXanimalsavailable,
                      color: Colors.white,
                    ),
                  ),
                ),
                CustomText.s24(
                  AppLocalizations.of(context)!.livestockTitle,
                  color: Colors.white,
                  bold: true,
                ),
                8.verticalSpace,
                CustomText.s14(
                  AppLocalizations.of(context)!.livestockSubtitle,
                  color: Colors.white.withOpacity(0.9),
                ),
                16.verticalSpace,
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(ProductsScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(250.w, 50.h),
                      backgroundColor: Palette.dayBreakBlue.color7,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText.s14(
                          AppLocalizations.of(context)!.viewAllLivestock,
                          bold: true,
                        ),
                        8.horizontalSpace,
                        Icon(
                          languageManager.isArabic
                              ? Icons.arrow_forward_ios
                              : Icons.arrow_forward_ios,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              context,
              '24/7',
              AppLocalizations.of(context)!.continuoussupport,
              Icons.access_time_filled,
              Palette.dayBreakBlue.color7,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: _buildStatCard(
              context,
              '8500+',
              AppLocalizations.of(context)!.satisfiedcustomer,
              Icons.people,
              Palette.green.shade800,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: _buildStatCard(
              context,
              '100%',
              AppLocalizations.of(context)!.qualityGuarantee,
              Icons.verified,
              Palette.yellow.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String number,
    String label,
    IconData icon,
    Color? iconColor,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 24.sp),
          8.verticalSpace,
          CustomText.s16(
            number,
            color: Palette.dayBreakBlue.color7,
            bold: true,
          ),
          4.verticalSpace,
          CustomText.s12(
            label,
            color: Palette.dayBreakBlue.color7.withOpacity(0.7),
            center: true,
          ),
        ],
      ),
    );
  }

  Widget _buildLivestockByTypeSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.s18(
                  AppLocalizations.of(context)!.livestockByType,
                  color: Palette.dayBreakBlue.color7,
                  bold: true,
                ),
                TextButton(
                  onPressed: () {
                    context.push(ProductsScreen.routeName);
                  },
                  child: Row(
                    children: [
                      CustomText.s14(
                        AppLocalizations.of(context)!.viewAll,
                        color: Palette.dayBreakBlue.color7,
                      ),
                      4.horizontalSpace,
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Palette.dayBreakBlue.color7,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                // First row
                Row(
                  children: [
                    Expanded(
                      child: _buildLivestockTypeCard(
                        context,
                        AppLocalizations.of(context)!.najdi,
                        'assets/images/nagdy.jpg',
                        '1250',
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: _buildLivestockTypeCard(
                        context,
                        AppLocalizations.of(context)!.naeemi,
                        'assets/images/neami.jpg',
                        '1150',
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                // Second row
                Row(
                  children: [
                    Expanded(
                      child: _buildLivestockTypeCard(
                        context,
                        AppLocalizations.of(context)!.harri,
                        'assets/images/hari.jpg',
                        '1150',
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: _buildLivestockTypeCard(
                        context,
                        AppLocalizations.of(context)!.tyus,
                        'assets/images/tyous.png',
                        '1100',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLivestockTypeCard(
    BuildContext context,
    String name,
    String imagePath,
    String price,
  ) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              color: Palette.dayBreakBlue.color7.withOpacity(0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: Image.asset(
                imagePath,
                height: 120.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Palette.dayBreakBlue.color7.withOpacity(0.1),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.r),
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
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s14(
                  name,
                  color: Palette.dayBreakBlue.color7,
                  bold: true,
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 12.sp,
                      color: Palette.dayBreakBlue.color7,
                    ),
                    4.horizontalSpace,
                    CustomText.s12(
                      '$price ${AppLocalizations.of(context)!.sar}',
                      color: Palette.dayBreakBlue.color7,
                      bold: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedLivestockSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomText.s18(
              AppLocalizations.of(context)!.featuredLivestock,
              color: Palette.dayBreakBlue.color7,
              bold: true,
            ),
          ),
          8.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomText.s14(
              AppLocalizations.of(context)!.specialOffers,
              color: Palette.dayBreakBlue.color7.withOpacity(0.7),
            ),
          ),
          16.verticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    color: Palette.dayBreakBlue.color7.withOpacity(0.1),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                        child: Image.asset(
                          'assets/images/cow.png',
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Palette.dayBreakBlue.color7.withOpacity(
                                  0.1,
                                ),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 60.sp,
                                    color: Palette.dayBreakBlue.color7
                                        .withOpacity(0.5),
                                  ),
                                  8.verticalSpace,
                                  CustomText.s14(
                                    'Image not found',
                                    color: Palette.dayBreakBlue.color7
                                        .withOpacity(0.5),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 12.h,
                        right: 12.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: CustomText.s10(
                            AppLocalizations.of(context)!.availableNow,
                            color: Colors.white,
                            bold: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Palette.dayBreakBlue.color7.withOpacity(
                                0.1,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.location_on,
                              color: Palette.dayBreakBlue.color7,
                              size: 16.sp,
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.s16(
                                  AppLocalizations.of(context)!.localcow,
                                  color: Palette.dayBreakBlue.color7,
                                  bold: true,
                                ),
                                4.verticalSpace,
                                CustomText.s12(
                                  '${AppLocalizations.of(context)!.years} 4 • ${AppLocalizations.of(context)!.months} 6',
                                  color: Palette.dayBreakBlue.color7
                                      .withOpacity(0.7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.s20(
                                '1250 ${AppLocalizations.of(context)!.sar}',
                                color: Palette.dayBreakBlue.color7,
                                bold: true,
                              ),
                              4.verticalSpace,
                              CustomText.s12(
                                AppLocalizations.of(context)!.saudiRiyal,
                                color: Palette.dayBreakBlue.color7.withOpacity(
                                  0.7,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.push(CartScreen.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Palette.dayBreakBlue.color7,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 12.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomText.s12(
                                  AppLocalizations.of(context)!.addtocart,
                                ),
                                8.horizontalSpace,
                                Icon(Icons.arrow_forward_ios, size: 16.sp),
                              ],
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
        ],
      ),
    );
  }
}
