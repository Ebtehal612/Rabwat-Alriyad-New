import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rabwat_alriyad_new/presentation/products/pages/products_screen.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/app_bars/custom_app_bar.dart';
import '../../../core/widgets/text/custom_text.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubits/additions_cubit.dart';
import '../../../core/cubits/cart_cubit.dart';
import '../../../core/models/cart_item.dart';
import '../../order_completion/pages/order_completion_screen.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/option_chip.dart';
import '../widgets/section_header.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';
  final String productName;
  final String productImage;
  final String productPrice;
  final String actionType; // 'addToCart' or 'orderNow'

  const DetailsScreen({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.actionType,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _quantity = 1;
  String _selectedSize = 'small'; // Default selection
  String _selectedCuttingMethod = 'grilled_whole'; // Default selection
  String _selectedPackaging = 'without'; // Default selection
  String _selectedHead = 'without'; // Default selection
  final TextEditingController _notesController = TextEditingController();

  static Map<String, double> _getAdditionPrices() {
    return {
      'Lamb Liver': 85,
      'كبدة غنم': 85,
      'Lamb Trotters': 50,
      'كوارع غنم': 50,
      'Lamb Tripe': 35,
      'كرشة غنم': 35,
    };
  }

  double _calculateTotalPrice(BuildContext context) {
    final basePrice = double.tryParse(widget.productPrice) ?? 0;
    final additionsCubit = context.read<AdditionsCubit>();
    final additions = additionsCubit.getAdditions(widget.productName);
    final additionPrices = _getAdditionPrices();

    double additionsTotal = 0;
    for (var addition in additions) {
      additionsTotal += additionPrices[addition] ?? 0;
    }

    return (basePrice + additionsTotal) * _quantity;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

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
          widget.productName,
          color: Palette.dayBreakBlue.color7,
          bold: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  widget.productImage,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            20.verticalSpace,

            // Product Name and Price with Quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Name and Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s20(
                      widget.productName,
                      color: Palette.dayBreakBlue.color7,
                      bold: true,
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        CustomText.s10(
                          localizations.priceLabel,
                          color: Palette.neutral.color7,
                        ),
                        4.horizontalSpace,
                        CustomText.s20(
                          widget.productPrice,
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
                  ],
                ),
                // Quantity Selector
                QuantitySelector(
                  label: localizations.quantity,
                  quantity: _quantity,
                  onIncrement: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                  onDecrement: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                      });
                    }
                  },
                ),
              ],
            ),

            24.verticalSpace,

            // Size Section
            SectionHeader(title: localizations.size),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                OptionChip(
                  label:
                      '${localizations.small} (${localizations.upTo} 15${localizations.kg})',
                  isSelected: _selectedSize == 'small',
                  onTap: () => setState(() => _selectedSize = 'small'),
                  isFilled: true,
                ),
                OptionChip(
                  label:
                      '${localizations.medium} (${localizations.upTo} 20${localizations.kg})',
                  isSelected: _selectedSize == 'medium',
                  onTap: () => setState(() => _selectedSize = 'medium'),
                ),
                OptionChip(
                  label:
                      '${localizations.large} (${localizations.upTo} 25${localizations.kg})',
                  isSelected: _selectedSize == 'large',
                  onTap: () => setState(() => _selectedSize = 'large'),
                ),
                OptionChip(
                  label:
                      '${localizations.extraLarge} (${localizations.upTo} 30${localizations.kg})',
                  isSelected: _selectedSize == 'extraLarge',
                  onTap: () => setState(() => _selectedSize = 'extraLarge'),
                ),
              ],
            ),

            24.verticalSpace,

            // Cutting Method Section
            SectionHeader(title: localizations.cuttingMethod),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                OptionChip(
                  label: '${localizations.grilled} - ${localizations.whole}',
                  isSelected: _selectedCuttingMethod == 'grilled_whole',
                  onTap: () =>
                      setState(() => _selectedCuttingMethod = 'grilled_whole'),
                  isFilled: true,
                ),
                OptionChip(
                  label:
                      '${localizations.grilled} - ${localizations.withoutFat}',
                  isSelected: _selectedCuttingMethod == 'grilled_no_fat',
                  onTap: () =>
                      setState(() => _selectedCuttingMethod = 'grilled_no_fat'),
                ),
                OptionChip(
                  label: localizations.minced,
                  isSelected: _selectedCuttingMethod == 'minced',
                  onTap: () =>
                      setState(() => _selectedCuttingMethod = 'minced'),
                ),
                OptionChip(
                  label:
                      '${localizations.fourPieces} - ${localizations.fourPieces}',
                  isSelected: _selectedCuttingMethod == 'four_pieces',
                  onTap: () =>
                      setState(() => _selectedCuttingMethod = 'four_pieces'),
                ),
                OptionChip(
                  label:
                      '${localizations.preferredCut} ${localizations.bigSmall} - ${localizations.thighs}',
                  isSelected: _selectedCuttingMethod == 'preferred_thighs',
                  onTap: () => setState(
                    () => _selectedCuttingMethod = 'preferred_thighs',
                  ),
                ),
                OptionChip(
                  label:
                      '${localizations.threePieces} - ${localizations.smallPieces}',
                  isSelected: _selectedCuttingMethod == 'three_small',
                  onTap: () =>
                      setState(() => _selectedCuttingMethod = 'three_small'),
                ),
                OptionChip(
                  label: localizations.detailedCutting,
                  isSelected: _selectedCuttingMethod == 'detailed',
                  onTap: () =>
                      setState(() => _selectedCuttingMethod = 'detailed'),
                ),
                OptionChip(
                  label:
                      '${localizations.preferredCut} ${localizations.smallMedium} - ${localizations.complete}',
                  isSelected: _selectedCuttingMethod == 'preferred_complete',
                  onTap: () => setState(
                    () => _selectedCuttingMethod = 'preferred_complete',
                  ),
                ),
              ],
            ),

            24.verticalSpace,

            // Packaging Section
            SectionHeader(title: localizations.packaging),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                OptionChip(
                  label: localizations.withoutPackaging,
                  isSelected: _selectedPackaging == 'without',
                  onTap: () => setState(() => _selectedPackaging = 'without'),
                  isFilled: true,
                ),
                OptionChip(
                  label: localizations.wrapped,
                  isSelected: _selectedPackaging == 'wrapped',
                  onTap: () => setState(() => _selectedPackaging = 'wrapped'),
                ),
              ],
            ),

            24.verticalSpace,

            // Head Section
            SectionHeader(title: localizations.head),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                OptionChip(
                  label: localizations.withoutHead,
                  isSelected: _selectedHead == 'without',
                  onTap: () => setState(() => _selectedHead = 'without'),
                  isFilled: true,
                ),
                OptionChip(
                  label: localizations.withHead,
                  isSelected: _selectedHead == 'with',
                  onTap: () => setState(() => _selectedHead = 'with'),
                ),
                OptionChip(
                  label: localizations.mixed,
                  isSelected: _selectedHead == 'mixed',
                  onTap: () => setState(() => _selectedHead = 'mixed'),
                ),
              ],
            ),

            24.verticalSpace,

            // Additions Section
            SectionHeader(title: localizations.additions),

            // Additions List
            ...additions.map((item) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        item['image'],
                        width: 250.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    12.verticalSpace,
                    CustomText.s18(
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
                        CustomText.s16(
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
                    BlocBuilder<AdditionsCubit, Map<String, List<String>>>(
                      builder: (context, state) {
                        final selectedAdditions =
                            state[widget.productName] ?? [];
                        final isSelected = selectedAdditions.contains(
                          item['name'],
                        );

                        return ElevatedButton(
                          onPressed: () {
                            if (isSelected) {
                              additionsCubit.removeAddition(
                                widget.productName,
                                item['name'],
                              );
                              toastification.show(
                                context: context,
                                type: ToastificationType.info,
                                style: ToastificationStyle.flat,
                                autoCloseDuration: const Duration(seconds: 2),
                                title: CustomText.s14(
                                  '${item['name']} ${localizations.removed}',
                                  color:  Colors.red.shade400,
                                  bold: true,
                                ),
                                foregroundColor: Colors.red.shade400,
                                primaryColor: Colors.red,
                                alignment: Alignment.topCenter,
                                showProgressBar: false,
                              );
                            } else {
                              additionsCubit.addAddition(
                                widget.productName,
                                item['name'],
                              );
                              toastification.show(
                                context: context,
                                type: ToastificationType.success,
                                style: ToastificationStyle.flat,
                                autoCloseDuration: const Duration(seconds: 2),
                                title: CustomText.s14(
                                  localizations.itemAdded(item['name']),
                                  color: Colors.white,
                                  bold: true,
                                ),
                                backgroundColor: Colors.green.shade500,
                                primaryColor: Colors.white,
                                foregroundColor: Colors.white,
                                alignment: Alignment.topCenter,
                                showProgressBar: false,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected
                                ? Colors.green
                                : Palette.dayBreakBlue.color7,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 48.w,
                              vertical: 12.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isSelected ? Icons.check : Icons.add,
                                size: 18.sp,
                                color: Colors.white,
                              ),
                              8.horizontalSpace,
                              CustomText.s14(
                                isSelected
                                    ? localizations.added
                                    : localizations.addToOrder,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }).toList(),

            24.verticalSpace,

            // Order Notes Section
            SectionHeader(title: localizations.orderNotes),
            TextField(
              controller: _notesController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: localizations.writeNotesHere,
                filled: true,
                fillColor: Palette.neutral.color2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: Palette.dayBreakBlue.color7,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: Palette.dayBreakBlue.color7,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: Palette.dayBreakBlue.color7,
                    width: 2,
                  ),
                ),
                hintStyle: TextStyle(
                  color: Palette.neutral.color7,
                  fontSize: 14.sp,
                ),
                contentPadding: EdgeInsets.all(16.w),
              ),
              style: TextStyle(
                color: Palette.dayBreakBlue.color7,
                fontSize: 14.sp,
              ),
            ),

            24.verticalSpace,

            // Bottom Section with Total Price and Buttons
            // Total Price
            BlocBuilder<AdditionsCubit, Map<String, List<String>>>(
              builder: (context, state) {
                final totalPrice = _calculateTotalPrice(context);
                return Center(
                  child: CustomText.s20(
                    '${localizations.totalPrice}: ${totalPrice.toStringAsFixed(0)} ${localizations.sar}',
                    color: Palette.dayBreakBlue.color7,
                    bold: true,
                  ),
                );
              },
            ),

            16.verticalSpace,

            // Proceed to Payment Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final totalPrice = _calculateTotalPrice(context);

                  context.push(
                    OrderCompletionScreen.routeName,
                    extra: totalPrice,
                  );

                  // Clear additions after navigating
                  additionsCubit.clearAdditions(widget.productName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Palette.dayBreakBlue.color7,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  elevation: 0,
                ),
                child: CustomText.s16(
                  localizations.proceedToPayment,
                  color: Colors.white,
                  bold: true,
                ),
              ),
            ),

            12.verticalSpace,

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  final cartCubit = context.read<CartCubit>();
                  final additions = additionsCubit.getAdditions(
                    widget.productName,
                  );
                  final additionPrices = _getAdditionPrices();

                  final cartItem = CartItem(
                    productName: widget.productName,
                    imagePath: widget.productImage,
                    basePrice: double.tryParse(widget.productPrice) ?? 0,
                    additions: additions,
                    additionPrices: additionPrices,
                    quantity: _quantity,
                    size: _selectedSize,
                    cuttingMethod: _selectedCuttingMethod,
                    packaging: _selectedPackaging,
                    head: _selectedHead,
                    notes: _notesController.text,
                  );

                  cartCubit.addToCart(cartItem);

                  // Clear additions after adding to cart
                  additionsCubit.clearAdditions(widget.productName);

                  toastification.show(
                    context: context,
                    type: ToastificationType.success,
                    style: ToastificationStyle.flat,
                    autoCloseDuration: const Duration(seconds: 3),
                    title: CustomText.s14(
                      localizations.orderAddedToCart,
                      color: Colors.white,
                      bold: true,
                    ),
                    backgroundColor: Colors.green.shade500,
                    primaryColor: Colors.white,
                    foregroundColor: Colors.white,
                    alignment: Alignment.topCenter,
                    showProgressBar: false,
                  );

                  // Go back to ProductsScreen
                  context.go(ProductsScreen.routeName);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Palette.dayBreakBlue.color7,
                    width: 1.5,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: CustomText.s16(
                  localizations.addtocart,
                  color: Palette.dayBreakBlue.color7,
                  bold: true,
                ),
              ),
            ),

            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
