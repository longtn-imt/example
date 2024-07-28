import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../firebase/firebase_authentication.dart';
import '../screen/dashboard_shell.dart';
import '../screen/dsm_page.dart';
import '../screen/error_page.dart';
import '../screen/home_page.dart';
import '../screen/login_page.dart';
import '../screen/setting_page.dart';
import '../screen/task_page.dart';
import '../screen/user_page.dart';
import 'go_router_refresh_stream.dart';

part 'routes.g.dart';
part 'router.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute({this.from});

  final String? from;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return authRedirect(context, state);
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
    TypedGoRoute<UserRoute>(path: '/user', routes: [
      TypedGoRoute<DmsRoute>(path: 'dms'),
      TypedGoRoute<TaskRoute>(path: 'task'),
    ]),
    TypedGoRoute<SettingRoute>(path: '/setting'),
  ],
)
class DashboardShellRoute extends ShellRouteData {
  const DashboardShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return DashboardShell(state: state, navigator: navigator);
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class UserRoute extends GoRouteData {
  const UserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserPage();
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return authRedirect(context, state);
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

class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingPage();
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return authRedirect(context, state);
  }
}
