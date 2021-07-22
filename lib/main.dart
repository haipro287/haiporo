import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/screens/app.cubit.dart';
import 'package:haiporo/screens/app.module.dart';
import 'package:haiporo/screens/app.view.dart';
import 'package:haiporo/utils/share-preferences-helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sp = await SharePreferencesHelper.getInstance();
  var dark = sp.getBool('dark') ?? false;
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]); //<--
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: dark ? Colors.black : Colors.white,
      systemNavigationBarIconBrightness:
          dark ? Brightness.light : Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
