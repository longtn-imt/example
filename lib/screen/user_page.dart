import 'package:example/screen/login_page.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../firebase/firebase_authentication.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      initialData: FirebaseAuthentication.instance.currentUser,
      stream: FirebaseAuthentication.instance.userChanges(),
      builder: (context, snapshot) {
        final User? currentUser = snapshot.data;

        if (currentUser == null) {
          return const LoginPage();
        }

        return ScaffoldPage.scrollable(
          header: const PageHeader(title: Text('User')),
          children: [
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(currentUser.photoURL ?? ''),
                child: Text(
                  (currentUser.displayName ?? '')
                      .split(' ')
                      .map((e) => e.substring(0, 1))
                      .join(''),
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.user_optional),
              title: const Text('Name'),
              subtitle: Text(currentUser.displayName ?? 'unknown'),
            ),
            ListTile(
              leading: const Icon(FluentIcons.mail),
              title: const Text('Email'),
              subtitle: Text(currentUser.email ?? 'unknown'),
            ),
            ListTile(
              leading: const Icon(FluentIcons.phone),
              title: const Text('Phone number'),
              subtitle: Text(currentUser.phoneNumber ?? 'unknown'),
            ),
            ListTile(
              leading: const Icon(FluentIcons.umbrella),
              title: const Text('UID'),
              subtitle: Text(currentUser.uid),
            ),
            ListTile(
              leading: const Icon(FluentIcons.teams_logo),
              title: const Text('Tenant ID'),
              subtitle: Text(currentUser.tenantId ?? 'unknown'),
            ),
            ListTile(
              leading: const Icon(FluentIcons.refresh),
              title: const Text('Refresh token'),
              subtitle: Text(currentUser.refreshToken ?? 'unknown'),
            ),
          ],
        );
      },
    );
  }
}
