// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values, cast_nullable_to_non_nullable

import 'package:community_material_icon/community_material_icon.dart';
import 'package:design_tools/design_tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/color_schemes_list.dart';

import 'package:fredgrotts_md3_demo/src/domain/entities/screen_selected.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/theme_store.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/navigation_stuff.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/static_theme_datas.dart';
import 'package:go_router/go_router.dart';

late bool isDesignGrid;

class GoRouterSharedScaffold extends StatefulWidget {
  final ScreenSelected screenSelected;
  final Widget child;

  const GoRouterSharedScaffold({
    super.key,
    required this.screenSelected,
    required this.child,
  });

  @override
  State<GoRouterSharedScaffold> createState() => _GoRouterSharedScaffoldState();
}

class _GoRouterSharedScaffoldState extends State<GoRouterSharedScaffold> {
  int themeSelected = 0;

  bool onDesignGrid() {
    setState(() {
      isDesignGrid = !isDesignGrid;
    });

    return isDesignGrid;
  }

  void handleSelect(int value) {
    setState(() {
      themeSelected = value;

      if (themeSelected == 0) {
        ThemeStore.of(context)!.updateTheme(lightStaticThemeData);
      }
      if (themeSelected == 1) {
        ThemeStore.of(context)!.updateTheme(lighthighcontrastStaticThemeData);
      }
      if (themeSelected == 2) {
        ThemeStore.of(context)!.updateTheme(darkStaticThemeData);
      }
      if (themeSelected == 3) {
        ThemeStore.of(context)!.updateTheme(darkhighcontrastStaticThemeData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DesignTools(
      key: const Key("DesignGrid"),
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
        key: const Key("Scaffold"),
        body: AdaptiveLayout(
          key: const Key("AdaptiveLayout"),
          // MediaQuery displayFeatures is only non-null on Android foldables,
          // in my setting bodyRatio to 1.0 I am using the free canvas mode
          // where content is dispalyed on both screen one and screen two.
          // Two Pane patterns will require extra boilerplate to
          // cycle between non-foldables and foldables.
          bodyRatio: 1.0,
          topNavigation: SlotLayout(
            key: const Key("TopNavigationSlot"),
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
            key: const Key("PrimaryNavigationSlot"),
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
                  destinations: navRailDestinations,
                  selectedIndex: widget.screenSelected.index,
                  onDestinationSelected: (int idx) {
                    switch (ScreenSelected.values[idx]) {
                      case ScreenSelected.component:
                        context.go('/');
                        break;
                      case ScreenSelected.color:
                        context.go('/color');
                        break;
                      case ScreenSelected.elevation:
                        context.go('/elevation');
                        break;
                      case ScreenSelected.typography:
                        context.go('/typography');
                        break;
                    }
                  },
                  selectedIconTheme: Theme.of(context)
                      .navigationRailTheme
                      .selectedIconTheme as IconThemeData,
                  unselectedIconTheme: Theme.of(context)
                      .navigationRailTheme
                      .unselectedIconTheme as IconThemeData,
                  selectedLabelTextStyle: Theme.of(context)
                      .navigationRailTheme
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
                  selectedIndex: widget.screenSelected.index,
                  onDestinationSelected: (int idx) {
                    switch (ScreenSelected.values[idx]) {
                      case ScreenSelected.component:
                        context.go('/');
                        break;
                      case ScreenSelected.color:
                        context.go('/color');
                        break;
                      case ScreenSelected.elevation:
                        context.go('/elevation');
                        break;
                      case ScreenSelected.typography:
                        context.go('/typography');
                        break;
                    }
                  },

                  selectedIconTheme: Theme.of(context)
                      .navigationRailTheme
                      .selectedIconTheme as IconThemeData,
                  unselectedIconTheme: Theme.of(context)
                      .navigationRailTheme
                      .unselectedIconTheme as IconThemeData,
                  selectedLabelTextStyle: Theme.of(context)
                      .navigationRailTheme
                      .selectedLabelTextStyle as TextStyle,
                ),
              ),
            },
          ),

          body: SlotLayout(
            key: const Key("BodySlot"),
            config: {
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key("BodySmallAndUp"),
                builder: (context) => widget.child,
              ),
            },
          ),
          secondaryBody: SlotLayout(
            key: const Key("SecondBodySlot"),
            config: {
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key("Second Body"),
                builder: AdaptiveScaffold.emptyBuilder,
              ),
            },
          ),
          bottomNavigation: SlotLayout(
              key: const Key("BottomNavigationSlot"),
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.small: SlotLayout.from(
                  key: const Key("Bottom Nav Small"),
                  inAnimation: AdaptiveScaffold.bottomToTop,
                  outAnimation: AdaptiveScaffold.topToBottom,
                  builder: (_) => BottomNavigationBarTheme(
                    data: BottomNavigationBarThemeData(
                          selectedItemColor: Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedItemColor,
                          selectedIconTheme: Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedIconTheme,
                          unselectedItemColor: Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                          unselectedIconTheme: Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedIconTheme,
                          selectedLabelStyle: Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedLabelStyle,
                          unselectedLabelStyle: Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedLabelStyle,
                          showSelectedLabels: true,
                          showUnselectedLabels: true,
                        ),
                     child: AdaptiveScaffold.standardBottomNavigationBar(
                       destinations: appBarDestinations,
                       currentIndex: widget.screenSelected.index,
                       onDestinationSelected: (int idx) {
                         switch (ScreenSelected.values[idx]) {
                           case ScreenSelected.component:
                             context.go('/');
                             break;
                           case ScreenSelected.color:
                             context.go('/color');
                             break;
                           case ScreenSelected.elevation:
                             context.go('/elevation');
                             break;
                           case ScreenSelected.typography:
                             context.go('/typography');
                             break;
                         }
                  },

                     ),
                  ),

                ),
              },
            ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    isDesignGrid = false;
  }

  //
  // ignore: long-method
  PreferredSizeWidget createAppBar() {
    Widget appTitle = const Text("Material 3");

    appTitle =
        appTitle.animate(onPlay: (controller) => controller.repeat()).shimmer(
              duration: 1200.ms,
              color: Theme.of(context).colorScheme.secondary,
            );

    return AppBar(
      title: appTitle,
      actions: [
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: kDebugMode,
          child: IconButton(
            tooltip: "DesignGrid",
            onPressed: () => onDesignGrid(),
            icon: const Icon(CommunityMaterialIcons.grid),
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
            //
            // ignore: prefer-extracting-callbacks
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
