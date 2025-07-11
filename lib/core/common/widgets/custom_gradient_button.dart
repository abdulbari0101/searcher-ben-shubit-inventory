import 'package:flutter/material.dart';
import 'package:inventory/core/common/widgets/custom_material_button.dart';
import 'package:inventory/core/common/widgets/custom_text.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';
import 'package:inventory/core/helpers/helper_functions.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton(
      {super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: HelperFunctions.screenWidth(percentage: 0.75),
          height: HelperFunctions.screenHeight(percentage: 0.055),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.firstGradientPrimaryColor,
                AppColors.secondGradientPrimaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(AppSizes.borderMD),
          ),
          child: CustomMaterialButton(
            onPressed: onPressed,
            child: CustomText(
              text: text,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.whiteColor
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
