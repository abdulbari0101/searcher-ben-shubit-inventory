import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inventory/core/common/widgets/custom_material_button.dart';
import 'package:inventory/core/common/widgets/custom_sized_box.dart';
import 'package:inventory/core/common/widgets/custom_svg.dart';
import 'package:inventory/core/common/widgets/custom_text.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.iconSvg,
    required this.onPressed,
    required this.borderRadius,
    this.isRed = false,
    this.isLast = false,
    this.isCurrency = false,
    this.currencyType,
  });

  final String title;
  final String iconSvg;
  final bool isRed;
  final bool isLast;
  final bool isCurrency;
  final String? currencyType;

  final void Function() onPressed;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
      onPressed: onPressed,
      isCustomBorderRadius: true,
      borderRadius: borderRadius,
      child: ListTile(
        title: CustomText(
          text: title,
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: isRed ? AppColors.redColor : null),
        ),
        trailing: isLast
            ? null
            : Row(
          mainAxisSize: MainAxisSize.min,
                children: <Widget>[
              if(isCurrency)  CustomText(
                    text: currencyType,
                    textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: AppSizes.textEXLightSize.sp,
                        ),
                  ),
                  const CustomSizedBox(
                    width: AppSizes.paddingSm,
                  ),
                  Transform.flip(
                    flipX: true,
                    child: const Icon(Iconsax.play),
                  ),
                ],
              ),
        leading: CustomSvg(
          svgIcon: iconSvg,
          isOriginalColor: true,
          height: AppSizes.iconSm,
          width: AppSizes.iconSm,
        ),
      ),
    );
  }
}
