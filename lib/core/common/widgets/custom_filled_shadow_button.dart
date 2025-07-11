import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/common/widgets/custom_shadow_container.dart';
import 'package:inventory/core/common/widgets/custom_material_button.dart';
import 'package:inventory/core/common/widgets/custom_text.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class CustomFilledShadowButton extends StatelessWidget {
  const CustomFilledShadowButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height = AppSizes.buttonHeightSm,
      this.width,
      this.textSize = 12});

  final String text;
  final double textSize;
  final void Function() onPressed;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      height: height,
      width: width,
      child: CustomMaterialButton(
        onPressed: onPressed,
        child: CustomText(
          text: text,
          textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.primaryColor,
                fontSize: textSize.sp,
              ),
        ),
      ),
    );
  }
}
