import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory/core/common/widgets/custom_shadow_container.dart';
import 'package:inventory/core/constant/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.height = 40.0, this.width = 40.0});

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: CustomShadowContainer(
        shape:BoxShape.circle ,
        child: MaterialButton(
          onPressed: () => Get.back(),
          shape: const CircleBorder(),
          child: Padding(
            padding: EdgeInsets.only(left: 17.w),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color:  AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
