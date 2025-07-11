import 'package:flutter/material.dart';
import 'package:inventory/core/constant/app_colors.dart';

import 'custom_text.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, required this.text, required this.onPressed, this.textColor, this.borderColor = AppColors.blackColor, this.textSize});

  final String text;
  final double? textSize;
  final Color? textColor;
  final Color? borderColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(BorderSide(
          color: borderColor!,
          width: 0.5
        ),
        ),
      ),
      onPressed: onPressed,
      child: CustomText(text: text,
      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: textColor,
        fontSize: textSize
      ),
      ),
    );
  }
}
