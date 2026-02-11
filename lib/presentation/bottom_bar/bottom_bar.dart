import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/theme/palette.dart';

class BottomBar extends StatelessWidget {
  static const routeName = '/bottom-bar';
  final StatefulNavigationShell navigationShell;

  const BottomBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ]),
        child: NavigationBar(
          height: 70.h,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon:
                  Icon(Icons.home, color: Palette.dayBreakBlue.color7),
              label: AppLocalizations.of(context)!.home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.grid_view),
              selectedIcon:
                  Icon(Icons.grid_view, color: Palette.dayBreakBlue.color7),
              label: AppLocalizations.of(context)!.products,
            ),
            NavigationDestination(
              icon: const Icon(Icons.shopping_cart_outlined),
              selectedIcon:
                  Icon(Icons.shopping_cart, color: Palette.dayBreakBlue.color7),
              label: AppLocalizations.of(context)!.cart,
            ),
            NavigationDestination(
              icon: const Icon(Icons.support_agent),
              selectedIcon:
                  Icon(Icons.support_agent, color: Palette.dayBreakBlue.color7),
              label: AppLocalizations.of(context)!.contactus,
            ),
          ],
        ),
      ),
    );
  }
}
