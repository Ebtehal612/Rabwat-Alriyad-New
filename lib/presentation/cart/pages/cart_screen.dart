import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/palette.dart';
import '../../../core/localization/localization_manager.dart';
import '../../order_completion/pages/order_completion_screen.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        leading: BackButton(color: Palette.dayBreakBlue.color7),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                _buildMockItems(),
              ],
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildMockItems() {
    return Column(
      children: [
        CartItemWidget(
          title: lz.naeemi,
          imagePath: 'assets/images/neami.jpg',
          price: 1150,
          quantity: 2,
          subtotal: 2300,
          onRemove: () {},
          onIncrement: () {},
          onDecrement: () {},
        ),
        CartItemWidget(
          title: lz.najdi,
          imagePath: 'assets/images/nagdy.jpg',
          price: 1250,
          quantity: 3,
          subtotal: 3750,
          onRemove: () {},
          onIncrement: () {},
          onDecrement: () {},
        ),
        CartItemWidget(
          title: lz.tyus,
          imagePath: 'assets/images/tyous.png',
          price: 1100,
          quantity: 1,
          subtotal: 1100,
          onRemove: () {},
          onIncrement: () {},
          onDecrement: () {},
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
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
                '7,150 ${lz.saudiRiyal}',
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
                context.push(OrderCompletionScreen.routeName);
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
