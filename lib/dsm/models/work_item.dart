import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_item.freezed.dart';
part 'work_item.g.dart';

@freezed
class WorkItem with _$WorkItem {
  const factory WorkItem({
    AssignedTo? assignedTo,
    int? id,
    String? workItemType,
    String? title,
    String? state,
    DateTime? changedDate,
    String? teamProject,
    DateTime? activityDate,
    String? activityType,
    String? identityId,
  }) = _WorkItem;

  factory WorkItem.fromJson(Map<String, dynamic> json) =>
      _$WorkItemFromJson(json);
}

@freezed
class AssignedTo with _$AssignedTo {
  const factory AssignedTo({
    String? id,
    String? name,
    String? displayName,
    String? uniqueName,
    String? descriptor,
  }) = _AssignedTo;

  factory AssignedTo.fromJson(Map<String, dynamic> json) =>
      _$AssignedToFromJson(json);
}
