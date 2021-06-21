import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haiporo/models/word/word.dart';
import 'package:haiporo/repositories/word/word.repository.dart';

part 'search.state.dart';

class SearchCubit extends Cubit<SearchState> {
  final WordRepository _wordRepository = WordRepository();
  List<Word> words = [];
  TextEditingController textEditingController = TextEditingController();

  int value = 2;
  Timer timer;

  SearchCubit() : super(Initial()) {
    start();
  }

  void start() {
    if (timer != null) {
      timer.cancel();
    }
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (value == 0) {
          await search(textEditingController.text);
          value = 2;
        } else {
          value--;
        }
      },
    );
  }

  Future<void> search(String word) async {
    if (word.isEmpty != true) {
      emit(Loading());
      words = await _wordRepository.search(word);
      emit(Loaded());
    }
  }
}
