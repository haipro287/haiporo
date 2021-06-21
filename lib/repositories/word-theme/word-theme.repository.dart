import 'package:haiporo/models/theme/word-theme.dart';
import 'package:haiporo/utils/database-helper.dart';
import 'package:sqflite/sqflite.dart';

class WordThemeRepository {
  final db = DatabaseHelper().db;

  Future<List<WordTheme>> getWordTheme() async {
    final List<Map<String, dynamic>> maps = await (await db).query('theme');

    return List.generate(maps.length, (i) {
      return WordTheme.fromJson(maps[i]);
    });
  }

  Future<double> getThemeProgress(int themeId) async {
    var instance = await db;
    var wordCount = Sqflite.firstIntValue(await instance.rawQuery(
        'SELECT COUNT(*) FROM category INNER JOIN categoryword ON category.id = categoryword.categoryid INNER JOIN av ON av.id = categoryword.avid WHERE category.themeId = $themeId'));
    var wordCompleteCount = Sqflite.firstIntValue(await instance.rawQuery(
        'SELECT COUNT(*) FROM category INNER JOIN categoryword ON category.id = categoryword.categoryid INNER JOIN av ON av.id = categoryword.avid WHERE category.themeId = $themeId AND av.right >=3'));
    return wordCount==0 ?0: wordCompleteCount / wordCount;
  }
}
