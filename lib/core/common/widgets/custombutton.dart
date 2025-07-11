import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/core/constant/app_colors.dart';

class CustomButton extends GetView {
  final String text;
  final void Function() onPressed;
  const CustomButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.firstGradientPrimaryColor,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,

        ),
      ),
    );
  }
}
