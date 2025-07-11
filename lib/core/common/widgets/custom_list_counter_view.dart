import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_sizes.dart';
import 'custom_divider.dart';
import 'custom_material_button.dart';
import 'custom_shadow_container.dart';
import 'custom_text.dart';

class CustomListCounterView extends StatelessWidget {
  const CustomListCounterView({super.key, this.countLabel, this.counter});
final String? countLabel;
final String? counter;
  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      child: Row(
        children: <Widget>[
          SizedBox(

            child: CustomMaterialButton(
              isCustomBorderRadius: true,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(
                  AppSizes.borderSm,
                ),
                topRight: Radius.circular(
                  AppSizes.borderSm,
                ),
              ),
              child: CustomText(
                text: countLabel,
                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: AppSizes.textEXLightSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 20.h,
            child: const CustomDivider(
              isVertical: true,
              width: 1,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: CustomMaterialButton(
              isCustomBorderRadius: true,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  AppSizes.borderSm,
                ),
                topLeft: Radius.circular(
                  AppSizes.borderSm,
                ),
              ),
              child: CustomText(
                text: counter,
                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: AppSizes.textEXLightSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
