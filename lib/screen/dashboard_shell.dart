import 'package:example/firebase/firebase_authentication.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../router/routes.dart';

class DashboardShell extends StatelessWidget {
  const DashboardShell({
    super.key,
    required this.state,
    required this.navigator,
  });

  final GoRouterState state;
  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: const NavigationAppBar(
        automaticallyImplyLeading: false,
        title: Text('Example App'),
      ),
      pane: NavigationPane(
        items: $dashboardShellRoute.routes
            .map((route) => _routeToNavigation(route, navigator))
            .toList(),
        selected: routes.indexWhere((e) => state.fullPath == e.$1),
        onChanged: (value) => GoRouter.of(context).go(routes[value].$1),
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.color),
            title: const Text('Theme'),
            body: navigator,
          ),
          if (FirebaseAuthentication.instance.currentUser != null)
            PaneItemAction(
              icon: const Icon(FluentIcons.sign_out),
              title: const Text('Sign out'),
              onTap: () => showDialog(
                context: context,
                builder: (context) => ContentDialog(
                  title: const Text('Sign out'),
                  content: const Text('Are you sure you want to sign out?'),
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
