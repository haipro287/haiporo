import 'package:flutter/material.dart';
import 'package:haiporo/models/category/word-category.dart';
import 'package:haiporo/utils/database-helper.dart';
import 'package:sqflite/sqflite.dart';

class WordCategoryRepository {
  final db = DatabaseHelper().db;

  Future<List<WordCategory>> getWordCategory(int themeId) async {
    final List<Map<String, dynamic>> maps = await (await db)
        .rawQuery('SELECT * FROM category WHERE themeId = $themeId');
    return List.generate(maps.length, (i) {
      return WordCategory.fromJson(maps[i]);
    });
  }

  Future<double> getCategoryProgress(int categoryId) async {
    var instance = await db;
    var wordCount = Sqflite.firstIntValue(await instance.rawQuery(
        'SELECT COUNT(*) FROM categoryword INNER JOIN av ON av.id = categoryword.avid WHERE categoryword.categoryid = $categoryId'));
    var wordCompleteCount = Sqflite.firstIntValue(await instance.rawQuery(
        'SELECT COUNT(*) FROM categoryword INNER JOIN av ON av.id = categoryword.avid WHERE categoryword.categoryid = $categoryId AND av.right >= "3"'));
    return wordCount==0 ?0: wordCompleteCount / wordCount;
  }
}
