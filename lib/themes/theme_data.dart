import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ColorData {
  static const primary = Color(0xFF4db1c8);
  static const primaryVariant = Color(0xFF2B94AC);
  static const secondaryVariant = Color(0xFF8DDAEC);
  static const secondary = Color(0xFFC9E7EE);
  static const sos = Color(0xffff2819);
  static const onPrimary = Color(0xFF0F2328);
  static const background = Color(0xffffffff);
  static const surface = Color(0xffffffff);
  static const clickable = Color(0xFF00B2FF);
  static const inactive = Color(0xff0F2328);
}

class ElevationData {
  static const double elevated5 = 5;
  static const double elevated0 = 0;
  static const double elevated10 = 10;
  static const double elevated15 = 15;
  static const double elevated20 = 20;
}

class FontStyleData {
  static const H1_bold_36 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 30,
      letterSpacing: 0,
      fontWeight: FontWeight.bold);
  static const H2_bold_30 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 27,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold);
  static const Button_bold_27 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 20,
      letterSpacing: 0,
      fontWeight: FontWeight.bold);
  static const H3_bold_36 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 24,
      letterSpacing: 0,
      fontWeight: FontWeight.bold);
  static const Relative_light_24 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 20,
      letterSpacing: 1,
      fontWeight: FontWeight.w200);
  static const Subtitle_light_24 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 22,
      letterSpacing: 1,
      fontWeight: FontWeight.w300);
  static const Title_Bold_20 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 18,
      letterSpacing: 1,
      fontWeight: FontWeight.bold);
  static const Paragraph_Regular_20 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w400);
  static const Mini_Title_Light_16 = TextStyle(
      color: ColorData.onPrimary,
      fontSize: 14,
      letterSpacing: 1,
      fontWeight: FontWeight.w300);
}
