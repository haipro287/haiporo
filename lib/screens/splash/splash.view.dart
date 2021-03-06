import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/config/themes/font_family.dart';
import 'package:haiporo/config/themes/theme_data.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/screens/app.cubit.dart';
import 'package:haiporo/screens/app.module.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConstant().init(context);
    return Material(
      child: Container(
        color: CustomThemeData.lightTheme.primaryColor,
        child: Center(
          child: Text(
            "PORO",
            style: TextStyle(fontSize: 75, fontFamily: CustomFontFamily.googleSans),
          ),
        ),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(
        _duration, () => Modular.to.pushReplacementNamed(AppModule.home));
  }
}
