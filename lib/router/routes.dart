import 'package:example/screen/notification_page.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../firebase/firebase_authentication.dart';
import '../screen/bot_page.dart';
import '../screen/dsm_page.dart';
import '../screen/home_page.dart';
import '../screen/login_page.dart';
import '../screen/search_page.dart';
import '../screen/setting_page.dart';
import '../screen/task_page.dart';
import '../screen/user_page.dart';
import '../screen/youtube_page.dart';
import 'go_router_refresh_stream.dart';

part 'routes.g.dart';
part 'router.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<InitialRoute>(path: '/')
class InitialRoute extends GoRouteData {
  const InitialRoute();

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    return const HomeRoute().location;
  }
}

@TypedShellRoute<DashboardShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<SearchRoute>(path: '/search'),
    TypedGoRoute<UserRoute>(path: '/user', routes: [
      TypedGoRoute<DmsRoute>(path: 'dms'),
      TypedGoRoute<TaskRoute>(path: 'task'),
      TypedGoRoute<BotRoute>(path: 'bot'),
    ]),
    TypedGoRoute<YoutubeRoute>(path: '/youtube'),
    TypedGoRoute<NotificationRoute>(path: '/notification'),
    TypedGoRoute<SettingRoute>(path: '/setting'),
  ],
)
class DashboardShellRoute extends ShellRouteData {
  const DashboardShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return NavigationView(
      appBar: const NavigationAppBar(title: Text('Example App')),
      pane: NavigationPane(
          items: $dashboardShellRoute.routes
              .map((route) => _routeToNavigation(route, navigator))
              .toList(),
          selected: routes.indexWhere((e) => state.fullPath == e.$1),
          onChanged: (value) => GoRouter.of(context).go(routes[value].$1),
          footerItems: [
            PaneItemSeparator(),
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
          ]),
    );
  }

  static final List<(String, RouteBase)> routes = _routesToList(
    '',
    $dashboardShellRoute.routes,
  ).toList();

  static NavigationPaneItem _routeToNavigation(
    RouteBase route,
    Widget navigator,
  ) {
    return switch (route) {
      GoRoute() => switch (route) {
          /// Has routes
          GoRoute() when route.routes.isNotEmpty => PaneItemExpander(
              initiallyExpanded: true,
              icon: const Icon(FluentIcons.app_icon_default_list),
              title: Text(route.path),
              body: navigator,
              items: route.routes
                  .map((route) => _routeToNavigation(route, navigator))
                  .toList(),
            ),

          /// Default
          GoRoute() => PaneItem(
              icon: const Icon(FluentIcons.app_icon_default),
              title: Text(route.path),
              body: navigator,
            ),
        },
      RouteBase() => PaneItemSeparator(),
    };
  }

  static Iterable<(String, RouteBase)> _routesToList(
    String prePath, // Preview path
    List<RouteBase> routes, // Sub routes
  ) =>
      routes.expand((RouteBase element) sync* {
        String path = prePath;
        if (element is GoRoute) {
          path = prePath.isEmpty ? element.path : '$prePath/${element.path}';
        }

        yield (path, element);

        if (element.routes.isNotEmpty) {
          yield* _routesToList(path, element.routes);
        }
      });
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class SearchRoute extends GoRouteData {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }
}

class UserRoute extends GoRouteData {
  const UserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserPage();
  }
}

class DmsRoute extends GoRouteData {
  const DmsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DsmPage();
  }
}

class TaskRoute extends GoRouteData {
  const TaskRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TaskPage();
  }
}

class BotRoute extends GoRouteData {
  const BotRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BotPage();
  }
}

class YoutubeRoute extends GoRouteData {
  const YoutubeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const YoutubePage();
  }
}

class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingPage();
  }
}

class NotificationRoute extends GoRouteData {
  const NotificationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationPage();
  }
}
