import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../firebase/firebase_authentication.dart';
import '../screen/build_page.dart';
import '../screen/dashboard_shell.dart';
import '../screen/dsm_page.dart';
import '../screen/home_page.dart';
import '../screen/privacy_policy_page.dart';
import '../screen/setting_page.dart';
import '../screen/user_page.dart';
import 'go_router_refresh_stream.dart';

part 'router.dart';
part 'routes.g.dart';

@TypedGoRoute<InitialRoute>(path: '/')
class InitialRoute extends GoRouteData {
  const InitialRoute();

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    if (state.fullPath == const InitialRoute().location) {
      return const HomeRoute().location;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeRoute().build(context, state);
  }
}

@TypedGoRoute<PrivacyPolicyRoute>(path: '/privacy-policy')
class PrivacyPolicyRoute extends GoRouteData {
  const PrivacyPolicyRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PrivacyPolicyPage();
  }
}

@TypedShellRoute<DashboardShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<UserRoute>(path: '/user', routes: [
      TypedGoRoute<DmsRoute>(path: 'dms'),
      TypedGoRoute<BuildRoute>(path: 'build'),
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
  const UserRoute({this.from});

  final String? from;

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

class BuildRoute extends GoRouteData {
  const BuildRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BuildPage();
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
