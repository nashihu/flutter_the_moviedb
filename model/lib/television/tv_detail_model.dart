import 'package:json_annotation/json_annotation.dart';

part 'tv_detail_model.g.dart';

@JsonSerializable()
class TVDetail {
  @JsonKey(name: 'genres', defaultValue: [])
  List<TVGenre> genres;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'name')
  String? originalTitle;

  @JsonKey(name: 'vote_average')
  double? voteAvg;

  @JsonKey(name: 'first_air_date')
  String? releaseDate;

  String? overview;

  TVDetail(this.genres);

  factory TVDetail.fromJson(Map<String, dynamic> json) =>
      _$TVDetailFromJson(json);

  toJson() => _$TVDetailToJson(this);
}

@JsonSerializable()
class TVGenre {
  String? name;

  TVGenre();

  factory TVGenre.fromJson(Map<String, dynamic> json) =>
      _$TVGenreFromJson(json);

  toJson() => _$TVGenreToJson(this);
}
