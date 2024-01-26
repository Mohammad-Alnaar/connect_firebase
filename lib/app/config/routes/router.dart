// import 'package:chater/app/config/router/named_routes.dart';
// import 'package:chater/app/modules/auth/views/login_screen.dart';
// import 'package:chater/app/modules/auth/views/splash_screen.dart';
import 'package:connect_firebase/app/config/routes/my_named_routes.dart';
import 'package:connect_firebase/app/modules/auth/views/chats_screen.dart';
import 'package:connect_firebase/app/modules/auth/views/locations_screen.dart';
import 'package:connect_firebase/app/modules/auth/views/profile_screen.dart';
import 'package:connect_firebase/app/modules/auth/views/register.dart';
import 'package:connect_firebase/app/modules/auth/views/google%20or%20login.dart';
import 'package:connect_firebase/app/modules/auth/views/splash_screen.dart';
import 'package:connect_firebase/app/modules/navbar/views/navbar_screen.dart';
import 'package:connect_firebase/app/modules/navbar/widgets/bottom_navbar_tabs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///[rootNavigatorKey] used for global | general navigation
final rootNavigatorKey = GlobalKey<NavigatorState>();
final form = GlobalKey<FormState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

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
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(
            tabs: BottomNavBarTabs.tabs(context),
            child: child,
          );
        },
        routes: [
          // Existing route for home screen
          GoRoute(
            path: "/${MyNamedRoutes.chats}",
            name: MyNamedRoutes.chats,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ChatScreen(),
            ),
          ),
          // Add new routes for Profile and Locations screens
          GoRoute(
            path: "/${MyNamedRoutes.profile}",
            name: MyNamedRoutes.profile,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(), // Replace with your Profile screen
            ),
          ),
          // GoRoute(
          //   path: "/${MyNamedRoutes.locations}",
          //   name: MyNamedRoutes.locations,
          //   pageBuilder: (context, state) => NoTransitionPage(
          //     key: state.pageKey,
          //     child:
          //         const LocationsScreen(), // Replace with your Locations screen
          //   ),
          // ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyNamedRoutes.root,
        name: MyNamedRoutes.login,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const MainScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.splash}",
        name: MyNamedRoutes.splash,
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
