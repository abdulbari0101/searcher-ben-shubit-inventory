import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.textAlign = TextAlign.start,  this.textStyle, this.overflow = TextOverflow.visible, this.maxLines, this.textDirection});

  final String? text;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final TextOverflow overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return Text(
        softWrap:true,
        text ?? '',
        textAlign: textAlign,
        style: textStyle,
        overflow: overflow,
        maxLines: maxLines,
      textDirection: textDirection,
    );
  }
}
