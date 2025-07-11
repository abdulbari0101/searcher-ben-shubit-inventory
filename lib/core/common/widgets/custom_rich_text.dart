import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.firstTextStyle,
      required this.secondTextStyle});

  final String firstText;
  final String secondText;
  final TextStyle firstTextStyle;
  final TextStyle secondTextStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(

      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: firstTextStyle,
          ),
          TextSpan(
            text: secondText,
            style: secondTextStyle,
          ),
        ],
      ),
    );
  }
}
