import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg(
      {super.key,
      required this.svgIcon,
      this.color,
      required this.isOriginalColor,
      required this.height,
      required this.width,
      this.fit = BoxFit.contain});

  final String svgIcon;
  final Color? color;
  final bool isOriginalColor;
  final double height;
  final double width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgIcon,
      colorFilter:
          isOriginalColor ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      height: height.h,
      width: width.w,
      fit: fit!,
    );
  }
}
