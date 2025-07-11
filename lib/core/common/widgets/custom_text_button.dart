import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(text: text),
    );
  }
}
