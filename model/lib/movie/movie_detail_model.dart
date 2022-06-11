import 'package:json_annotation/json_annotation.dart';
part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetail {
  @JsonKey(name: 'genres', defaultValue: [])
  List<Genre> genres;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'vote_average')
  double? voteAvg;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  String? overview;

  MovieDetail(this.genres);

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  toJson() => _$MovieDetailToJson(this);
}

@JsonSerializable()
class Genre {
  String? name;

  Genre();

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  toJson() => _$GenreToJson(this);
}
