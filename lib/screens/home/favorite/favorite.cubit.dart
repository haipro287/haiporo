import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haiporo/models/word/word.dart';
import 'package:haiporo/repositories/word/word.repository.dart';

part 'favorite.state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final WordRepository _wordRepository = WordRepository();
  List<Word> words = [];

  FavoriteCubit() : super(Initial()) {
    getFavorite();
  }

  Future<void> getFavorite() async {
    emit(Loading());
    words = await _wordRepository.getFavorite();
    print(words);
    emit(Loaded());
  }
}
