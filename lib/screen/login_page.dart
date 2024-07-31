import 'package:fluent_ui/fluent_ui.dart';

import '../firebase/firebase_authentication.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
}
