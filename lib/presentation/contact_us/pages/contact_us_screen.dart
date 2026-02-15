import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rabwat_alriyad_new/core/widgets/text/custom_text.dart';
import 'package:rabwat_alriyad_new/presentation/home_page/pages/home_page_screen.dart';
import '../../../app/di/injection_container.dart';
import '../../../core/localization/localization_manager.dart';
import '../../../core/utils/validators.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/buttons/custom_button.dart';
import '../../../core/widgets/fields/custom_input.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/contact-us';

  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _phoneController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _messageController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final validators = sl<Validators>();
    setState(() {
      final isNameValid = _nameController.text.trim().isNotEmpty;
      final isPhoneValid =
          validators.saudiMobile(_phoneController.text) == null;
      final isEmailValid = validators.email(_emailController.text) == null;
      final isMessageValid = _messageController.text.trim().isNotEmpty;

      _isButtonEnabled =
          isNameValid && isPhoneValid && isEmailValid && isMessageValid;
    });
  }

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
                color: Colors.white,
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
                color: const Color(0xff3B6C4C).withOpacity(0.3),
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
                        color: Colors.white.withOpacity(0.2),
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
                              color: Colors.white,
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
                  color: Palette.dayBreakBlue.color1.withOpacity(0.5),
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
        color: Colors.white.withOpacity(0.2),
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
    final lz = AppLocalizations.of(context)!;
    final validators = sl<Validators>();

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
                color: Colors.black.withOpacity(0.03),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomInput(
                  title: lz.fullName,
                  hint: lz.enterFullName,
                  hintColor: Palette.neutral.color7,
                  controller: _nameController,
                  backgroundColor: const Color(0xffF9F9F9),
                  border: true,
                  prefix: Icon(Icons.person_outline, color: Colors.grey[400]),
                  validator: (val) =>
                      validators.required(val, title: lz.fullName),
                ),
                SizedBox(height: 20.h),
                CustomInput(
                  controller: _phoneController,
                  title: lz.mobileNumber,
                  hint: '05xxxxxxxx',
                  hintColor: Palette.neutral.color7,
                  prefix: Icon(Icons.phone_android, color: Colors.grey[400]),
                  backgroundColor: const Color(0xffF9F9F9),
                  border: true,
                  keyboardType: TextInputType.phone,
                  validator: (val) => validators.saudiMobile(val),
                ),
                SizedBox(height: 20.h),
                CustomInput(
                  title: lz.emailAddress,
                  hint: lz.emailHint,
                  hintColor: Palette.neutral.color7,
                  controller: _emailController,
                  backgroundColor: const Color(0xffF9F9F9),
                  border: true,
                  prefix: Icon(Icons.email_outlined, color: Colors.grey[400]),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => validators.email(val),
                ),
                SizedBox(height: 20.h),
                CustomInput(
                  title: lz.message,
                  hint: lz.writeMessageHere,
                  hintColor: Palette.neutral.color7,
                  controller: _messageController,
                  backgroundColor: const Color(0xffF9F9F9),
                  border: true,
                  keyboardType: TextInputType.multiline,
                  validator: (val) =>
                      validators.required(val, title: lz.message),
                ),
                SizedBox(height: 32.h),
                CustomButton(
                  text: lz.sendMessageButton,
                  onPressed: _isButtonEnabled
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            _showSuccessDialog(context);
                          }
                        }
                      : null,
                  icon: Icon(
                    Icons.send_rounded,
                    color: _isButtonEnabled ? Colors.white : Colors.grey,
                    size: 20.sp,
                  ),
                  backgroundColor: _isButtonEnabled
                      ? Palette.dayBreakBlue.color7
                      : Palette.neutral.color4,
                  borderRadius: 16.r,
                  isTextBold: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            height: 410.h,
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Success Icon
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 50.sp),
                  ),

                  24.verticalSpace,

                  // Success Title
                  CustomText.s20(
                    localizations.messageSubmittedSuccessfully,
                    color: Palette.dayBreakBlue.color7,
                    bold: true,
                  ),

                  16.verticalSpace,

                  // Success Message
                  CustomText.s14(
                    localizations.messageSubmittedMessage,
                    color: Palette.neutral.color7,
                  ),

                  32.verticalSpace,

                  // OK Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        context.go(
                          HomePageScreen.routeName,
                        ); // Navigate to homepage
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.dayBreakBlue.color7,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: CustomText.s16(
                        localizations.ok,
                        color: Colors.white,
                        bold: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
