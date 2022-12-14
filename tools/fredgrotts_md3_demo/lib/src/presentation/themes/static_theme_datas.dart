// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values


import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/app_custom_flex_tones.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/app_flex_keys.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/app_flex_sub_theme_datas.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/app_text_themes.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/static_seed_color_schemes.dart';










final FlexColorScheme lightStaticFlexColorScheme = FlexColorScheme.light(
  colorScheme: lightStaticSeedColorScheme,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 10,
  appBarStyle: FlexAppBarStyle.primary,
  appBarOpacity: 1,
  transparentStatusBar: true,
  appBarElevation: 0,
  bottomAppBarElevation: 0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  lightIsWhite: false,
  swapColors: false,
  tooltipsMatchBackground: false,
  subThemesData: staticFlexSubThemesData,
  keyColors: appFlexKeys,
  useMaterial3ErrorColors: false,
  tones: appCustomVividFlexTones(Brightness.light),
  visualDensity: VisualDensity.comfortable,
  textTheme: appLightTextTheme,
  primaryTextTheme: appLightTextTheme,
  materialTapTargetSize: null,
  pageTransitionsTheme: null,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
  swapLegacyOnMaterial3: false,
  
);

final ThemeData lightStaticThemeData = lightStaticFlexColorScheme.toTheme;

//
// ignore: prefer-correct-identifier-length
final FlexColorScheme lighthighcontrastStaticFlexColorScheme = FlexColorScheme.light(
  colorScheme: lighthighcontrastStaticSeedColorScheme,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 10,
  appBarStyle: FlexAppBarStyle.primary,
  appBarOpacity: 1,
  transparentStatusBar: true,
  appBarElevation: 0,
  bottomAppBarElevation: 0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  lightIsWhite: false,
  swapColors: false,
  tooltipsMatchBackground: false,
  subThemesData: staticFlexSubThemesData,
  keyColors: appFlexKeys,
  useMaterial3ErrorColors: false,
  tones: appCustomHighContrastFlexTones(Brightness.light),
  visualDensity: VisualDensity.comfortable,
  textTheme: appLightTextTheme,
  primaryTextTheme: appLightTextTheme,
  materialTapTargetSize: null,
  pageTransitionsTheme: null,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
  swapLegacyOnMaterial3: false,
  
);

//
// ignore: prefer-correct-identifier-length
final ThemeData lighthighcontrastStaticThemeData = lighthighcontrastStaticFlexColorScheme.toTheme;

final FlexColorScheme darkStaticFlexColorScheme = FlexColorScheme.dark(
  colorScheme: darkStaticSeedColorScheme,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 10,
  appBarStyle: FlexAppBarStyle.primary,
  appBarOpacity: 1,
  transparentStatusBar: true,
  appBarElevation: 0,
  bottomAppBarElevation: 0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  darkIsTrueBlack: false,
  swapColors: false,
  tooltipsMatchBackground: false,
  subThemesData: staticFlexSubThemesData,
  keyColors: appFlexKeys,
  useMaterial3ErrorColors: false,
  tones: appCustomVividFlexTones(Brightness.dark),
  visualDensity: VisualDensity.comfortable,
  textTheme: appDarkTextTheme,
  primaryTextTheme: appDarkTextTheme,
  materialTapTargetSize: null,
  pageTransitionsTheme: null,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
  swapLegacyOnMaterial3: false,
  
);

final ThemeData darkStaticThemeData = darkStaticFlexColorScheme.toTheme;

//
// ignore: prefer-correct-identifier-length
final FlexColorScheme darkhighcontrastStaticFlexColorScheme =
    FlexColorScheme.dark(
  colorScheme: darkhighcontrastStaticSeedColorScheme,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 10,
  appBarStyle: FlexAppBarStyle.primary,
  appBarOpacity: 1,
  transparentStatusBar: true,
  appBarElevation: 0,
  bottomAppBarElevation: 0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  darkIsTrueBlack: false,
  swapColors: false,
  tooltipsMatchBackground: false,
  subThemesData: staticFlexSubThemesData,
  keyColors: appFlexKeys,
  useMaterial3ErrorColors: false,
  tones: appCustomHighContrastFlexTones(Brightness.dark),
  visualDensity: VisualDensity.comfortable,
  textTheme: appDarkTextTheme,
  primaryTextTheme: appDarkTextTheme,
  materialTapTargetSize: null,
  pageTransitionsTheme: null,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
  swapLegacyOnMaterial3: false,
  
);

//
// ignore: prefer-correct-identifier-length
final ThemeData darkhighcontrastStaticThemeData =
    darkhighcontrastStaticFlexColorScheme.toTheme;
