import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class TCardTheme{
  TCardTheme._();

  static final CardTheme lightCardTheme = CardTheme(
    elevation: 1,
    surfaceTintColor: Colors.transparent,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderLg.r),

    ),
    color: AppColors.whiteColor,

  );
}
