import 'package:json_annotation/json_annotation.dart';

part 'word-theme.g.dart';

@JsonSerializable()
class WordTheme {
  final int id;
  final String name;
  final String description;

  const WordTheme(this.id, this.name, this.description);

  factory WordTheme.fromJson(Map<String, dynamic> json) => _$WordThemeFromJson(json);

  Map<String, dynamic> toJson() => _$WordThemeToJson(this);
}