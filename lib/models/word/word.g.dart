// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word(
    json['id'] as int,
    json['word'] as String,
    json['description'] as String,
    json['pronounce'] as String,
    json['html'] as String,
    json['right'] as int,
  );
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'description': instance.description,
      'pronounce': instance.pronounce,
      'html': instance.html,
      'right': instance.right,
    };
