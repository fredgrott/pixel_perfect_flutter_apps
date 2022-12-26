// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/presentation/custom_animated_theme/animation_type.dart';
import 'package:fredgrotts_md3_demo/src/presentation/custom_animated_theme/custom_animated_theme_app.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/app_shared_scaffold.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/app/theme_store.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeStore.of(context)!.theme,
      builder: (context, theme, child,) => CustomAnimatedThemeApp(
          // For Cateche so that page and dialog reprots can be shown.
              navigatorKey: Catcher.navigatorKey,
              key: const Key("Material3App"),
              debugShowCheckedModeBanner: false,
              animationDuration: const Duration(milliseconds: 500),
              animationType: AnimationType.fadeAnimatedTheme,
              themeMode: ThemeMode.light,
              theme: theme.copyWith(
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: ZoomPageTransitionsBuilder(),
                    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
                    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
                    TargetPlatform.linux: ZoomPageTransitionsBuilder(),
                    TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
                    TargetPlatform.windows: ZoomPageTransitionsBuilder(),
                  },
                ),
              ),
              home: AppSharedScaffold(),
      ),
    );
  }
}
