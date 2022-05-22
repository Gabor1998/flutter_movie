// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSearchDto _$MovieSearchDtoFromJson(Map<String, dynamic> json) =>
    MovieSearchDto(
      (json['Search'] as List<dynamic>?)
          ?.map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalResults'] as String?,
      json['Response'] as String?,
    );

Map<String, dynamic> _$MovieSearchDtoToJson(MovieSearchDto instance) =>
    <String, dynamic>{
      'Search': instance.movies,
      'totalResults': instance.totalResults,
      'Response': instance.response,
    };
