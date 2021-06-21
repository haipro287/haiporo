import 'package:json_annotation/json_annotation.dart';

part 'word-category.g.dart';

@JsonSerializable()
class WordCategory {
  final int id;
  final int themeId;
  final String name;
  final String description;

  WordCategory(this.id, this.themeId, this.name, this.description);

  factory WordCategory.fromJson(Map<String, dynamic> json) => _$WordCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$WordCategoryToJson(this);
}