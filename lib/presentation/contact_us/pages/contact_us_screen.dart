import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import '../../../app/di/injection_container.dart';
import '../../../core/localization/localization_manager.dart';
import '../../../core/utils/validators.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/buttons/custom_button.dart';
import '../../../core/widgets/fields/custom_input.dart';

class ContactUsScreen extends StatelessWidget {
  static const routeName = '/contact-us';

  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lz = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        title: Text(
          lz.contactUs,
          style: TextStyle(
            color: Palette.dayBreakBlue.color7,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Palette.dayBreakBlue.color7),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Transform.translate(
              offset: Offset(0, -30.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    50.verticalSpace,
                    _buildWhatsAppButton(),
                    SizedBox(height: 24.h),
                    _buildEmailSection(),
                    SizedBox(height: 24.h),
                    _buildSocialMediaSection(),
                    SizedBox(height: 24.h),
                    _buildContactForm(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 230.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Palette.dayBreakBlue.color7, Palette.dayBreakBlue.color9],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/sheepwhitenum.png',
            height: 110.h,
            width: 110.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.h),
          Text(
            lz.rabwatalriyad,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              lz.livestockSubtitle,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white.withValues(alpha: 0.8),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatsAppButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.perm_phone_msg, color: Palette.dayBreakBlue.color7),
            SizedBox(width: 8.w),
            Text(
              lz.connectWithUsDirectly,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Palette.dayBreakBlue.color7,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff3B6C4C), // WhatsApp brand color kept as is
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff3B6C4C).withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                const number = '966550477902';
                final url = Uri.parse('https://wa.me/$number');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              borderRadius: BorderRadius.circular(16.r),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Image.asset(
                        'assets/images/whatsapp.png',
                        height: 32.h,
                        width: 32.h,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lz.whatsapp,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            lz.instantChat,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildIconContainer(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.alternate_email, color: Palette.dayBreakBlue.color7),
            SizedBox(width: 8.w),
            Text(
              lz.additionalContactMethods,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Palette.dayBreakBlue.color7,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: Palette.dayBreakBlue.color1.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.email_outlined,
                  color: Palette.dayBreakBlue.color7,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lz.emailAddress,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'rakanabdallah85@gmail.com',
                      style: TextStyle(
                        color: Palette.dayBreakBlue.color7,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconContainer(IconData icon) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, color: Colors.white, size: 20.sp),
    );
  }

  Widget _buildSocialMediaSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.share, color: Palette.dayBreakBlue.color7, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              lz.followUs,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Palette.dayBreakBlue.color7,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialItem('assets/images/insta.png', lz.instagram),
            SizedBox(width: 24.w),
            _buildSocialItem('assets/images/snap.png', lz.snapchat),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialItem(String imagePath, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(imagePath, height: 40.h),
            SizedBox(height: 12.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Palette.dayBreakBlue.color7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.message_outlined, color: Palette.dayBreakBlue.color7),
            SizedBox(width: 8.w),
            Text(
              lz.sendMessage,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Palette.dayBreakBlue.color7,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              CustomInput(
                title: lz.fullName,
                hint: lz.enterFullName,
                hintColor: Palette.neutral.color7,
                controller: TextEditingController(),
                backgroundColor: const Color(0xffF9F9F9),
                border: true,
                prefix: Icon(Icons.person_outline, color: Colors.grey[400]),
              ),
              SizedBox(height: 20.h),
              CustomInput(
                title: lz.mobileNumber,
                hint: lz.mobileHint,
                hintColor: Palette.neutral.color7,
                controller: TextEditingController(),
                backgroundColor: const Color(0xffF9F9F9),
                border: true,
                prefix: Icon(Icons.phone_android, color: Colors.grey[400]),
                keyboardType: TextInputType.phone,
                validator: sl<Validators>().saudiMobile,
                inputFormatters: [
                  LibPhonenumberTextFormatter(
                    country: sl<CountryWithPhoneCode>(),
                    inputContainsCountryCode: true,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomInput(
                title: lz.emailAddress,
                hint: lz.emailHint,
                hintColor: Palette.neutral.color7,
                controller: TextEditingController(),
                backgroundColor: const Color(0xffF9F9F9),
                border: true,
                prefix: Icon(Icons.email_outlined, color: Colors.grey[400]),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              CustomInput(
                title: lz.message,
                hint: lz.writeMessageHere,
                hintColor: Palette.neutral.color7,
                controller: TextEditingController(),
                backgroundColor: const Color(0xffF9F9F9),
                border: true,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 32.h),
              CustomButton(
                text: lz.sendMessageButton,
                onPressed: () {},
                icon: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 20.sp,
                ),
                backgroundColor: Palette.dayBreakBlue.color7,
                borderRadius: 16.r,
                isTextBold: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
