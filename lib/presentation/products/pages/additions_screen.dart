import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/app_bars/custom_app_bar.dart';
import '../../../core/widgets/text/custom_text.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubits/additions_cubit.dart';

class AdditionsScreen extends StatelessWidget {
  static const routeName = '/additions';
  final String productName;

  const AdditionsScreen({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final additionsCubit = context.read<AdditionsCubit>();

    final List<Map<String, dynamic>> additions = [
      {
        'name': localizations.liver,
        'image': Assets.images.kebda.path,
        'price': '85',
      },
      {
        'name': localizations.trotters,
        'image': Assets.images.kawarei.path,
        'price': '50',
      },
      {
        'name': localizations.tripe,
        'image': Assets.images.kersha.path,
        'price': '35',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        center: true,
        showBackButton: true,
        onBack: () => Navigator.pop(context),
        child: CustomText.s18(
          localizations.additions,
          color: Palette.dayBreakBlue.color7,
          bold: true,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: additions.length,
        itemBuilder: (context, index) {
          final item = additions[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    item['image'],
                    width: 250.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
                12.verticalSpace,
                CustomText.s20(
                  item['name'],
                  color: Palette.dayBreakBlue.color7,
                  bold: true,
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.s14(
                      localizations.priceColon,
                      color: Palette.dayBreakBlue.color7,
                    ),
                    CustomText.s18(
                      item['price'],
                      color: Palette.dayBreakBlue.color7,
                      bold: true,
                    ),
                    4.horizontalSpace,
                    CustomText.s14(
                      localizations.sar,
                      color: Palette.dayBreakBlue.color7,
                    ),
                  ],
                ),
                12.verticalSpace,
                ElevatedButton(
                  onPressed: () {
                    additionsCubit.addAddition(productName, item['name']);
                    toastification.show(
                      context: context,
                      type: ToastificationType.success,
                      style: ToastificationStyle.flat,
                      backgroundColor: Colors.green.shade500,
                      autoCloseDuration: const Duration(seconds: 3),
                      title: CustomText.s14(
                        localizations.itemAdded(item['name']),
                        color: Colors.white,
                        bold: true,
                      ),
                      primaryColor: Colors.white,
                      foregroundColor: Colors.white,
                      alignment: Alignment.topCenter,
                      showProgressBar: false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.dayBreakBlue.color7,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                  ),
                  child: CustomText.s14(
                    localizations.addToOrder,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
