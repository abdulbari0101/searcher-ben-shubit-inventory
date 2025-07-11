import 'package:flutter/material.dart';

import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class CustomtextInkWell extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomtextInkWell({this.onTap,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            style:const TextStyle(fontSize: AppSizes.textRegularSize,fontWeight: FontWeight.bold,color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
