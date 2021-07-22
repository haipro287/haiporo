import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/config/themes/theme_data.dart';
import 'package:haiporo/screens/app.cubit.dart';
import 'package:haiporo/screens/splash/splash.view.dart';
import 'package:haiporo/utils/share-preferences-helper.dart';

class AppWidget extends StatefulWidget {
  // This widget is the root of your application.

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_AppWidgetState>().restartApp();
  }
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AppCubit _appCubit = AppCubit();
  var key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      bloc: _appCubit,
      builder: (context, snapshot) {
        return FutureBuilder(
          future: _appCubit.getThemeSetting(),
          builder: (context, snapshot) {
            return MaterialApp(
              key: key,
              title: 'Haiporo',
              theme: _appCubit.themeData,
              home: Splash(),
              initialRoute: "/splash",
              debugShowCheckedModeBanner: false,
            ).modular();
          }
        );
      },
    );
  }
}
