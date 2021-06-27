import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/screens/category/category.module.dart';
import 'package:haiporo/screens/splash/splash.view.dart';
import 'package:haiporo/utils/share-preferences-helper.dart';

import 'home/home.module.dart';

class AppModule extends Module {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String category = '/category';

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    AsyncBind((i) => SharePreferencesHelper.getInstance()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      splash,
      child: (_, __) => Splash(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      home,
      module: HomeModule(),
    ),
    ModuleRoute(
      category,
      module: CategoryModule(),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
