part of 'routes.dart';

bool get isAuthenticated => FirebaseAuthentication.instance.currentUser != null;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

GoRouter? _goRouter; // Signleton
GoRouter get goRouter => _goRouter ??= GoRouter(
      navigatorKey: navigatorKey,
      refreshListenable: GoRouterRefreshStream(
        FirebaseAuthentication.instance.authStateChanges(),
      ),
      routes: $appRoutes,
      initialLocation: const InitialRoute().location,
    );

FutureOr<String?> authRedirect(BuildContext context, GoRouterState state) {
  final bool isLoginPath = state.fullPath == const UserRoute().location;

  /// Store the intended location so you can redirect after login
  if (!isLoginPath && !isAuthenticated) {
    return UserRoute(from: state.uri.path).location;
  }

  /// Handle redirecting back after successful login
  if (isLoginPath && isAuthenticated) {
    return state.uri.queryParameters['from'];
  }

  return null;
}
