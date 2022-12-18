// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values, cast_nullable_to_non_nullable, no_leading_underscores_for_local_identifiers, prefer_final_locals, unused_local_variable

import 'package:animations/animations.dart';
import 'package:boxy/boxy.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:design_tools/design_tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'package:fredgrotts_md3_demo/src/domain/entities/color_schemes_list.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/screen_selected.dart';
import 'package:fredgrotts_md3_demo/src/presentation/custom_animated_theme/animation_type.dart';
import 'package:fredgrotts_md3_demo/src/presentation/custom_animated_theme/custom_animated_theme_app.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/centered_color_palettes_screen.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/centered_components_screen.dart';




import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/navigation_stuff.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/elevation_screen/centered_elevation_screen.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/typography_screen/centered_typography_screen.dart';

import 'package:fredgrotts_md3_demo/src/presentation/themes/static_theme_datas.dart';
import 'package:fredgrotts_md3_demo/src/presentation/widgets/platform_selector.dart';

bool isDesignGrid = false;

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int screenIndex = ScreenSelected.component.value;

  void onChangedPlatform(TargetPlatform platform) {
    setState(() {
      // ignore: prefer-correct-identifier-length
      var debugDefaultTargetPlatformOverride = platform;
    });
  }

  bool onDesignGrid() {
    setState(() {
      isDesignGrid = !isDesignGrid;
    });

    return isDesignGrid;
  }

  int themeSelected = 0;

  late ThemeData themeData;

  void handleScreenChanged(int screenSelected) {
    setState(() {
      screenIndex = screenSelected;
    });
  }

  void handleSelect(int value) {
    setState(() {
      themeSelected = value;

      themeData = updateThemes(
        themeSelected,
      );
    });
  }

  ThemeData updateThemes(
    int themeSelectedMode,
  ) {
    late ThemeData _appTheme;

    if (themeSelectedMode == 0) {
      _appTheme = lightStaticThemeData;
    }
    if (themeSelectedMode == 1) {
      _appTheme = lighthighcontrastStaticThemeData;
    }
    if (themeSelectedMode == 2) {
      _appTheme = darkStaticThemeData;
    }
    if (themeSelectedMode == 3) {
      _appTheme = darkhighcontrastStaticThemeData;
    }

    return themeData = _appTheme;
  }

  @override
  Widget build(BuildContext context) {
    


    return CustomAnimatedThemeApp(
      debugShowCheckedModeBanner: false,
      animationDuration: const Duration(milliseconds: 500),
      animationType: AnimationType.fadeAnimatedTheme,
      themeMode: ThemeMode.light,
      theme: themeData.copyWith(
        platform: defaultTargetPlatform,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.fuchsia: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
          },
        ),
      ),
      home: DesignTools(
        verticalInterval: const GuideInterval(
          18,
          divisions: 2,
        ),
        horizontalInterval: const GuideInterval(
          18,
          divisions: 2,
        ),
        enabled: isDesignGrid,
        keylines: const [
          Keyline(16),
          Keyline(
            16,
            gravity: KeylineGravity.end,
          ),
        ],
        child: Scaffold(
          body: AdaptiveLayout(
            
            // MediaQuery displayFeatures is only non-null on Android foldables, 
            // in my setting bodyRatio to 1.0 I am using the free canvas mode
            // where content is dispalyed on both screen one and screen two.
            // Two Pane patterns will require extra boilerplate to 
            // cycle between non-foldables and foldables.
            bodyRatio: 1.0,
            topNavigation: SlotLayout(
              config: {
                Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key("Top Nav"),
                  // Need to wrap using SizedBox.
                  builder: (_) => SizedBox(
                    width: MediaQuery.of(_).size.width,
                    height: 72,
                    child: createAppBar(),
                  ),
                ),
              },
            ),
            primaryNavigation: SlotLayout(
              config: {
                // What is happening is for small we want this set to empty as we have the bottomNav instead.
                Breakpoints.small: SlotLayout.from(
                  key: const Key('Primary Navigation Small'),
                  builder: (_) => const SizedBox.shrink(),
                ),
                Breakpoints.medium: SlotLayout.from(
                  inAnimation: AdaptiveScaffold.leftOutIn,
                  outAnimation: AdaptiveScaffold.leftOutIn,
                  key: const Key('Primary Navigation Medium'),
                  builder: (_) => AdaptiveScaffold.standardNavigationRail(
                    // Using this manual way to workaround not having tooltip via fasc yet.
                    destinations: navRailDestinations,
                    selectedIndex: screenIndex,
                    onDestinationSelected: handleScreenChanged,
                    selectedIconTheme: themeData
                        .navigationRailTheme.selectedIconTheme as IconThemeData,
                    unselectedIconTheme: themeData.navigationRailTheme
                        .unselectedIconTheme as IconThemeData,
                    selectedLabelTextStyle: themeData.navigationRailTheme
                        .selectedLabelTextStyle as TextStyle,
                  ),
                ),
                Breakpoints.large: SlotLayout.from(
                  inAnimation: AdaptiveScaffold.leftOutIn,
                  outAnimation: AdaptiveScaffold.leftOutIn,
                  key: const Key('Primary Navigation Large'),
                  builder: (_) => AdaptiveScaffold.standardNavigationRail(
                    extended: true,
                    // Using this manual way to workaround not having tooltip via fasc yet.
                    destinations: navRailDestinations,
                    selectedIndex: screenIndex,
                    onDestinationSelected: handleScreenChanged,
                    selectedIconTheme: themeData
                        .navigationRailTheme.selectedIconTheme as IconThemeData,
                    unselectedIconTheme: themeData.navigationRailTheme
                        .unselectedIconTheme as IconThemeData,
                    selectedLabelTextStyle: themeData.navigationRailTheme
                        .selectedLabelTextStyle as TextStyle,
                  ),
                ),
              },
            ),
            body: SlotLayout(
              config: {
                Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key("Body Small"),
                  // Temp workaround as Adaptive Layout does not use the Flutter SDK scaffold internally.
                  builder: (context) => createScreenFor(
                      ScreenSelected.values[screenIndex],
                      true,
                    ),
                  ),
                
              },
            ),
            secondaryBody: SlotLayout(
              config: {
                Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key("Second Body"),
                  builder: AdaptiveScaffold.emptyBuilder,
                ),
              },
            ),
            bottomNavigation: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.small: SlotLayout.from(
                  key: const Key("Bottom Nav Small"),
                  inAnimation: AdaptiveScaffold.bottomToTop,
                  outAnimation: AdaptiveScaffold.topToBottom,
                  builder: (_) => BottomNavigationBarTheme(
                    data: BottomNavigationBarThemeData(
                      selectedItemColor:
                          themeData.bottomNavigationBarTheme.selectedItemColor,
                      selectedIconTheme:
                          themeData.bottomNavigationBarTheme.selectedIconTheme,
                      unselectedItemColor: themeData
                          .bottomNavigationBarTheme.unselectedItemColor,
                      unselectedIconTheme: themeData
                          .bottomNavigationBarTheme.unselectedIconTheme,
                      selectedLabelStyle:
                          themeData.bottomNavigationBarTheme.selectedLabelStyle,
                      unselectedLabelStyle: themeData
                          .bottomNavigationBarTheme.unselectedLabelStyle,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                    ),
                    child: AdaptiveScaffold.standardBottomNavigationBar(
                      destinations: appBarDestinations,
                      currentIndex: screenIndex,
                      onDestinationSelected: handleScreenChanged,
                    ),
                  ),
                ),
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  dynamic initState() {
    super.initState();
    themeData = updateThemes(
      themeSelected,
    );
  }

  Widget createScreenFor(
    ScreenSelected screenSelected,
    bool showNavBarExample,
  ) {
    switch (screenSelected) {
      case ScreenSelected.component:
        return CenteredComponentsScreen(showNavBottomBar: true,);
      case ScreenSelected.color:
        return CenteredColorPalettesScreen();
      case ScreenSelected.typography:
        return CenteredTypographyScreen();
      case ScreenSelected.elevation:
        return CenteredElevationScreen();
      default:
        return CenteredComponentsScreen(showNavBottomBar: true,);
    }
  }

  // Need to wrap in Sized box as we are using a different implementation.
  // ignore: long-method
  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: const Text('Material 3'),
      actions: [
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: kDebugMode,
          child: IconButton(
            onPressed: () => onDesignGrid(),
            icon: const Icon(CommunityMaterialIcons.grid),
          ),
        ),

        // only visible for debug so that can
        // verify platform visual adaptations manually.
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: kDebugMode,
          child: PlatformSelector(
            onChangedPlatform: onChangedPlatform,
          ),
        ),

        PopupMenuButton(
          icon: const Icon(CommunityMaterialIcons.theme_light_dark),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          //
          // ignore: prefer-extracting-callbacks
          itemBuilder: (context) {
            return List.generate(
              appThemeText.length,
              //
              // ignore: prefer-extracting-callbacks
              (index) {
                return PopupMenuItem(
                  value: index,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          index == themeSelected
                              ? Icons.color_lens
                              : Icons.color_lens_outlined,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(appThemeText[index]),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          onSelected: handleSelect,
          tooltip: "Choose Theme",
        ),
      ],
    );
  }
}

