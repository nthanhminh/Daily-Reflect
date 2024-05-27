import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood_dto.freezed.dart';

part 'mood_dto.g.dart';

@unfreezed
class MoodDto with _$MoodDto {
  factory MoodDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'mood') String? mood,
  }) = _MoodDto;

  factory MoodDto.fromJson(Map<String, dynamic> json) =>
      _$MoodDtoFromJson(json);
}