import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';

/// Custom Class for Light & blackColor Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(

    headlineLarge: const TextStyle().copyWith(fontSize: AppSizes.textBoldSize.sp, fontWeight: FontWeight.w700, color: AppColors.blackColor),
    headlineMedium: const TextStyle().copyWith(fontSize:  AppSizes.textSemiBoldSize.sp, fontWeight: FontWeight.w700, color: AppColors.blackColor),
    headlineSmall: const TextStyle().copyWith(fontSize: AppSizes.textMediumSize.sp, fontWeight: FontWeight.w700, color: AppColors.blackColor),

    titleLarge: const TextStyle().copyWith(fontSize: AppSizes.textSemiBoldSize.sp, fontWeight: FontWeight.w600, color: AppColors.blackColor),
    titleMedium: const TextStyle().copyWith(fontSize:AppSizes.textMediumSize.sp, fontWeight: FontWeight.w600, color: AppColors.blackColor),
    titleSmall: const TextStyle().copyWith(fontSize: AppSizes.textRegularSize.sp, fontWeight: FontWeight.w600, color: AppColors.blackColor),

    bodyLarge: const TextStyle().copyWith(fontSize: AppSizes.textMediumSize.sp, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    bodyMedium: const TextStyle().copyWith(fontSize:AppSizes.textRegularSize.sp, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    bodySmall: const TextStyle().copyWith(fontSize: AppSizes.textLightSize.sp, fontWeight: FontWeight.w500, color: AppColors.blackColor.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize:AppSizes.textLightSize.sp, fontWeight: FontWeight.w400, color: AppColors.blackColor),
    labelMedium: const TextStyle().copyWith(fontSize: AppSizes.textLightSize.sp, fontWeight: FontWeight.w400, color: AppColors.blackColor.withOpacity(0.5)),
    labelSmall: const TextStyle().copyWith(fontSize: AppSizes.textLightSize.sp, fontWeight: FontWeight.w400, color: AppColors.blackColor.withOpacity(0.5)),

  );

}
