import 'package:haiporo/models/category/word-category.dart';
import 'package:haiporo/utils/database-helper.dart';

class WordCategoryRepository {
  final db = DatabaseHelper().db;

  Future<List<WordCategory>> getWordCategory(int themeId) async {
    final List<Map<String, dynamic>> maps = await (await db).rawQuery('SELECT * FROM category WHERE themeId = $themeId');
    return List.generate(maps.length, (i) {
      return WordCategory.fromJson(maps[i]);
    });
  }
}
