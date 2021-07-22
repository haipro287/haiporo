import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  final int id;
  final String word;
  final String description;
  final String pronounce;
  final String html;
  final int right;
  final int fav;

  Word(this.id, this.word, this.description, this.pronounce, this.html, this.right, this.fav);

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}