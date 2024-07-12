import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_response.freezed.dart';
part 'list_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ListResponse<T> with _$ListResponse {
  const factory ListResponse({
    int? count,
    List<T>? value,
  }) = _ListResponse;

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ListResponseFromJson(json, fromJsonT);
}
