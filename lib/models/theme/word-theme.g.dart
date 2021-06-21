// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word-theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordTheme _$WordThemeFromJson(Map<String, dynamic> json) {
  return WordTheme(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$WordThemeToJson(WordTheme instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
