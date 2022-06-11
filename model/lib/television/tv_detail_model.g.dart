// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVDetail _$TVDetailFromJson(Map<String, dynamic> json) => TVDetail(
      (json['genres'] as List<dynamic>?)
              ?.map((e) => TVGenre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..backdropPath = json['backdrop_path'] as String?
      ..originalTitle = json['name'] as String?
      ..voteAvg = (json['vote_average'] as num?)?.toDouble()
      ..releaseDate = json['first_air_date'] as String?
      ..overview = json['overview'] as String?;

Map<String, dynamic> _$TVDetailToJson(TVDetail instance) => <String, dynamic>{
      'genres': instance.genres,
      'backdrop_path': instance.backdropPath,
      'name': instance.originalTitle,
      'vote_average': instance.voteAvg,
      'first_air_date': instance.releaseDate,
      'overview': instance.overview,
    };

TVGenre _$TVGenreFromJson(Map<String, dynamic> json) =>
    TVGenre()..name = json['name'] as String?;

Map<String, dynamic> _$TVGenreToJson(TVGenre instance) => <String, dynamic>{
      'name': instance.name,
    };
