import 'package:json_annotation/json_annotation.dart';

import 'rating_dto.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {
  @JsonKey(name: "Title")
  final String? title;
  @JsonKey(name: "Year")
  final String? year;
  @JsonKey(name: "Rated")
  final String? rated;
  @JsonKey(name: "Released")
  final String? released;
  @JsonKey(name: "Runtime")
  final String? runtime;
  @JsonKey(name: "Genre")
  final String? genre;
  @JsonKey(name: "Director")
  final String? director;
  @JsonKey(name: "Writer")
  final String? writer;
  @JsonKey(name: "Actors")
  final String? actors;
  @JsonKey(name: "Plot")
  final String? plot;
  @JsonKey(name: "Language")
  final String? language;
  @JsonKey(name: "Country")
  final String? country;
  @JsonKey(name: "Awards")
  final String? awards;
  @JsonKey(name: "Poster")
  final String? poster;

  @JsonKey(name: "Ratings")
  final List<RatingDto>? ratings;
  @JsonKey(name: "Metascore")
  final String? metascore;
  final String? imdbRating;
  final String? imdbVotes;
  @JsonKey(name: "imdbID")
  final String? imdbId;
  @JsonKey(name: "Type")
  final String? type;
  @JsonKey(name: "DVD")
  final String? dvd;
  @JsonKey(name: "BoxOffice")
  final String? boxOffice;
  @JsonKey(name: "Production")
  final String? production;
  @JsonKey(name: "Website")
  final String? website;
  final String? totalSeasons;
  @JsonKey(name: "Response")
  final String? response;

  MovieDto(
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbId,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.totalSeasons,
    this.response,
  );

  factory MovieDto.fromJson(Map<String, dynamic> json) => _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);
}
