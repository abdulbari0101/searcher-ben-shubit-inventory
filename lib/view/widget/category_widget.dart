import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/common/widgets/custom_img_text.dart';
import '../../core/common/widgets/custom_material_button.dart';
import '../../core/common/widgets/custom_shadow_container.dart';
import '../../core/constant/app_sizes.dart';
import '../../data/static/home/category_list.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.index, required this.onPressed,this.width, this.height,required this.imageHeight,required this.imageWidth, this.fontSize=8, this.backgroundColor, this.gradient});

  final int index;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double imageHeight;
  final double imageWidth;
  final double fontSize;
  final Color? backgroundColor;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
      margin:const EdgeInsets.symmetric(vertical: AppSizes.paddingSm,horizontal: AppSizes.paddingExSm) ,
      backgroundColor: backgroundColor,
      gradient: gradient,
      width: width,
      height: height,
      blurRadius: 0.15,
      spreadRadius: 0.15,
      child: CustomMaterialButton(
        onPressed:onPressed,
        child: CustomImgText(
          text: categoryList[index].title,
          image: categoryList[index].image,
          heroIndex: index,
          imageHeight: imageHeight,
          imageWidth: imageWidth,
          textFontSize: fontSize,
        ),
      ),
    );
  }
}
