// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devops_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevopsConfig _$DevopsConfigFromJson(Map<String, dynamic> json) {
  return _DevopsConfig.fromJson(json);
}

/// @nodoc
mixin _$DevopsConfig {
  String? get usernmae => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DevopsConfigCopyWith<DevopsConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevopsConfigCopyWith<$Res> {
  factory $DevopsConfigCopyWith(
          DevopsConfig value, $Res Function(DevopsConfig) then) =
      _$DevopsConfigCopyWithImpl<$Res, DevopsConfig>;
  @useResult
  $Res call({String? usernmae, String? password});
}

/// @nodoc
class _$DevopsConfigCopyWithImpl<$Res, $Val extends DevopsConfig>
    implements $DevopsConfigCopyWith<$Res> {
  _$DevopsConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernmae = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      usernmae: freezed == usernmae
          ? _value.usernmae
          : usernmae // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DevopsConfigImplCopyWith<$Res>
    implements $DevopsConfigCopyWith<$Res> {
  factory _$$DevopsConfigImplCopyWith(
          _$DevopsConfigImpl value, $Res Function(_$DevopsConfigImpl) then) =
      __$$DevopsConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? usernmae, String? password});
}

/// @nodoc
class __$$DevopsConfigImplCopyWithImpl<$Res>
    extends _$DevopsConfigCopyWithImpl<$Res, _$DevopsConfigImpl>
    implements _$$DevopsConfigImplCopyWith<$Res> {
  __$$DevopsConfigImplCopyWithImpl(
      _$DevopsConfigImpl _value, $Res Function(_$DevopsConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernmae = freezed,
    Object? password = freezed,
  }) {
    return _then(_$DevopsConfigImpl(
      usernmae: freezed == usernmae
          ? _value.usernmae
          : usernmae // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DevopsConfigImpl implements _DevopsConfig {
  const _$DevopsConfigImpl({this.usernmae, this.password});

  factory _$DevopsConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevopsConfigImplFromJson(json);

  @override
  final String? usernmae;
  @override
  final String? password;

  @override
  String toString() {
    return 'DevopsConfig(usernmae: $usernmae, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevopsConfigImpl &&
            (identical(other.usernmae, usernmae) ||
                other.usernmae == usernmae) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, usernmae, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevopsConfigImplCopyWith<_$DevopsConfigImpl> get copyWith =>
      __$$DevopsConfigImplCopyWithImpl<_$DevopsConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DevopsConfigImplToJson(
      this,
    );
  }
}

abstract class _DevopsConfig implements DevopsConfig {
  const factory _DevopsConfig(
      {final String? usernmae, final String? password}) = _$DevopsConfigImpl;

  factory _DevopsConfig.fromJson(Map<String, dynamic> json) =
      _$DevopsConfigImpl.fromJson;

  @override
  String? get usernmae;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$DevopsConfigImplCopyWith<_$DevopsConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
