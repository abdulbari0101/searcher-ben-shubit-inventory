import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.height, required this.width, this.color, required this.image, this.fit});
  final String image;
  final double height;
  final double width;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height.h,
      width: width.w,
      color: color,
      fit: fit,
    );
  }
}
