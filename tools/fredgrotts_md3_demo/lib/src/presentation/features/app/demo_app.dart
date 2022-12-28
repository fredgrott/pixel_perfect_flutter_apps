// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/screen_selected.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/go_router_shared_scaffold.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/app/theme_store.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/centered_color_palettes_screen.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/centered_components_screen.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/elevation_screen/centered_elevation_screen.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/typography_screen/centered_typography_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

// It would help if we use the updated API!
// See https://docs.flutter.dev/release/breaking-changes/scaffold-messenger
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class DemoApp extends StatelessWidget {
  final ValueKey<String> _scaffoldKey = const ValueKey<String>('App scaffold');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeStore.of(context)!.theme,
      builder: (
        context,
        theme,
        child,
      ) =>
          MaterialApp.router(
        key: const Key("Material3App"),
        title: "MaterialDesign 3",
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        themeMode: ThemeMode.light,
        theme: theme,
      ),
    );
  }
  // Routers require BuildContext.
  late final GoRouter _router = GoRouter(
    // 
    navigatorKey: Catcher.navigatorKey,
    // We only set this when debugging, for example the initial setup of nested navigators.
    debugLogDiagnostics: false,
    initialLocation: '/',
    restorationScopeId: 'MD3DemoApp',
    observers: <NavigatorObserver>[AppNavObserver()],
    routes: [
      GoRoute(
        path: '/',
        name: "Components",
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
        ) =>
            FadeTransitionPage(
          key: _scaffoldKey,
          child: GoRouterSharedScaffold(
            screenSelected: ScreenSelected.component,
            child: CenteredComponentsScreen(showNavBottomBar: true),
          ),
        ),
      ),
      GoRoute(
        path: '/color',
        name: "Color",
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
        ) =>
            FadeTransitionPage(
          key: _scaffoldKey,
          child: GoRouterSharedScaffold(
            screenSelected: ScreenSelected.color,
            child: CenteredColorPalettesScreen(),
          ),
        ),
      ),
      GoRoute(
        path: '/elevation',
        name: "Elevation",
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
        ) =>
            FadeTransitionPage(
          key: _scaffoldKey,
          child: GoRouterSharedScaffold(
            screenSelected: ScreenSelected.elevation,
            child: CenteredElevationScreen(),
          ),
        ),
      ),
      GoRoute(
        path: '/typography',
        name: "Typography",
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
        ) =>
            FadeTransitionPage(
          key: _scaffoldKey,
          child: GoRouterSharedScaffold(
            screenSelected: ScreenSelected.typography,
            child: CenteredTypographyScreen(),
          ),
        ),
      ),
    ],
  );
}

// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);

  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
        );
}

class AppNavObserver extends NavigatorObserver {
  /// The logged message.
  final Logger navLog = Logger('MyNavObserver');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute,) =>
      navLog.info('didPush: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute,) => 
      navLog.info('didPop: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute,) =>
      navLog.info('didRemove: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute,}) =>
      navLog.info('didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}');

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      navLog.info('didStartUserGesture: ${route.str}, '
          'previousRoute= ${previousRoute?.str}');

  @override
  void didStopUserGesture() => navLog.info('didStopUserGesture');
}

extension on Route<dynamic> {
  String get str => 'route(${settings.name}: ${settings.arguments})';
}
