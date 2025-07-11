import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/common/widgets/custom_image.dart';
import 'package:inventory/core/common/widgets/custom_sized_box.dart';
import 'package:inventory/core/common/widgets/custom_text.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class CustomImgText extends StatelessWidget {
  const CustomImgText({super.key, required this.text, required this.image, required this.imageHeight, required this.imageWidth, required this.textFontSize, required this.heroIndex});

  final String text;
  final String image;
  final double imageHeight;
  final double imageWidth;
  final double textFontSize;
  final int heroIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CustomSizedBox(
          height: AppSizes.spaceBTWItemsSM,
        ),
        Hero(
          tag: "${text}_$heroIndex",
          child: CustomText(
            text: text,
            textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: textFontSize.sp,
            ),
          ),
        ),
        const CustomSizedBox(
          height: AppSizes.spaceBTWItemsSM,
        ),
        Hero(
          tag: "${image}_$heroIndex",
          child: CustomImage(
            height: imageHeight,
            width: imageWidth,
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
