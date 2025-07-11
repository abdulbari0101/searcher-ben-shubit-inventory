import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/core/common/widgets/custom_text.dart';

import 'custom_back_button.dart';

class CustomStackAppBar extends StatelessWidget {
  const CustomStackAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight.h,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Positioned(
            right: 1,
            child: CustomBackButton(),
          ),
          CustomText(
            text: title,
            textStyle: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
