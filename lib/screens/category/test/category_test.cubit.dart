import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/models/word/word.dart';
import 'package:haiporo/repositories/word/word.repository.dart';

part 'category_test.state.dart';

class CategoryTestCubit extends Cubit<CategoryTestState> {
  final WordRepository _wordRepository = WordRepository();
  List<Word> words = [];
  int categoryId;

  CategoryTestCubit(int categoryId) : super(CategoryTestInitial()) {
    this.categoryId = categoryId;
    getThemeWord();
  }

  final int questionNumber = 10;

  List<int> questions = [];

  int answer;

  Timer timer;

  int value = 60;

  int current = 0;

  int heart = 3;

  void reset(BuildContext context) {
    heart = 3;
    value = 60;
    current = 1;
    startTimer(context);
  }

  void getQuestion() {
    emit(CategoryTestQuestionLoading());
    current++;
    questions = [];
    Random rd = new Random();

    // get questions
    for (int i = 0; i < 4; i++) {
      int id = rd.nextInt(words.length);
      while (questions.contains(id)) {
        id = rd.nextInt(words.length);
      }
      questions.add(id);
    }

    // get answer
    answer = rd.nextInt(4);
    emit(CategoryTestQuestionLoaded());
  }

  void takeAnswer(BuildContext context, i) {
    if (i != answer) {
      heart--;
      if (heart == 0) {
        timer.cancel();
        showFailDialog(context);
      } else {
        getQuestion();
      }
    } else {
      if (current == questionNumber) {
        timer.cancel();
        showSuccessDialog(context);
      } else {
        getQuestion();
      }
    }
  }

  void startTimer(BuildContext context) {
    if (timer != null) {
      timer.cancel();
    }
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (value == 0) {
          timer.cancel();
          showFailDialog(context);
        } else {
          value--;
        }
        emit(Running(value));
      },
    );
  }

  @override
  Future<void> close() async {
    super.close();
    timer.cancel();
  }

  Future<void> getThemeWord() async {
    emit(CategoryTestLoading());
    words = await _wordRepository.getThemeWord(categoryId);
    emit(CategoryTestLoaded());
    getQuestion();
  }

  void showFailDialog(BuildContext context) {
    print('ngu vkl');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text("Oops! you need to learn moarrr"),
        content: Text("Do you want to try again?"),
        actions: [
          TextButton(
              onPressed: () {
                Modular.to.pop();
                Modular.to.pop();
              },
              child: Text("No")),
          TextButton(
              onPressed: () {
                reset(context);
                Modular.to.pop();
              },
              child: Text("Yes")),
        ],
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    print('vjp Z');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text("Congratulation!"),
        content: Text("Do you want to try again?"),
        actions: [
          TextButton(
              onPressed: () {
                Modular.to.pop();
                Modular.to.pop();
              },
              child: Text("No")),
          TextButton(
              onPressed: () {
                reset(context);
                Modular.to.pop();
              },
              child: Text("Yes")),
        ],
      ),
    );
  }
}
