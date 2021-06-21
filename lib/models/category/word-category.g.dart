// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word-category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordCategory _$WordCategoryFromJson(Map<String, dynamic> json) {
  return WordCategory(
    json['id'] as int,
    json['themeId'] as int,
    json['name'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$WordCategoryToJson(WordCategory instance) => <String, dynamic>{
      'id': instance.id,
      'themeId': instance.themeId,
      'name': instance.name,
      'description': instance.description,
    };
