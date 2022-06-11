import 'package:json_annotation/json_annotation.dart';
part 'tv_model.g.dart';

@JsonSerializable()
class TV {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'name')
  String? title;

  int? id;

  TV();

  factory TV.fromJson(Map<String, dynamic> json) => _$TVFromJson(json);

  toJson() => _$TVToJson(this);
}
