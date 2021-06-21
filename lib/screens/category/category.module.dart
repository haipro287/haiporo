import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/screens/category/list/category_list.view.dart';
import 'package:haiporo/screens/category/test/category_test.view.dart';
import 'package:haiporo/screens/category/word/category_word.view.dart';

import 'category.view.dart';

class CategoryModule extends Module {
  static const String main = '/';
  static const String list = '/list';
  static const String word = '/word';
  static const String test = '/test';
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      main,
      child: (_, __) => Category(__.data),
    ),
    ChildRoute(
      list,
      child: (_, __) => CategoryList(__.data),
    ),
    ChildRoute(
      word,
      child: (_, __) => CategoryWord(__.data),
    ),
    ChildRoute(
      test,
      child: (_, __) => CategoryTest(__.data),
    ),
  ];
}
