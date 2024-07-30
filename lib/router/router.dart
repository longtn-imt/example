part of 'routes.dart';

bool get isAuthenticated => FirebaseAuthentication.instance.currentUser != null;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

GoRouter get goRouter => GoRouter(
      navigatorKey: navigatorKey,
      refreshListenable: GoRouterRefreshStream(
        FirebaseAuthentication.instance.authStateChanges(),
      ),
      routes: $appRoutes,
      initialLocation: const InitialRoute().location,
    );

FutureOr<String?> authRedirect(BuildContext context, GoRouterState state) {
  final bool isLoginPath = (state.fullPath ?? state.uri.path).startsWith(
    const LoginRoute().location,
  );

  /// Store the intended location so you can redirect after login
  if (!isLoginPath && !isAuthenticated) {
    return LoginRoute(from: state.uri.path).location;
  }

  /// Handle redirecting back after successful login
  if (isLoginPath && isAuthenticated) {
    return state.uri.queryParameters['from'];
  }

  return null;
}
