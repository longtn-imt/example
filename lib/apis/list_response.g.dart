// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListResponseImpl<T> _$$ListResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ListResponseImpl<T>(
      count: (json['count'] as num?)?.toInt(),
      value: (json['value'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$ListResponseImplToJson<T>(
  _$ListResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'value': instance.value?.map(toJsonT).toList(),
    };
