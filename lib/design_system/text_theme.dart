import 'package:flutter/material.dart';

import 'color_palette.dart';

class TextStyles {
  static const TextStyle headline1 = TextStyle(
    color: ColorPalette.primaryColor,
    fontFamily: "Open Sans",
    fontSize: 34.00,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.50,
    height: 1.2,
  );

  static const TextStyle headline2 = TextStyle(
    color: ColorPalette.textColor,
    fontFamily: "Open Sans",
    fontSize: 28.00,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.38,
    height: 1.6,
  );

  static const TextStyle headline3 = TextStyle(
    color: ColorPalette.textColor,
    fontFamily: "Open Sans",
    fontSize: 22.00,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.26,
    height: 1.6,
  );

  static const TextStyle headline4 = TextStyle(
    color: ColorPalette.textColor,
    fontFamily: "Open Sans",
    fontSize: 22.00,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.45,
    height: 1.2,
  );

  static const TextStyle headline5 = TextStyle(
    color: ColorPalette.textColor,
    fontFamily: "Open Sans",
    fontSize: 22.00,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.43,
    height: 1.6,
  );

  static const TextStyle subtitle1 = TextStyle(
    color: ColorPalette.textColor,
    fontFamily: "Open Sans",
    fontSize: 14.00,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.23,
    height: 1.6,
  );

  static const TextStyle subtitle2 = TextStyle(
    color: ColorPalette.textColor,
    fontFamily: "Open Sans",
    fontSize: 18.00,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.23,
    height: 1.6,
  );

  static const TextStyle button = TextStyle(
    color: ColorPalette.primaryColor,
    fontFamily: "Open Sans",
    fontSize: 19.00,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.15,
  );

  static const TextStyle bodyText1 = TextStyle(
    color: ColorPalette.primaryColor,
    fontFamily: "Open Sans",
    fontSize: 22.00,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.43,
    height: 1.6,
  );

  static const TextStyle bodyText2 = TextStyle(
    color: ColorPalette.primaryColor,
    fontFamily: "Open Sans",
    fontSize: 18.00,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.23,
    height: 1.6,
  );

  static const TextStyle caption = TextStyle(
    color: ColorPalette.textColor,
    fontFamily: "Open Sans",
    fontSize: 20.00,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.00,
    height: 1.6,
  );

  static const TextTheme textTheme = TextTheme(
    headline1: TextStyles.headline1,
    headline2: TextStyles.headline2,
    headline3: TextStyles.headline3,
    headline4: TextStyles.headline4,
    headline5: TextStyles.headline5,
    subtitle1: TextStyles.subtitle1,
    subtitle2: TextStyles.subtitle2,
    button: TextStyles.button,
    bodyText1: TextStyles.bodyText1,
    bodyText2: TextStyles.bodyText2,
    caption: TextStyles.caption,
  );
}
