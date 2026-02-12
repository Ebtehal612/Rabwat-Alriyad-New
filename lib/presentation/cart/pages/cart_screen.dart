import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabwat_alriyad_new/presentation/products/pages/products_screen.dart';
import '../../../core/theme/palette.dart';
import '../../../core/localization/localization_manager.dart';
import '../../order_completion/pages/order_completion_screen.dart';
import '../widgets/cart_item_widget.dart';
import '../../../core/cubits/cart_cubit.dart';
import '../../../core/models/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lz.cart,
          style: TextStyle(
            color: Palette.dayBreakBlue.color7,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<CartCubit, List<CartItem>>(
        builder: (context, cartItems) {
          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lz.cartEmpty,
                    style: TextStyle(
                      fontSize: 23.sp,
                      color: Palette.neutral.color7,
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          context.go(ProductsScreen.routeName);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Palette.dayBreakBlue.color7),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              lz.shopnow,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Palette.dayBreakBlue.color7,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            5.horizontalSpace,
                            Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Palette.dayBreakBlue.color7,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(20.w),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return CartItemWidget(
                      item: item,
                      onRemove: () {
                        context.read<CartCubit>().removeFromCart(index);
                      },
                      onIncrement: () {
                        context.read<CartCubit>().incrementQuantity(index);
                      },
                      onDecrement: () {
                        context.read<CartCubit>().decrementQuantity(index);
                      },
                    );
                  },
                ),
              ),
              _buildFooter(context, cartItems),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context, List<CartItem> cartItems) {
    final cartCubit = context.read<CartCubit>();
    final total = cartCubit.totalAmount;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${lz.totalAmount}: ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Palette.dayBreakBlue.color7,
                ),
              ),
              Text(
                '${total.toStringAsFixed(0)} ${lz.saudiRiyal}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Palette.dayBreakBlue.color7,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push(OrderCompletionScreen.routeName, extra: total);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.dayBreakBlue.color7,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              child: Text(
                lz.proceedToPayment,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
