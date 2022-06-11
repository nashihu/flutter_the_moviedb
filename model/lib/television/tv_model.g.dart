// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TV _$TVFromJson(Map<String, dynamic> json) => TV()
  ..posterPath = json['poster_path'] as String?
  ..title = json['name'] as String?
  ..id = json['id'] as int?;

Map<String, dynamic> _$TVToJson(TV instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'name': instance.title,
      'id': instance.id,
    };
