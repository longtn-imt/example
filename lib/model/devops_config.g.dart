// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devops_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevopsConfigImpl _$$DevopsConfigImplFromJson(Map<String, dynamic> json) =>
    _$DevopsConfigImpl(
      baseUrl: json['baseUrl'] as String?,
      username: json['username'] as String?,
      password: _$JsonConverterFromJson<String, String>(
          json['password'], const EncryptConverter().fromJson),
    );

Map<String, dynamic> _$$DevopsConfigImplToJson(_$DevopsConfigImpl instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'username': instance.username,
      'password': _$JsonConverterToJson<String, String>(
          instance.password, const EncryptConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
