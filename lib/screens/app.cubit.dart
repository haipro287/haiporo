import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haiporo/config/themes/theme_data.dart';
import 'package:haiporo/utils/share-preferences-helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app.state.dart';

class AppCubit extends Cubit<AppState> {
  bool dark = false;
  ThemeData themeData;

  AppCubit() : super(AppInitial()) {
    getThemeSetting();
  }

  Future<void> getThemeSetting() async {
    var sp = await SharePreferencesHelper.getInstance();
    dark = sp.getBool('dark') ?? false;
    print(dark);
    themeData = dark ? CustomThemeData.darkTheme : CustomThemeData.lightTheme;
  }

  Future<void> setThemeSetting(bool dark) async {
    emit(AppLoading());
    var sp = await SharePreferencesHelper.getInstance();
    await sp.putBool('dark', dark);
    await getThemeSetting();
    emit(AppLoaded());
  }
}
