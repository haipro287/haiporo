import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haiporo/models/word/word.dart';
import 'package:haiporo/repositories/word/word.repository.dart';
import 'package:just_audio/just_audio.dart';

part 'category_list.state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  final WordRepository _wordRepository = WordRepository();

  final AudioPlayer _audioPlayer = AudioPlayer();
  List<Word> words = [];

  CategoryListCubit(int categoryId) : super(CategoryListInitial()) {
    getThemeWord(categoryId);
  }

  Future<void> getThemeWord(int categoryId) async {
    emit(CategoryListLoading());
    words = await _wordRepository.getThemeWord(categoryId);
    emit(CategoryListLoaded());
  }

  Future<void> getTTS(String word) async {
    var uriString = Uri.encodeComponent(word);
    await _audioPlayer.setUrl(
      'https://voicerss-text-to-speech.p.rapidapi.com/?key=e1de796921674c0c974355542f4abce9&hl=en-us&src=$uriString&f=8khz_8bit_mono&c=mp3&r=0',
      headers: {
        "x-rapidapi-key": "d2cf348d42msh206cfd530239715p1c18dfjsn5fb5b6f4cf55",
        "x-rapidapi-host": "voicerss-text-to-speech.p.rapidapi.com",
        "useQueryString": "true",
      },
    );
    _audioPlayer.play();
  }

  Future<void> clickFav(Word word) async {
    print('Hello');
    emit(CategoryListLoading());
    await _wordRepository.updateFav(word);
    emit(CategoryListLoaded());
  }
}
