import 'package:flutter/material.dart';
import 'package:inventory/core/common/shadow/custom_box_shadow.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class CustomShadowContainer extends StatelessWidget {
  const CustomShadowContainer(
      {super.key, this.spreadRadius = 0.2, this.blurRadius = 0.2, this.width, this.height,
        this.shape = BoxShape.rectangle ,required this.child, this.padding, this.margin, this.backgroundColor, this.gradient,});

  final Widget child;
  final double spreadRadius;
  final double blurRadius;
  final double? width;
  final double? height;
  final BoxShape shape;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color:(backgroundColor==null)? AppColors.whiteColor : backgroundColor,
        borderRadius: shape == BoxShape.rectangle ? BorderRadius.circular(AppSizes.borderSm) : null,
        gradient: gradient,
        shape: shape,
        boxShadow: [
          customBoxShadow(
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
          ),
          customBoxShadow(
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offsetY: -1,
          ),
        ],
      ),
      child: child,
    );
  }
}
