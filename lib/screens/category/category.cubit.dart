import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haiporo/models/category/word-category.dart';
import 'package:haiporo/repositories/word-category/word-category.repository.dart';

part 'category.state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final WordCategoryRepository _categoryRepository = WordCategoryRepository();
  List<WordCategory> cats = [];

  CategoryCubit(int themeId) : super(CategoryInitial()) {
    getCategories(themeId);
  }

  Future<void> getCategories(int themeId) async {
    emit(CategoryLoading());
    cats = await _categoryRepository.getWordCategory(themeId);
    emit(CategoryLoaded());
  }
}
