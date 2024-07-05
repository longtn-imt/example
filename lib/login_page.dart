import 'package:flutter/cupertino.dart';

import 'firebase_authentication.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: ListView(
        children: [
          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile.notched(
                title: const Text(
                  'Google',
                  style: TextStyle(color: CupertinoColors.systemGreen),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  FirebaseAuthentication.instance.signInWithGoogle();
                },
              ),
              CupertinoListTile.notched(
                title: const Text(
                  'Facebook',
                  style: TextStyle(color: CupertinoColors.systemBlue),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  FirebaseAuthentication.instance.signInWithFacebook();
                },
              ),
              CupertinoListTile.notched(
                title: const Text('Apple'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  FirebaseAuthentication.instance.signInWithApple();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
