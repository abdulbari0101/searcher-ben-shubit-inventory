import 'package:flutter/material.dart';
import 'package:inventory/core/common/widgets/custom_app_bar_style_.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/helpers/helper_functions.dart';

class CustomScaffoldWithBackground extends StatelessWidget {
  const CustomScaffoldWithBackground({
    super.key,
    required this.body,
    this.backgroundColor,
    this.gradient,
  });

  final Widget body;
  final Color? backgroundColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
              height: HelperFunctions.screenHeight(percentage: 1),
              width: HelperFunctions.screenWidth(percentage: 1),
              decoration:
                  BoxDecoration(color:(backgroundColor==null)? AppColors.whiteColor : backgroundColor, gradient: gradient)),
          // Optional AppBar to style system navigation and status
          const CustomAppBarStyle(),

          SafeArea(child: body),
        ],
      ),
    );
  }
}
