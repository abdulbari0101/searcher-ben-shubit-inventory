import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/core/constant/app_colors.dart';

class CustomAppBarStyle extends StatelessWidget {
  const CustomAppBarStyle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.whiteColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
