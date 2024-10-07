import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../firebase/firebase_authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: const PageHeader(title: Text('Login')),
      content: Stack(
        fit: StackFit.expand,
        children: [
          const FlutterLogo(),
          Acrylic(
            elevation: 5,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                ListTile(
                  title: const Text('Google'),
                  onPressed: FirebaseAuthentication.instance.signInWithGoogle,
                ),
                ListTile(
                  title: const Text('Facebook'),
                  onPressed: FirebaseAuthentication.instance.signInWithFacebook,
                ),
                ListTile(
                  title: const Text('Apple'),
                  onPressed: FirebaseAuthentication.instance.signInWithApple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await LocalAuthentication().authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (!mounted) return;
    if (authenticated) {
      FirebaseAuthentication.instance.signInAnonymously();
    }
  }
}
