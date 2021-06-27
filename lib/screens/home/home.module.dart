import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/screens/home/favorite/favorite.view.dart';
import 'package:haiporo/screens/home/search/search.view.dart';
import 'package:haiporo/screens/home/setting/setting.view.dart';
import 'home.view.dart';

class HomeModule extends Module {
  static const String main = '/';
  static const String search = '/search';
  static const String favorite = '/favorite';
  static const String setting = '/setting';
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      main,
      child: (_, __) => Home(),
    ),
    ChildRoute(
      search,
      child: (_, __) => Search(),
    ),
    ChildRoute(
      favorite,
      child: (_, __) => Favorite(),
    ),ChildRoute(
      setting,
      child: (_, __) => Setting(),
    ),
  ];
}
