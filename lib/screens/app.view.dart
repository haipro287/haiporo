import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/config/themes/theme_data.dart';
import 'package:haiporo/screens/splash/splash.view.dart';

class AppWidget extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haiporo',
      theme: CustomThemeData.lightTheme,
      home: Splash(),
      initialRoute: "/splash",
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
