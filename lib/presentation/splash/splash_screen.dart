import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../home_page/pages/home_page_screen.dart';

import '../../core/theme/palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash-screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.goNamed(HomePageScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: Palette.dayBreakBlue.color7,),
      ),
    );
  }
}
