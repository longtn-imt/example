import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

import 'firebase/firebase_options.dart';
import 'router/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider(
      const String.fromEnvironment('RE_CAPTCHA_SITE_KEY'),
    ),
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.debug,
  );

  runApp(FluentApp.router(routerConfig: goRouter));
}
