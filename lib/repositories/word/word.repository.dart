import 'package:haiporo/models/word/word.dart';
import 'package:haiporo/utils/database-helper.dart';

class WordRepository {
  final db = DatabaseHelper().db;

  Future<List<Word>> getThemeWord(int categoryId) async {
    final List<Map<String, dynamic>> maps = await (await db).rawQuery(
        'SELECT * FROM categoryword INNER JOIN av ON av.id = categoryword.avid WHERE categoryword.categoryid = $categoryId');
    return List.generate(maps.length, (i) {
      return Word.fromJson(maps[i]);
    });
  }

  Future<Word> getById(int id) async {
    final List<Map<String, dynamic>> maps =
        await (await db).rawQuery('SELECT * FROM av WHERE id = $id');
    return Word.fromJson(maps[0]);
  }

  Future<List<Word>> search(String word) async {
    final List<Map<String, dynamic>> maps = await (await db)
        .rawQuery('SELECT * FROM av WHERE word LIKE "%$word%" LIMIT 50');
    return List.generate(maps.length, (i) {
      return Word.fromJson(maps[i]);
    });
  }

  Future<List<Word>> getFavorite() async {
    final List<Map<String, dynamic>> maps =
        await (await db).rawQuery("SELECT * FROM av WHERE fav is not 0");
    return List.generate(maps.length, (i) {
      return Word.fromJson(maps[i]);
    });
  }

  Future<void> incrementRight(Word word) async {
    await (await db).rawUpdate(
        'UPDATE av SET right = ? WHERE id = ?', [word.right + 1, word.id]);
  }

  Future<void> updateFav(Word word) async {
    await (await db).rawUpdate(
        'UPDATE av SET fav = ? WHERE id = ?', [word.fav == 0 ? 1 : 0, word.id]);
  }
}
