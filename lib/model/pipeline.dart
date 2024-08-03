import 'package:freezed_annotation/freezed_annotation.dart';

part 'pipeline.freezed.dart';
part 'pipeline.g.dart';

@freezed
class Pipeline with _$Pipeline {
  const factory Pipeline({
    String? folder,
    int? id,
    String? name,
    int? revision,
    String? url,
  }) = _Pipeline;

  factory Pipeline.fromJson(Map<String, dynamic> json) =>
      _$PipelineFromJson(json);
}
