import 'package:freezed_annotation/freezed_annotation.dart';

import 'converter/encrypt_converter.dart';

part 'devops_config.freezed.dart';
part 'devops_config.g.dart';

@freezed
class DevopsConfig with _$DevopsConfig {
  const factory DevopsConfig({
    String? baseUrl,
    String? username,
    @EncryptConverter() String? password,
  }) = _DevopsConfig;

  factory DevopsConfig.fromJson(Map<String, dynamic> json) =>
      _$DevopsConfigFromJson(json);
}
