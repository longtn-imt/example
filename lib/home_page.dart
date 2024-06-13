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
        middle: Text('Home'),
      ),
      child: ListView(
        children: [
          CupertinoListSection.insetGrouped(
            header: const Text('Personal information'),
            children: <CupertinoListTile>[
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.person),
                title: const Text('Name'),
                additionalInfo: Text(currentUser?.displayName ?? ''),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.mail),
                title: const Text('Email'),
                additionalInfo: Text(currentUser?.email ?? ''),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.phone),
                title: const Text('Phone number'),
                additionalInfo: Text(currentUser?.phoneNumber ?? ''),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.link),
                title: const Text('Photo URL'),
                additionalInfo: Text(currentUser?.photoURL ?? ''),
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            header: const Text('Authentication'),
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.padlock),
                title: const Text('UID'),
                additionalInfo: Text(currentUser?.uid ?? ''),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.smoke),
                title: const Text('Tenant ID'),
                additionalInfo: Text(currentUser?.tenantId ?? ''),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.refresh),
                title: const Text('Refresh token'),
                additionalInfo: Text(currentUser?.refreshToken ?? ''),
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile.notched(
                title: const Text('Google'),
                additionalInfo: Text(currentUser?.uid ?? ''),
                trailing: const CupertinoListTileChevron(),
                onTap: FirebaseAuthentication.instance.signInWithGoogle,
              ),
              CupertinoListTile.notched(
                title: const Text('Facebook'),
                additionalInfo: Text(currentUser?.tenantId ?? ''),
                trailing: const CupertinoListTileChevron(),
                onTap: FirebaseAuthentication.instance.signInWithFacebook,
              ),
              CupertinoListTile.notched(
                title: const Text('Apple'),
                additionalInfo: Text(currentUser?.refreshToken ?? ''),
                trailing: const CupertinoListTileChevron(),
                onTap: FirebaseAuthentication.instance.signInWithApple,
              ),
              CupertinoListTile.notched(
                title: const Text(
                  'Logout',
                  style: TextStyle(color: CupertinoColors.systemRed),
                ),
                additionalInfo: Text(currentUser?.refreshToken ?? ''),
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
