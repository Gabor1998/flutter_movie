import 'package:json_annotation/json_annotation.dart';

part 'rating_dto.g.dart';

@JsonSerializable()
class RatingDto {
  @JsonKey(name: "Source")
  final String source;
  @JsonKey(name: "Value")
  final String value;

  RatingDto(this.source, this.value);

  factory RatingDto.fromJson(Map<String, dynamic> json) => _$RatingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RatingDtoToJson(this);
}
