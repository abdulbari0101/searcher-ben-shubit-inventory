import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomLottieWidget extends StatelessWidget {
  const CustomLottieWidget({super.key, required this.animation, required this.width, required this.height, required this.repeat});

  final String animation;
  final double width;
  final double height;
  final bool repeat;


  @override
  Widget build(BuildContext context) {
    return Lottie.asset(animation, width: width.w, height: height.h , repeat: repeat,
    );
  }
}
