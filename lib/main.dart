import 'dart:async';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

import 'firebase/firebase_options.dart';
import 'router/routes.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider(
        const String.fromEnvironment('RE_CAPTCHA_SITE_KEY'),
      ),
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug,
    );

    runApp(FluentApp.router(routerConfig: goRouter));
  }, (error, stack) {
    if (navigatorKey.currentContext == null) return;

    displayInfoBar(navigatorKey.currentContext!, builder: (context, close) {
      return InfoBar(
        severity: InfoBarSeverity.error,
        title: Text(error.toString()),
        content: Text(stack.toString()),
        action: IconButton(
          icon: const Icon(FluentIcons.clear),
          onPressed: close,
        ),
      );
    });
  });
}
