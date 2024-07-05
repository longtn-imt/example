// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListResponse<T> _$ListResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ListResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ListResponse<T> {
  int? get count => throw _privateConstructorUsedError;
  List<T>? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListResponseCopyWith<T, ListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListResponseCopyWith<T, $Res> {
  factory $ListResponseCopyWith(
          ListResponse<T> value, $Res Function(ListResponse<T>) then) =
      _$ListResponseCopyWithImpl<T, $Res, ListResponse<T>>;
  @useResult
  $Res call({int? count, List<T>? value});
}

/// @nodoc
class _$ListResponseCopyWithImpl<T, $Res, $Val extends ListResponse<T>>
    implements $ListResponseCopyWith<T, $Res> {
  _$ListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListResponseImplCopyWith<T, $Res>
    implements $ListResponseCopyWith<T, $Res> {
  factory _$$ListResponseImplCopyWith(_$ListResponseImpl<T> value,
          $Res Function(_$ListResponseImpl<T>) then) =
      __$$ListResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? count, List<T>? value});
}

/// @nodoc
class __$$ListResponseImplCopyWithImpl<T, $Res>
    extends _$ListResponseCopyWithImpl<T, $Res, _$ListResponseImpl<T>>
    implements _$$ListResponseImplCopyWith<T, $Res> {
  __$$ListResponseImplCopyWithImpl(
      _$ListResponseImpl<T> _value, $Res Function(_$ListResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? value = freezed,
  }) {
    return _then(_$ListResponseImpl<T>(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ListResponseImpl<T> implements _ListResponse<T> {
  const _$ListResponseImpl({this.count, final List<T>? value}) : _value = value;

  factory _$ListResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ListResponseImplFromJson(json, fromJsonT);

  @override
  final int? count;
  final List<T>? _value;
  @override
  List<T>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListResponse<$T>(count: $count, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListResponseImpl<T> &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListResponseImplCopyWith<T, _$ListResponseImpl<T>> get copyWith =>
      __$$ListResponseImplCopyWithImpl<T, _$ListResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ListResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ListResponse<T> implements ListResponse<T> {
  const factory _ListResponse({final int? count, final List<T>? value}) =
      _$ListResponseImpl<T>;

  factory _ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ListResponseImpl<T>.fromJson;

  @override
  int? get count;
  @override
  List<T>? get value;
  @override
  @JsonKey(ignore: true)
  _$$ListResponseImplCopyWith<T, _$ListResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
