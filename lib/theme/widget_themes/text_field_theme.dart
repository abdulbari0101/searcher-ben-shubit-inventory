import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: AppSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: AppSizes.textEXLightSize.sp, color: AppColors.darkGrey),
    hintStyle: const TextStyle().copyWith(fontSize: AppSizes.textEXLightSize.sp, color: AppColors.darkGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColors.blackColor.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderSm),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderSm),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderSm),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderSm),
      borderSide: const BorderSide(width: 1, color: AppColors.redColor),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderSm),
      borderSide: const BorderSide(width: 2, color: AppColors.redColor),
    ),
  );

}
