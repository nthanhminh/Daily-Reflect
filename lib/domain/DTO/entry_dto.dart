import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_dto.freezed.dart';

part 'entry_dto.g.dart';

@unfreezed
class EntryDto with _$EntryDto {
  factory EntryDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'content') String? mood,
    @JsonKey(name: 'savedDay') String? savedDay,
    @JsonKey(name: 'savedTime') String? savedTime,
    @JsonKey(name: 'moodId') int? moodId,
    @JsonKey(name: 'userId') int? userId,
  }) = _EntryDto;

  factory EntryDto.fromJson(Map<String, dynamic> json) =>
      _$EntryDtoFromJson(json);
}