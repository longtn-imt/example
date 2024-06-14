import 'package:flutter/cupertino.dart';

import 'firebase_authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? currentUser;

  @override
  void initState() {
    super.initState();

    /// Listen to changes in the current user.
    FirebaseAuthentication.instance.userChanges().listen((User? user) {
      setState(() {
        currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('OAuth Demo'),
      ),
      child: ListView(
        children: [
          CupertinoListSection.insetGrouped(
            header: const Text('Personal information'),
            children: <CupertinoListTile>[
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.person),
                title: const Text('Name'),
                subtitle: Text(currentUser?.displayName ?? 'unknown'),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.mail),
                title: const Text('Email'),
                subtitle: Text(currentUser?.email ?? 'unknown'),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.phone),
                title: const Text('Phone number'),
                subtitle: Text(currentUser?.phoneNumber ?? 'unknown'),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.link),
                title: const Text('Photo URL'),
                subtitle: Text(currentUser?.photoURL ?? 'unknown'),
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            header: const Text('Authentication'),
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.padlock),
                title: const Text('UID'),
                subtitle: Text(currentUser?.uid ?? 'unknown'),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.smoke),
                title: const Text('Tenant ID'),
                subtitle: Text(currentUser?.tenantId ?? 'unknown'),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.refresh),
                title: const Text('Refresh token'),
                subtitle: Text(currentUser?.refreshToken ?? 'unknown'),
              ),
            ],
          ),
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
              CupertinoListTile.notched(
                title: const Text(
                  'Logout',
                  style: TextStyle(color: CupertinoColors.systemRed),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: FirebaseAuthentication.instance.signOut,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
