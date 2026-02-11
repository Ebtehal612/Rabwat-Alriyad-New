import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/localization/localization_manager.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/app_bars/custom_app_bar.dart';
import '../../../core/widgets/fields/custom_input.dart';
import '../../../core/widgets/text/custom_text.dart';
import 'package:file_picker/file_picker.dart';
import '../../../app/di/injection_container.dart';
import '../../../core/utils/validators.dart';

class OrderCompletionScreen extends StatefulWidget {
  static const routeName = '/order-completion';
  final double? totalPrice;
  
  const OrderCompletionScreen({super.key, this.totalPrice});

  @override
  State<OrderCompletionScreen> createState() => _OrderCompletionScreenState();
}

class _OrderCompletionScreenState extends State<OrderCompletionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _discountController = TextEditingController();

  String _selectedPaymentMethod = 'bank'; // 'bank' or 'cash'
  PlatformFile? _receiptFile;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _phoneController.addListener(_validateForm);
    _addressController.addListener(_validateForm);
    _discountController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      final isFieldsValid = _nameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _addressController.text.isNotEmpty;

      final isPaymentValid = _selectedPaymentMethod == 'cash' ||
          (_selectedPaymentMethod == 'bank' && _receiptFile != null);

      _isButtonEnabled = isFieldsValid && isPaymentValid;
    });
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _receiptFile = result.files.first;
      });
      _validateForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final validators = sl<Validators>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        center: true,
        showBackButton: true,
        onBack: () => Navigator.pop(context),
        child: CustomText.s18(
          localizations.orderCompletion,
          color: Palette.dayBreakBlue.color7,
          bold: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wallet Header
              Center(
                child: Container(
                  width: 300.w,
                  height: 220.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Palette.dayBreakBlue.color7,
                        Palette.dayBreakBlue.color9,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset(
                      'assets/images/vector.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Center(
                  child: Column(
                children: [
                  CustomText.s22(
                    '${(widget.totalPrice ?? 7150).toStringAsFixed(0)} ${lz.sar}',
                    bold: true,
                    color: Palette.dayBreakBlue.color7,
                  ),
                  10.verticalSpace,
                  CustomText.s13(
                    lz.totalamountrequired,
                    color: Palette.neutral.color6,
                  )
                ],
              )),
              15.verticalSpace,
              // Full Name Field
              CustomInput(
                controller: _nameController,
                title: localizations.fullName,
                hint: localizations.enterFullName,
                hintColor: Palette.neutral.color7,
                prefix:
                    Icon(Icons.person_outline, color: Palette.neutral.color7),
                backgroundColor: Palette.neutral.color2,
                showAsterisk: false,
                validator: (val) =>
                    validators.required(val, title: localizations.fullName),
              ),
              20.verticalSpace,

              // Mobile Number Field
              CustomInput(
                controller: _phoneController,
                title: localizations.mobileNumber,
                hint: '05xxxxxxxx',
                hintColor: Palette.neutral.color7,
                prefix: Icon(Icons.phone_android_outlined,
                    color: Palette.neutral.color7),
                backgroundColor: Palette.neutral.color2,
                keyboardType: TextInputType.phone,
                showAsterisk: false,
                validator: (val) => validators.saudiMobile(val),
              ),
              20.verticalSpace,

              // Detailed Address Field
              CustomInput(
                controller: _addressController,
                title: localizations.detailedAddress,
                hint: localizations.enterDetailedAddress,
                hintColor: Palette.neutral.color7,
                prefix: Icon(Icons.location_on_outlined,
                    color: Palette.neutral.color7),
                backgroundColor: Palette.neutral.color2,
                showAsterisk: false,
                validator: (val) => validators.required(val,
                    title: localizations.detailedAddress),
              ),
              20.verticalSpace,

              // Discount Code Field
              CustomInput(
                controller: _discountController,
                title: localizations.discountCode,
                hint: localizations.enterDiscountCode,
                hintColor: Palette.neutral.color7,
                prefix:
                    Icon(Icons.qr_code_outlined, color: Palette.neutral.color7),
                backgroundColor: Palette.neutral.color2,
                showAsterisk: false,
                required: false,
              ),
              30.verticalSpace,

              // Payment Method Selection
              CustomText.s16(
                localizations.choosePaymentMethod,
                bold: true,
                color: Palette.dayBreakBlue.color7,
              ),
              15.verticalSpace,

              // Bank Transfer Option
              InkWell(
                onTap: () {
                  setState(() => _selectedPaymentMethod = 'bank');
                  _validateForm();
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    _selectedPaymentMethod == 'bank'
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                    color: _selectedPaymentMethod == 'bank'
                                        ? Palette.dayBreakBlue.color7
                                        : Palette.neutral.color5,
                                    size: 26.sp,
                                  ),
                                  10.horizontalSpace,
                                  CustomText.s14(
                                    localizations.bankTransfer,
                                    color: Palette.dayBreakBlue.color7,
                                    bold: true,
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              InkWell(
                                onTap: _pickImage,
                                child: Row(
                                  children: [
                                    26.horizontalSpace,
                                    Icon(Icons.add_circle_outline,
                                        size: 20.sp,
                                        color: _receiptFile != null
                                            ? Palette.dayBreakBlue.color7
                                            : Palette.neutral.color7),
                                    4.horizontalSpace,
                                    Expanded(
                                      child: CustomText.s12(
                                        _receiptFile?.name ??
                                            localizations.attachReceipt,
                                        color: _receiptFile != null
                                            ? Palette.dayBreakBlue.color7
                                            : Palette.neutral.color7,
                                        overflow: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              15.verticalSpace,

              // Cash on Delivery Option
              InkWell(
                onTap: () {
                  setState(() => _selectedPaymentMethod = 'cash');
                  _validateForm();
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15.h),
                        child: Row(
                          children: [
                            Icon(
                              _selectedPaymentMethod == 'cash'
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: _selectedPaymentMethod == 'cash'
                                  ? Palette.dayBreakBlue.color7
                                  : Palette.neutral.color5,
                              size: 26.sp,
                            ),
                            10.horizontalSpace,
                            CustomText.s14(
                              localizations.cashOnDelivery,
                              color: Palette.dayBreakBlue.color7,
                              bold: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              40.verticalSpace,

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            // Handle order submission
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled
                        ? Palette.dayBreakBlue.color9
                        : Palette.neutral.color5,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Palette.neutral.color4,
                  ),
                  child: CustomText.s16(
                    localizations.sendOrder,
                    bold: true,
                    color: _isButtonEnabled
                        ? Colors.white
                        : Palette.neutral.color7,
                  ),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
