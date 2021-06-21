import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  final int id;
  final String word;
  final String description;
  final String pronounce;
  final String html;

  Word(this.id, this.word, this.description, this.pronounce, this.html);

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}