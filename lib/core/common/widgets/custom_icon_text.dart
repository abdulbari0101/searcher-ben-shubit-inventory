import 'package:flutter/material.dart';
import 'package:inventory/core/common/widgets/custom_sized_box.dart';
import 'package:inventory/core/common/widgets/custom_svg.dart';
import 'package:inventory/core/common/widgets/custom_text.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class CustomIconText extends StatelessWidget {
  const CustomIconText({super.key, required this.text, required this.svgIcon});

  final String text;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomSvg(
          svgIcon: svgIcon,
          isOriginalColor: true,
          height: AppSizes.iconExSm,
          width: AppSizes.iconExSm,
        ),
        const CustomSizedBox(
          width: AppSizes.spaceBTWItemsSM,
        ),
        CustomText(
          text: text,
          textStyle: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
