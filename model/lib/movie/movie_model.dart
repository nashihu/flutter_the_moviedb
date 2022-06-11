import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'original_title')
  String? title;

  int? id;

  Movie();

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  toJson() => _$MovieToJson(this);
}
