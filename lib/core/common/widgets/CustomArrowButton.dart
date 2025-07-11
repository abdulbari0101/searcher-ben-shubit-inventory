import 'package:flutter/material.dart';
import 'package:inventory/core/common/widgets/custom_sized_box.dart';
import 'package:inventory/core/constant/app_sizes.dart';

class CustomArrowButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomArrowButton({super.key,required this.text,required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(text,style: const TextStyle(fontSize: AppSizes.textRegularSize),),
            const CustomSizedBox(width: 10,),
           // CustomSvg(svgIcon: AppSvgs.next_arrow_Svg, isOriginalColor: true, height: 40, width: 25),
          ],
        ),
      );
  }
}
