import 'package:fluent_ui/fluent_ui.dart';

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
    FirebaseAuthentication.instance.getRedirectResult().then(print);
  }

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return ScaffoldPage.withPadding(
      content: Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color: Colors.white),
          const FlutterLogo(),
          Acrylic(
            elevation: 5,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  'Sign in with',
                  style: theme.typography.title,
                ),
                const SizedBox(height: 20),
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
