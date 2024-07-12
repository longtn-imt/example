// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkItem _$WorkItemFromJson(Map<String, dynamic> json) {
  return _WorkItem.fromJson(json);
}

/// @nodoc
mixin _$WorkItem {
  AssignedTo? get assignedTo => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get workItemType => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  DateTime? get changedDate => throw _privateConstructorUsedError;
  String? get teamProject => throw _privateConstructorUsedError;
  DateTime? get activityDate => throw _privateConstructorUsedError;
  String? get activityType => throw _privateConstructorUsedError;
  String? get identityId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkItemCopyWith<WorkItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkItemCopyWith<$Res> {
  factory $WorkItemCopyWith(WorkItem value, $Res Function(WorkItem) then) =
      _$WorkItemCopyWithImpl<$Res, WorkItem>;
  @useResult
  $Res call(
      {AssignedTo? assignedTo,
      int? id,
      String? workItemType,
      String? title,
      String? state,
      DateTime? changedDate,
      String? teamProject,
      DateTime? activityDate,
      String? activityType,
      String? identityId});

  $AssignedToCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class _$WorkItemCopyWithImpl<$Res, $Val extends WorkItem>
    implements $WorkItemCopyWith<$Res> {
  _$WorkItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignedTo = freezed,
    Object? id = freezed,
    Object? workItemType = freezed,
    Object? title = freezed,
    Object? state = freezed,
    Object? changedDate = freezed,
    Object? teamProject = freezed,
    Object? activityDate = freezed,
    Object? activityType = freezed,
    Object? identityId = freezed,
  }) {
    return _then(_value.copyWith(
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as AssignedTo?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      workItemType: freezed == workItemType
          ? _value.workItemType
          : workItemType // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      changedDate: freezed == changedDate
          ? _value.changedDate
          : changedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      teamProject: freezed == teamProject
          ? _value.teamProject
          : teamProject // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activityType: freezed == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String?,
      identityId: freezed == identityId
          ? _value.identityId
          : identityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssignedToCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $AssignedToCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkItemImplCopyWith<$Res>
    implements $WorkItemCopyWith<$Res> {
  factory _$$WorkItemImplCopyWith(
          _$WorkItemImpl value, $Res Function(_$WorkItemImpl) then) =
      __$$WorkItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AssignedTo? assignedTo,
      int? id,
      String? workItemType,
      String? title,
      String? state,
      DateTime? changedDate,
      String? teamProject,
      DateTime? activityDate,
      String? activityType,
      String? identityId});

  @override
  $AssignedToCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class __$$WorkItemImplCopyWithImpl<$Res>
    extends _$WorkItemCopyWithImpl<$Res, _$WorkItemImpl>
    implements _$$WorkItemImplCopyWith<$Res> {
  __$$WorkItemImplCopyWithImpl(
      _$WorkItemImpl _value, $Res Function(_$WorkItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignedTo = freezed,
    Object? id = freezed,
    Object? workItemType = freezed,
    Object? title = freezed,
    Object? state = freezed,
    Object? changedDate = freezed,
    Object? teamProject = freezed,
    Object? activityDate = freezed,
    Object? activityType = freezed,
    Object? identityId = freezed,
  }) {
    return _then(_$WorkItemImpl(
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as AssignedTo?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      workItemType: freezed == workItemType
          ? _value.workItemType
          : workItemType // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      changedDate: freezed == changedDate
          ? _value.changedDate
          : changedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      teamProject: freezed == teamProject
          ? _value.teamProject
          : teamProject // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activityType: freezed == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String?,
      identityId: freezed == identityId
          ? _value.identityId
          : identityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkItemImpl implements _WorkItem {
  const _$WorkItemImpl(
      {this.assignedTo,
      this.id,
      this.workItemType,
      this.title,
      this.state,
      this.changedDate,
      this.teamProject,
      this.activityDate,
      this.activityType,
      this.identityId});

  factory _$WorkItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemImplFromJson(json);

  @override
  final AssignedTo? assignedTo;
  @override
  final int? id;
  @override
  final String? workItemType;
  @override
  final String? title;
  @override
  final String? state;
  @override
  final DateTime? changedDate;
  @override
  final String? teamProject;
  @override
  final DateTime? activityDate;
  @override
  final String? activityType;
  @override
  final String? identityId;

  @override
  String toString() {
    return 'WorkItem(assignedTo: $assignedTo, id: $id, workItemType: $workItemType, title: $title, state: $state, changedDate: $changedDate, teamProject: $teamProject, activityDate: $activityDate, activityType: $activityType, identityId: $identityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemImpl &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workItemType, workItemType) ||
                other.workItemType == workItemType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.changedDate, changedDate) ||
                other.changedDate == changedDate) &&
            (identical(other.teamProject, teamProject) ||
                other.teamProject == teamProject) &&
            (identical(other.activityDate, activityDate) ||
                other.activityDate == activityDate) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType) &&
            (identical(other.identityId, identityId) ||
                other.identityId == identityId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assignedTo,
      id,
      workItemType,
      title,
      state,
      changedDate,
      teamProject,
      activityDate,
      activityType,
      identityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemImplCopyWith<_$WorkItemImpl> get copyWith =>
      __$$WorkItemImplCopyWithImpl<_$WorkItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkItemImplToJson(
      this,
    );
  }
}

abstract class _WorkItem implements WorkItem {
  const factory _WorkItem(
      {final AssignedTo? assignedTo,
      final int? id,
      final String? workItemType,
      final String? title,
      final String? state,
      final DateTime? changedDate,
      final String? teamProject,
      final DateTime? activityDate,
      final String? activityType,
      final String? identityId}) = _$WorkItemImpl;

  factory _WorkItem.fromJson(Map<String, dynamic> json) =
      _$WorkItemImpl.fromJson;

  @override
  AssignedTo? get assignedTo;
  @override
  int? get id;
  @override
  String? get workItemType;
  @override
  String? get title;
  @override
  String? get state;
  @override
  DateTime? get changedDate;
  @override
  String? get teamProject;
  @override
  DateTime? get activityDate;
  @override
  String? get activityType;
  @override
  String? get identityId;
  @override
  @JsonKey(ignore: true)
  _$$WorkItemImplCopyWith<_$WorkItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssignedTo _$AssignedToFromJson(Map<String, dynamic> json) {
  return _AssignedTo.fromJson(json);
}

/// @nodoc
mixin _$AssignedTo {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get uniqueName => throw _privateConstructorUsedError;
  String? get descriptor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignedToCopyWith<AssignedTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedToCopyWith<$Res> {
  factory $AssignedToCopyWith(
          AssignedTo value, $Res Function(AssignedTo) then) =
      _$AssignedToCopyWithImpl<$Res, AssignedTo>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? displayName,
      String? uniqueName,
      String? descriptor});
}

/// @nodoc
class _$AssignedToCopyWithImpl<$Res, $Val extends AssignedTo>
    implements $AssignedToCopyWith<$Res> {
  _$AssignedToCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? displayName = freezed,
    Object? uniqueName = freezed,
    Object? descriptor = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueName: freezed == uniqueName
          ? _value.uniqueName
          : uniqueName // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptor: freezed == descriptor
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignedToImplCopyWith<$Res>
    implements $AssignedToCopyWith<$Res> {
  factory _$$AssignedToImplCopyWith(
          _$AssignedToImpl value, $Res Function(_$AssignedToImpl) then) =
      __$$AssignedToImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? displayName,
      String? uniqueName,
      String? descriptor});
}

/// @nodoc
class __$$AssignedToImplCopyWithImpl<$Res>
    extends _$AssignedToCopyWithImpl<$Res, _$AssignedToImpl>
    implements _$$AssignedToImplCopyWith<$Res> {
  __$$AssignedToImplCopyWithImpl(
      _$AssignedToImpl _value, $Res Function(_$AssignedToImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? displayName = freezed,
    Object? uniqueName = freezed,
    Object? descriptor = freezed,
  }) {
    return _then(_$AssignedToImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueName: freezed == uniqueName
          ? _value.uniqueName
          : uniqueName // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptor: freezed == descriptor
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignedToImpl implements _AssignedTo {
  const _$AssignedToImpl(
      {this.id, this.name, this.displayName, this.uniqueName, this.descriptor});

  factory _$AssignedToImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignedToImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final String? uniqueName;
  @override
  final String? descriptor;

  @override
  String toString() {
    return 'AssignedTo(id: $id, name: $name, displayName: $displayName, uniqueName: $uniqueName, descriptor: $descriptor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignedToImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.uniqueName, uniqueName) ||
                other.uniqueName == uniqueName) &&
            (identical(other.descriptor, descriptor) ||
                other.descriptor == descriptor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, displayName, uniqueName, descriptor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignedToImplCopyWith<_$AssignedToImpl> get copyWith =>
      __$$AssignedToImplCopyWithImpl<_$AssignedToImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignedToImplToJson(
      this,
    );
  }
}

abstract class _AssignedTo implements AssignedTo {
  const factory _AssignedTo(
      {final String? id,
      final String? name,
      final String? displayName,
      final String? uniqueName,
      final String? descriptor}) = _$AssignedToImpl;

  factory _AssignedTo.fromJson(Map<String, dynamic> json) =
      _$AssignedToImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get displayName;
  @override
  String? get uniqueName;
  @override
  String? get descriptor;
  @override
  @JsonKey(ignore: true)
  _$$AssignedToImplCopyWith<_$AssignedToImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
