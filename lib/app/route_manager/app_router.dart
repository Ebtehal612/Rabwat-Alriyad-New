import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rabwat_alriyad_new/presentation/bottom_bar/bottom_bar.dart';
import 'package:rabwat_alriyad_new/presentation/cart/pages/cart_screen.dart';
import 'package:rabwat_alriyad_new/presentation/contact_us/pages/contact_us_screen.dart';
import 'package:rabwat_alriyad_new/presentation/home_page/pages/home_page_screen.dart';
import 'package:rabwat_alriyad_new/presentation/order_completion/pages/order_completion_screen.dart';
import 'package:rabwat_alriyad_new/presentation/products/pages/details_screen.dart';
import 'package:rabwat_alriyad_new/presentation/products/pages/products_screen.dart';
import 'package:rabwat_alriyad_new/presentation/splash/splash_screen.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // ignore: unused_field
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

  String get _initialLocation {
    return SplashScreen
        .routeName; // Always start with splash, splash decides where to go
  }

  late final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: _initialLocation,
    routes: [
      GoRoute(
        name: OrderCompletionScreen.routeName,
        path: OrderCompletionScreen.routeName,
        pageBuilder: (context, state) {
          final totalPrice = state.extra as double?;
          return _buildPageWithTransition(
            OrderCompletionScreen(totalPrice: totalPrice),
            state,
          );
        },
      ),
      GoRoute(
        name: SplashScreen.routeName,
        path: SplashScreen.routeName,
        pageBuilder: (_, state) =>
            _buildPageWithTransition(const SplashScreen(), state),
      ),
      GoRoute(
        name: DetailsScreen.routeName,
        path: '${DetailsScreen.routeName}/:productName',
        pageBuilder: (context, state) {
          final productName = state.pathParameters['productName'] ?? '';
          final extra = state.extra as Map<String, dynamic>?;
          return _buildPageWithTransition(
            DetailsScreen(
              productName: productName,
              productImage: extra?['productImage'] ?? '',
              productPrice: extra?['productPrice'] ?? '0',
              actionType: extra?['actionType'] ?? 'addToCart',
            ),
            state,
          );
        },
      ),
      GoRoute(
        name: CartScreen.routeName,
        path: CartScreen.routeName,
        pageBuilder: (context, state) =>
            _buildPageWithTransition(const CartScreen(), state),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: HomePageScreen.routeName,
                path: HomePageScreen.routeName,
                pageBuilder: (context, state) =>
                    _buildPageWithTransition(const HomePageScreen(), state),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: ProductsScreen.routeName,
                path: ProductsScreen.routeName,
                pageBuilder: (context, state) =>
                    _buildPageWithTransition(const ProductsScreen(), state),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: ContactUsScreen.routeName,
                path: ContactUsScreen.routeName,
                pageBuilder: (context, state) =>
                    _buildPageWithTransition(const ContactUsScreen(), state),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  CustomTransitionPage _buildPageWithTransition(
    Widget child,
    GoRouterState state,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
