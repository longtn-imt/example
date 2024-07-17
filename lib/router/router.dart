part of 'routes.dart';

bool get isAuthenticated => FirebaseAuthentication.instance.currentUser != null;

final goRouter = GoRouter(
  routes: $appRoutes,
  refreshListenable: GoRouterRefreshStream(
    FirebaseAuthentication.instance.authStateChanges(),
  ),
  initialLocation: isAuthenticated
      ? const LoginRoute().location
      : const HomeRoute().location,
  redirect: (context, state) {
    final bool isLoginPath = state.uri.path.startsWith(
      const LoginRoute().location,
    );

    if (!isLoginPath && !isAuthenticated) {
      return const LoginRoute().location;
    }

    if (isLoginPath && isAuthenticated) {
      return const HomeRoute().location;
    }

    return null;
  },
);
