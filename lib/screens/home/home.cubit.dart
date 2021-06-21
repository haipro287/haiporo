import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haiporo/models/theme/word-theme.dart';
import 'package:haiporo/repositories/word-theme/word-theme.repository.dart';

part 'home.state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WordThemeRepository _themeRepository = WordThemeRepository();
  List<WordTheme> themes = [];

  HomeCubit() :super(HomeInitial()){
    getThemes();
  }

  Future<void> getThemes() async {
    emit(HomeLoading());
    themes = await _themeRepository.getWordTheme();
    emit(HomeLoaded());
  }
}