import 'package:flutter/material.dart';
import 'package:haiporo/utils/material-color-helper.dart';

import 'font_family.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: CustomFontFamily.googleSans,
    primarySwatch: MaterialColorHelper.createMaterialColor(Color(0xffffcdd2)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    )),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    accentColor: Color(0xffffcdd2),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffcdd2)),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(Color(0xffffcdd2)),
      trackColor: MaterialStateProperty.all<Color>(Color(0xffffcdd2)),
    ),
  );
}
