import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

const InputTheme = InputDecoration(
  border: OutlineInputBorder(),
  focusColor: ColorData.primaryVariant,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorData.primaryVariant,
      width: 1.75,
    ),
  ),
);
