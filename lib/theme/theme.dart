import 'package:flutter/material.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/theme/widget_themes/card_theme.dart';
import 'package:inventory/theme/widget_themes/outlined_button_theme.dart';
import 'package:inventory/theme/widget_themes/text_button_theme.dart';
import 'package:inventory/theme/widget_themes/text_field_theme.dart';
import 'package:inventory/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    disabledColor: AppColors.darkGrey,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.transparent,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
    cardTheme: TCardTheme.lightCardTheme,

  );

}
