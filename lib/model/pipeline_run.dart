import 'package:freezed_annotation/freezed_annotation.dart';

part 'pipeline_run.freezed.dart';
part 'pipeline_run.g.dart';

@freezed
class PipelineRun with _$PipelineRun {
  const factory PipelineRun({
    required int id,
    String? name,
    String? url,
    String? createdDate,
  }) = _PipelineRun;

  factory PipelineRun.fromJson(Map<String, dynamic> json) =>
      _$PipelineRunFromJson(json);
}
