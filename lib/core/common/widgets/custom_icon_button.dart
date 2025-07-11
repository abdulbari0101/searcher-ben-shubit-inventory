import 'package:flutter/material.dart';
import 'package:inventory/core/common/widgets/custom_shadow_container.dart';
import 'package:inventory/core/common/widgets/custom_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.buttonHeight, required this.buttonWidth,  this.iconSvgHeight,  this.iconSvgWidth, this.svgIcon, this.iconData,this.iconDataColor, this.iconDataSize, required this.onPressed});

  final double buttonHeight;
  final double buttonWidth;

  final double? iconSvgHeight;
  final double? iconSvgWidth;
  final String? svgIcon;
  final IconData? iconData;
  final Color? iconDataColor;
  final double? iconDataSize;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      height: buttonHeight,
      width: buttonWidth,
      shape: BoxShape.circle,
      child: IconButton(
        icon: iconData != null ? Icon(iconData,color: iconDataColor,size: iconDataSize,) : CustomSvg(
          svgIcon: svgIcon!,
          isOriginalColor: true,
          height: iconSvgHeight!,
          width: iconSvgWidth!,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
