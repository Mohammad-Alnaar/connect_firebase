// import 'package:chater/app/config/router/named_routes.dart';
// import 'package:chater/app/modules/auth/views/login_screen.dart';
// import 'package:chater/app/modules/auth/views/splash_screen.dart';
import 'package:connect_firebase/app/config/routes/my_named_routes.dart';
import 'package:connect_firebase/app/modules/auth/views/login.dart';
import 'package:connect_firebase/app/modules/auth/views/register.dart';
import 'package:connect_firebase/app/modules/auth/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///[rootNavigatorKey] used for global | general navigation
final rootNavigatorKey = GlobalKey<NavigatorState>();
final form = GlobalKey<FormState>();

abstract class AppRouter {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const SizedBox();

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: MyNamedRoutes.root,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // outside the [ShellRoute] to make the screen on top of the [BottomNavBar]
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyNamedRoutes.root,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.register}",
        name: MyNamedRoutes.register,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: RegisterScreen(),
        ),
      ),
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router;
}
