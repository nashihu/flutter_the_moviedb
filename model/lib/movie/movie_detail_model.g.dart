// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..backdropPath = json['backdrop_path'] as String?
      ..originalTitle = json['original_title'] as String?
      ..voteAvg = (json['vote_average'] as num?)?.toDouble()
      ..releaseDate = json['release_date'] as String?
      ..overview = json['overview'] as String?;

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'backdrop_path': instance.backdropPath,
      'original_title': instance.originalTitle,
      'vote_average': instance.voteAvg,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) =>
    Genre()..name = json['name'] as String?;

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'name': instance.name,
    };
