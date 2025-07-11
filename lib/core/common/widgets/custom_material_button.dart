import 'package:flutter/material.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.isCustomBorderRadius = false,
      this.borderRadius, this.backgroundColor});

  final Widget child;
  final void Function() onPressed;
  final bool isCustomBorderRadius;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: isCustomBorderRadius
            ? borderRadius!
            : BorderRadius.circular(AppSizes.borderSm),
      ),
      onPressed: onPressed,
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
