import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/constant/app_colors.dart';

BoxShadow customBoxShadow(
{
Color color = AppColors.greyColor,
double spreadRadius = 1,
double blurRadius = 5,
double offsetY = 1,
}
    ) {

  return
    BoxShadow(
      color: color,
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
      offset: Offset(0, offsetY.h),
    );
}