import 'package:flutter/material.dart';
import 'package:inventory/core/constant/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.isVertical, this.width, this.height, this.thickness, this.endIndent, this.indent});

  final bool isVertical;
  final double? width;
  final double? height;
  final double? thickness;
  final double? endIndent;
  final double? indent;

  @override
  Widget build(BuildContext context) {
    return isVertical ? VerticalDivider(
      color: AppColors.darkGrey,
      width: width,
      thickness:thickness,
      endIndent: endIndent,
      indent: indent,
    ) :
        Divider(
          color: AppColors.darkGrey,
          height: height,
          thickness:thickness,
          endIndent: endIndent,
          indent: indent,
        );
  }
}
