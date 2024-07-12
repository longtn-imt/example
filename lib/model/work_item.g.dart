// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkItemImpl _$$WorkItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkItemImpl(
      assignedTo: json['assignedTo'] == null
          ? null
          : AssignedTo.fromJson(json['assignedTo'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      workItemType: json['workItemType'] as String?,
      title: json['title'] as String?,
      state: json['state'] as String?,
      changedDate: json['changedDate'] == null
          ? null
          : DateTime.parse(json['changedDate'] as String),
      teamProject: json['teamProject'] as String?,
      activityDate: json['activityDate'] == null
          ? null
          : DateTime.parse(json['activityDate'] as String),
      activityType: json['activityType'] as String?,
      identityId: json['identityId'] as String?,
    );

Map<String, dynamic> _$$WorkItemImplToJson(_$WorkItemImpl instance) =>
    <String, dynamic>{
      'assignedTo': instance.assignedTo,
      'id': instance.id,
      'workItemType': instance.workItemType,
      'title': instance.title,
      'state': instance.state,
      'changedDate': instance.changedDate?.toIso8601String(),
      'teamProject': instance.teamProject,
      'activityDate': instance.activityDate?.toIso8601String(),
      'activityType': instance.activityType,
      'identityId': instance.identityId,
    };

_$AssignedToImpl _$$AssignedToImplFromJson(Map<String, dynamic> json) =>
    _$AssignedToImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      uniqueName: json['uniqueName'] as String?,
      descriptor: json['descriptor'] as String?,
    );

Map<String, dynamic> _$$AssignedToImplToJson(_$AssignedToImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'uniqueName': instance.uniqueName,
      'descriptor': instance.descriptor,
    };
