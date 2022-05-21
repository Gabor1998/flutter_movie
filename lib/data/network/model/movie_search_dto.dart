import 'package:flutter_movie/data/network/model/movie_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_search_dto.g.dart';

@JsonSerializable()
class MovieSearchDto {
  @JsonKey(name: "Search")
  final List<MovieDto> movies;
  final String totalResults;
  @JsonKey(name: "Response")
  final String response;

  MovieSearchDto(this.movies, this.totalResults, this.response);

  factory MovieSearchDto.fromJson(Map<String, dynamic> json) => _$MovieSearchDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieSearchDtoToJson(this);
}
