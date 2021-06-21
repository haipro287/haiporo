import 'package:haiporo/models/theme/word-theme.dart';
import 'package:haiporo/utils/database-helper.dart';

class WordThemeRepository {
  final db = DatabaseHelper().db;

  Future<List<WordTheme>> getWordTheme() async {
    final List<Map<String, dynamic>> maps = await (await db).query('theme');

    return List.generate(maps.length, (i) {
      return WordTheme.fromJson(maps[i]);
    });
  }
}
