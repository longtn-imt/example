import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/scheduler.dart';

import 'model/app_config.dart';

final AppController appController = AppController();

class AppController extends ValueNotifier<AppConfig> {
  AppController() : super(const AppConfig());

  bool get isDarkMode => switch (value.themeMode) {
        ThemeMode.system =>
          SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark,
        ThemeMode.light => false,
        ThemeMode.dark => true,
      };

  void changeTheme([bool? isDarkMode]) {
    value = value.copyWith(
      themeMode: isDarkMode == true ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
