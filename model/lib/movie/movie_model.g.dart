// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie()
  ..posterPath = json['poster_path'] as String?
  ..title = json['original_title'] as String?
  ..id = json['id'] as int?;

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'original_title': instance.title,
      'id': instance.id,
    };
