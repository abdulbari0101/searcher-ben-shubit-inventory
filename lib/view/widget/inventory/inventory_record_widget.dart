import 'package:flutter/material.dart';
import 'package:inventory/core/common/widgets/custom_shadow_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory/core/common/widgets/custom_sized_box.dart';
import 'package:inventory/core/common/widgets/custom_text.dart';
import 'package:inventory/core/constant/app_lables.dart';

import '../../../core/common/widgets/custom_divider.dart';
import '../../../core/common/widgets/custom_material_button.dart';
import '../../../core/constant/app_sizes.dart';

class InventoryRecordWidget extends StatelessWidget {
  const InventoryRecordWidget(
      {super.key,
        this.name,
        this.quantity,
        this.price,
        this.unit,
        this.inventoryId,
        this.selectedUnit,
        required this.onPressed});

  final String? name;
  final String? inventoryId;
  final String? quantity;
  final String? price;
  final String? unit;
  final String? selectedUnit;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
        width: Get.width,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.all(12.0),
        child: CustomMaterialButton(
          onPressed: onPressed,
          child: Row(
            children: [
              SizedBox(
                width: 140.w,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: name,
                  textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: AppSizes.textLightSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 1.w,
                height: 20.h,
                child: CustomDivider(
                  isVertical: true,
                  width: 1,
                ),
              ),
              Spacer(),
              Column(children: [
                SizedBox(
                  width: 40.w,
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: unit,
                    textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: AppSizes.textLightSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: selectedUnit ??null,
                    textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: AppSizes.textLightSize,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],),

              Spacer(),
              SizedBox(
                width: 1.w,
                height: 20.h,
                child: CustomDivider(
                  isVertical: true,
                  width: 1,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 40.w,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: quantity,
                  textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: AppSizes.textLightSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 1.w,
                height: 20.h,
                child: CustomDivider(
                  isVertical: true,
                  width: 1,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 50.w,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: "$price ${AppLabels.rialSymbol}",
                  textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: AppSizes.textLightSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}