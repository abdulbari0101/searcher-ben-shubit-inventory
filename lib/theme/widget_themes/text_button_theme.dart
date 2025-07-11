import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TTextButtonTheme {
  TTextButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final TextButtonThemeData lightTextButtonTheme  = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.blackColor,
      textStyle: TextStyle(fontSize: AppSizes.textRegularSize.sp,
          color: AppColors.blackColor, fontWeight: FontWeight.w500),
      padding: EdgeInsets.symmetric(vertical: AppSizes.buttonHeight.h, horizontal: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderLg.r)),
    ),
  );

}
