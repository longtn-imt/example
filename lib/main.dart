import 'package:firebase_core/firebase_core.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

import 'dsm/bot_page.dart';
import 'dsm/dsm_page.dart';
import 'dsm/notification_page.dart';
import 'dsm/task_page.dart';
import 'firebase/firebase_authentication.dart';
import 'firebase/firebase_options.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'user_page.dart';
import 'youtube_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

  runApp(const FluentApp(home: DashboardPage()));
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuthentication.instance.authStateChanges(),
      builder: (context, snapshot) {
        /// Login page if the user is not logged in.
        if (snapshot.data == null) return const LoginPage();

        return ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (context, value, child) {
            return NavigationView(
              appBar: const NavigationAppBar(title: Text('Example App')),
              pane: NavigationPane(
                selected: value,
                onChanged: (index) => selectedIndexNotifier.value = index,
                header: const Text('Menu feature'),
                items: [
                  PaneItem(
                    icon: const Icon(FluentIcons.home),
                    title: const Text('Home'),
                    body: const HomePage(),
                  ),
                  PaneItem(
                    icon: const Icon(FluentIcons.search),
                    title: const Text('Search'),
                    body: const SearchPage(),
                  ),
                  PaneItem(
                    icon: const Icon(FluentIcons.account_management),
                    title: const Text('User'),
                    body: const UserPage(),
                  ),
                  PaneItemExpander(
                    icon: const Icon(FluentIcons.code),
                    title: const Text('DevOps'),
                    body: const DsmPage(),
                    items: [
                      PaneItem(
                        icon: const Icon(FluentIcons.task_add),
                        title: const Text('Task'),
                        body: const TaskPage(),
                      ),
                      PaneItem(
                        icon: const Icon(FluentIcons.ringer_active),
                        title: const Text('Notification'),
                        body: const NotificationPage(),
                      ),
                      PaneItem(
                        icon: const Icon(FluentIcons.robot),
                        title: const Text('Bot'),
                        body: const BotPage(),
                      ),
                    ],
                  ),
                  PaneItem(
                    icon: const Icon(FluentIcons.video),
                    title: const Text('Youtube'),
                    body: const YoutubePage(),
                  ),
                ],
                footerItems: [
                  PaneItemSeparator(),
                  PaneItem(
                    icon: const Icon(FluentIcons.settings),
                    title: const Text('Settings'),
                    body: Container(),
                  ),
                  PaneItemAction(
                    icon: const Icon(FluentIcons.sign_out),
                    title: const Text('Sign out'),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => ContentDialog(
                        title: const Text('Sign out'),
                        content: const Text(
                          'Are you sure you want to sign out?',
                        ),
                        actions: [
                          Button(
                            onPressed: () {
                              Navigator.of(context).pop();
                              FirebaseAuthentication.instance.signOut();
                            },
                            child: const Text('Sign out'),
                          ),
                          FilledButton(
                            onPressed: Navigator.of(context).pop,
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              transitionBuilder: (child, animation) {
                return DrillInPageTransition(
                  animation: animation,
                  child: child,
                );
              },
            );
          },
        );
      },
    );
  }
}
