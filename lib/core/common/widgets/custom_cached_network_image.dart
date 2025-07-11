import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.image, this.width = 80.0, this.height = 80.0});

  final String image;
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      imageUrl: image,
      height: height.h,
      width: width.w,

      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(
            child: CircularProgressIndicator(
                value: downloadProgress.progress,
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ),
      errorWidget: (context, url, error) =>
      const Icon(Iconsax.info_circle),
    );
  }
}
