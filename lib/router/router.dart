part of 'routes.dart';

bool get isAuthenticated => FirebaseAuthentication.instance.currentUser != null;

final goRouter = GoRouter(
  routes: $appRoutes,
  refreshListenable: GoRouterRefreshStream(
    FirebaseAuthentication.instance.authStateChanges(),
  ),
  initialLocation: const InitialRoute().location,
);

FutureOr<String?> authRedirect(BuildContext context, GoRouterState state) {
  final bool isLoginPath = state.uri.path.startsWith(
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
