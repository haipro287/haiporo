import 'package:flutter/material.dart';
import 'package:haiporo/utils/material-color-helper.dart';

import 'font_family.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: CustomFontFamily.googleSans,
    primarySwatch: MaterialColorHelper.createMaterialColor(Color(0xffffcdd2)),
  );
}
