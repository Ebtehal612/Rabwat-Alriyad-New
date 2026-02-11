import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../states/base_state.dart';
import '../widgets/text/custom_text.dart';
import '../../app/di/injection_container.dart';
import '../../app/route_manager/app_router.dart';

extension NumbersExtension on num {
  RoundedRectangleBorder get roundedBorder => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(r),
      );

  BorderRadius get borderRadius => BorderRadius.circular(r);
}

extension StringExtension on String {
  void showToast({required ToastificationType type}) {
    final context = sl<AppRouter>().navigatorKey.currentContext;
    if (context == null) return;
    toastification.show(
      context: context,
      title: CustomText.s16(this),
      type: type,
      style: ToastificationStyle.fillColored,
      showProgressBar: false,
      autoCloseDuration: const Duration(seconds: 3),
      closeButtonShowType: CloseButtonShowType.always,
    );
  }
}

extension IsLoadingState on BaseState {
  bool get isLoading => maybeMap(orElse: () => false, loading: (value) => true);
}


