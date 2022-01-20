import 'package:go_router/go_router.dart';
import 'package:riverpod/src/common.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tinder/main.dart';
import 'package:tinder/navigation/routes.dart';
import 'package:tinder/pages/auth_page.dart';
import 'package:tinder/pages/chats_page/chats_page.dart';
import 'package:tinder/pages/splash_page.dart';
import 'package:tinder/services/auth_service/auth_providers.dart';
import 'package:tinder/services/firebase_service/firebase_service.dart';
import 'package:tinder/services/supabase_service/supabase_service.dart';

final routerDelegate = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const ChatsPage(),
    ),
    GoRoute(
      path: Routes.auth,
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
  ],
  redirect: (state) {
    final fromp = state.subloc == '/' ? '' : '?from=${state.subloc}';

    ///in case of initialization problems
    final firebase = container
        .listen(firebaseProvider, (_, __) {})
        .read()
        .whenOrNull(data: (_) => _);
    final supabase = container
        .listen(supabaseProvider, (_, __) {})
        .read()
        .whenOrNull(data: (_) => _);

    final appNotInit = firebase == null || supabase == null;
    final splashIn = state.subloc == Routes.splash;

    if (appNotInit) return splashIn ? null : '${Routes.splash}$fromp';

    if (splashIn) return state.queryParams['from'] ?? '/';

    ///in case of login problems
    final authServiceState = container.read(authServiceProvider.notifier);
    final loggedIn = authServiceState.isSignedIn();
    final loggingIn = state.subloc == Routes.auth;

    if (!loggedIn) return loggingIn ? null : '${Routes.auth}$fromp';

    if (loggingIn) return state.queryParams['from'] ?? '/';
  },
  refreshListenable: refreshListenable,
);

final refreshListenable = () {
  final authStream = container.read(authServiceProvider.notifier).stream;
  final firebaseInitStream = container.read(firebaseProvider.future).asStream();
  final supabaseInitStream = container.read(supabaseProvider.future).asStream();

  final streams = Rx.merge([
    firebaseInitStream,
    supabaseInitStream,
    authStream,
  ]);
  return GoRouterRefreshStream(streams);
}();
