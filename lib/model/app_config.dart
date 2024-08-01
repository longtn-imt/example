import 'package:fluent_ui/fluent_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig({
    @ConvertToThemeMode() @Default(ThemeMode.system) ThemeMode themeMode,
    @ConvertToLocale() @Default(Locale("en")) Locale locale,
  }) = _AppConfig;

  const AppConfig._();

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}

/// Convert field [ThemeMode] of Class to [int] of JSON
class ConvertToThemeMode implements JsonConverter<ThemeMode, int> {
  /// Create a ConvertToBool
  const ConvertToThemeMode();

  @override
  ThemeMode fromJson(int json) => ThemeMode.values.elementAt(json);

  @override
  int toJson(ThemeMode object) => object.index;
}

/// Convert field [Locale] of Class to [String] of JSON
class ConvertToLocale implements JsonConverter<Locale, String> {
  /// Create a ConvertToBool
  const ConvertToLocale();

  @override
  Locale fromJson(String json) => Locale(json);

  @override
  String toJson(Locale object) => object.languageCode;
}
