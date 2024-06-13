import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';
import 'home_page.dart';
import 'search_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CupertinoApp(home: DashboardPage()));
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const Map<BottomNavigationBarItem, Widget> tabs = {
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)): HomePage(),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)): SearchPage(),
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabs.keys.toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return tabs.entries.elementAt(index).value;
          },
        );
      },
    );
  }
}
