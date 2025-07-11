import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/controller/inventory/inventory_controller.dart';
import 'package:inventory/core/common/widgets/custom_list_counter_view.dart';
import 'package:inventory/core/common/widgets/custom_material_button.dart';
import 'package:inventory/core/common/widgets/custom_search_field.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/view/widget/inventory/inventory_record_widget.dart';

import '../../../core/common/widgets/custom_scaffold.dart';
import '../../../core/common/widgets/custom_sized_box.dart';
import '../../../core/common/widgets/custom_text.dart';
import '../../../core/constant/app_lables.dart';
import '../../../core/constant/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    InventoryController controller = Get.put(InventoryController());
    String word = '';

    return CustomScaffoldWithBackground(
        gradient: const LinearGradient(
          colors: [
            AppColors.firstGradientPrimaryColor,
            AppColors.firstGradientPrimaryColor,
            AppColors.secondGradientPrimaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        body: ListView(
          children: [Container(
            height: Get.height,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingSm,
              vertical: AppSizes.paddingExLg,
            ),
            child: Column(
              children: [
                CustomText(
                  text: AppLabels.inventory,
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                ),
                const CustomSizedBox(height: 10),
                SizedBox(
                  child: GetBuilder<InventoryController>(builder: (controller) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(AppSizes.borderSm),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: controller.selectedInventoryId,
                        icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
                        iconSize: 24,
                        elevation: 16,
                        underline: SizedBox(), // Remove default underline
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.dark_green,
                        ),
                        borderRadius: BorderRadius.circular(AppSizes.borderSm),
                        items: [
                          DropdownMenuItem<String>(
                            value: 'الكل',
                            child: Text('الكل', style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          ...controller.inventoryIds!
                              .where((id) => id != null && id != 'الكل')
                              .map((String? inventoryId) {
                            return DropdownMenuItem<String>(
                              value: inventoryId,
                              child: Text(
                                inventoryId ?? 'Unnamed Inventory',
                                style: Theme.of(context).textTheme.bodyMedium,

                              ),
                            );
                          })
                        ],
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.selectedInventoryId = newValue;
                            controller.searchUsingQuery(word: word);
                            controller.update(); // Force UI update
                          }
                        },
                      ),);
                  }),
                ),
                const CustomSizedBox(
                  height: 10,
                ),
                GetBuilder<InventoryController>(builder: (controller) {
                  return Row(children: [
                    Expanded(
                      child: CustomSearchField(
                        onChange: (text) {
                          word = text.trim();
                          controller.searchUsingQuery(word: word);
                        },
                      ),
                    ),
                    const CustomSizedBox(
                      width: 5,
                    ),
                    CustomListCounterView(
                      countLabel: AppLabels.category_count,
                      counter: controller.inventoryList.length.toString(),
                    )
                  ]);
                }),
                GetBuilder<InventoryController>(builder: (controller) {
                  return Row(
                    children: [
                      const CustomSizedBox(
                        width: 20,
                      ),
                      CustomText(
                        text:
                        'اجمالي تكلفة المخزن = ${controller.getTotalPrice().toString()} ${AppLabels.rialSymbol}',
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            color: AppColors.smoothBlack,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }),
                const CustomSizedBox(
                  height: 5,
                ),
                GetBuilder<InventoryController>(builder: (controller) {
                  return SizedBox(
                    height: 40.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          child: CustomMaterialButton(
                            backgroundColor: (controller.pressAvailableQuantity)
                                ? AppColors.redColor
                                : AppColors.glassColor,
                            isCustomBorderRadius: true,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppSizes.borderSm,
                              ),
                            ),
                            child: CustomText(
                              text: AppLabels.available_quntity,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                  fontSize: AppSizes.textLightSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              controller
                                  .pressFilterButton(AppLabels.available_quntity);
                              controller.searchUsingQuery(word: word);
                            },
                          ),
                        ),
                        /* CustomSizedBox(width: 5.w),
                          SizedBox(
                            child: CustomMaterialButton(
                              backgroundColor: (controller.pressHighestPrice)?AppColors.redColor:AppColors.glassColor,
                              isCustomBorderRadius: true,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  AppSizes.borderSm,
                                ),
                              ),
                              child: CustomText(
                                text: AppLabels.unit,
                                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: AppSizes.textLightSize,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {controller.pressFilterButton(AppLabels.unit);
                              controller.searchUsingQuery(word: word);},
                            ),
                          ),*/
                        CustomSizedBox(width: 5.w),
                        SizedBox(
                          child: CustomMaterialButton(
                            backgroundColor: (controller.pressHighestQuantity)
                                ? AppColors.redColor
                                : AppColors.glassColor,
                            isCustomBorderRadius: true,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppSizes.borderSm,
                              ),
                            ),
                            child: CustomText(
                              text: AppLabels.highest_quntity,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                  fontSize: AppSizes.textLightSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              controller
                                  .pressFilterButton(AppLabels.highest_quntity);
                              controller.searchUsingQuery(word: word);
                            },
                          ),
                        ),
                        CustomSizedBox(width: 5.w),
                        SizedBox(
                          child: CustomMaterialButton(
                            backgroundColor: (controller.pressSmallestQuantity)
                                ? AppColors.redColor
                                : AppColors.glassColor,
                            isCustomBorderRadius: true,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppSizes.borderSm,
                              ),
                            ),
                            child: CustomText(
                              text: AppLabels.smallest_quntity,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                  fontSize: AppSizes.textLightSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              controller
                                  .pressFilterButton(AppLabels.smallest_quntity);
                              controller.searchUsingQuery(word: word);
                            },
                          ),
                        ),
                        CustomSizedBox(width: 5.w),
                        SizedBox(
                          child: CustomMaterialButton(
                            backgroundColor: (controller.pressHighestPrice)
                                ? AppColors.redColor
                                : AppColors.glassColor,
                            isCustomBorderRadius: true,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppSizes.borderSm,
                              ),
                            ),
                            child: CustomText(
                              text: AppLabels.highest_price,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                  fontSize: AppSizes.textLightSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              controller
                                  .pressFilterButton(AppLabels.highest_price);
                              controller.searchUsingQuery(word: word);
                            },
                          ),
                        ),
                        CustomSizedBox(width: 5.w),
                        SizedBox(
                          child: CustomMaterialButton(
                            backgroundColor: (controller.pressSmallestPrice)
                                ? AppColors.redColor
                                : AppColors.glassColor,
                            isCustomBorderRadius: true,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppSizes.borderSm,
                              ),
                            ),
                            child: CustomText(
                              text: AppLabels.smallest_price,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                  fontSize: AppSizes.textLightSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              controller
                                  .pressFilterButton(AppLabels.smallest_price);
                              controller.searchUsingQuery(word: word);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                GetBuilder<InventoryController>(builder: (controller) {
                  return InventoryRecordWidget(
                    onPressed: () {
                      Get.defaultDialog(
                        title: AppLabels.unit,
                        content: SizedBox(
                          height: 200, // Adjust height as needed
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text('الكل', style: Theme.of(context).textTheme.bodyMedium),
                                  onTap: () {
                                    controller.selectedUnit = 'الكل';
                                    controller.searchUsingQuery(word: word);
                                    controller.update();
                                    Get.back();
                                  },
                                ),
                                ...controller.units!
                                    .where((id) => id != null && id != 'الكل')
                                    .map((String? unit) {
                                  return ListTile(
                                    title: Text(
                                      unit ?? '',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    onTap: () {
                                      controller.selectedUnit = unit;
                                      controller.searchUsingQuery(word: word);
                                      controller.update();
                                      Get.back();
                                    },
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    name: AppLabels.name,
                    unit: AppLabels.unit,
                    quantity: AppLabels.quantity,
                    price: AppLabels.price,
                    selectedUnit: controller.selectedUnit?? null,
                  );
                }
                ),
                const CustomSizedBox(
                  height: 5,
                ),
                GetBuilder<InventoryController>(
                  builder: (controller) => Expanded(
                      child: (controller.isLoading)
                          ? controller.getShimmerLoading()
                          : ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 10.h),
                          shrinkWrap: true,
                          itemCount: controller.inventoryList.length,
                          itemBuilder: (_, int index) =>
                              InventoryRecordWidget(
                                  name: controller.inventoryList[index].name,
                                  price:
                                  controller.inventoryList[index].price,
                                  quantity: controller.inventoryList[index].quantity,
                                  unit: controller.inventoryList[index].unit,
                                  onPressed: () {}))),
                ),
              ],
            ),
          )],
        ));
  }
}
