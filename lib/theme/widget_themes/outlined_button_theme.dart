import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';
/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.blackColor,
      side: const BorderSide(color: AppColors.primaryColor,
      width: 1,
        strokeAlign: 1,
      ),
      textStyle: TextStyle(
          fontSize: AppSizes.textMediumSize.sp,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,
      ),
      padding: EdgeInsets.symmetric(vertical: AppSizes.paddingSm.h, horizontal: AppSizes.paddingMd.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderExSm.r)),
    ),
  );

}
