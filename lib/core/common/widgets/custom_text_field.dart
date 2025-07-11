import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.label='',
      this.prefixIcon,
      this.isPassword = false,
      required this.controller,
      required this.inputType,
      this.textInputAction,
      this.onChanged,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.canSpace = false,
      this.suffexIcon,
      this.onTapSuffex,
      this.hintText = '',
      });

  final String label;
  final IconData? prefixIcon;
  final bool isPassword;
  final bool canSpace;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final void Function()? onTapSuffex;
 final IconData? suffexIcon;
 final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      keyboardType: inputType,
      onTapOutside: (PointerDownEvent _) => FocusScope.of(context).unfocus(),
      inputFormatters: [
        if (!canSpace) FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      onChanged: onChanged,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
        labelText: label,
        suffixIcon: InkWell(
            onTap: onTapSuffex,
            child: suffexIcon != null ? Icon(suffexIcon) : null),
      ),
    );
  }
}
