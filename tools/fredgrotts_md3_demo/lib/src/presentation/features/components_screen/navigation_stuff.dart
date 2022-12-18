// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: 'Updated component list',
    icon: Icon(CommunityMaterialIcons.widgets_outline),
    label: 'Components',
    selectedIcon: Icon(CommunityMaterialIcons.widgets),
  ),
  NavigationDestination(
    tooltip: 'Color palettes in light and dark modes',
    icon: Icon(CommunityMaterialIcons.palette_outline),
    label: 'Color',
    selectedIcon: Icon(CommunityMaterialIcons.palette),
  ),
  NavigationDestination(
    tooltip: 'Different text styles for the default TextTheme',
    icon: Icon(Icons.text_snippet_outlined),
    label: 'Typography',
    selectedIcon: Icon(Icons.text_snippet),
  ),
  NavigationDestination(
    tooltip:
        'Different ways of elevation with a new supported feature "surfaceTintColor"',
    icon: Icon(Icons.invert_colors_on_outlined),
    label: 'Elevation',
    selectedIcon: Icon(Icons.opacity),
  ),
];

final List<NavigationRailDestination> navRailDestinations = appBarDestinations
    .map(
      (destination) => NavigationRailDestination(
        icon: Tooltip(
          message: destination.label,
          child: destination.icon,
        ),
        selectedIcon: Tooltip(
          message: destination.label,
          child: destination.selectedIcon,
        ),
        label: Text(destination.label),
      ),
    )
    .toList();

const List<Widget> exampleBarDestinations = [
  NavigationDestination(
    tooltip: 'Explore',
    icon: Icon(Icons.explore_outlined),
    label: 'Explore',
    selectedIcon: Icon(Icons.explore),
  ),
  NavigationDestination(
    tooltip: 'Pets',
    icon: Icon(Icons.pets_outlined),
    label: 'Pets',
    selectedIcon: Icon(Icons.pets),
  ),
  NavigationDestination(
    tooltip: 'Account',
    icon: Icon(Icons.account_box_outlined),
    label: 'Account',
    selectedIcon: Icon(Icons.account_box),
  ),
];

class NavigationBars extends StatefulWidget {
  final void Function(int)? onSelectItem;
  final int selectedIndex;
  final bool isExampleBar;

  const NavigationBars({
    super.key,
    this.onSelectItem,
    required this.selectedIndex,
    required this.isExampleBar,
  });

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      //
      // ignore: prefer-extracting-callbacks
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
        if (!widget.isExampleBar) widget.onSelectItem!(index);
      },
      destinations:
          widget.isExampleBar ? exampleBarDestinations : appBarDestinations,
    );
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }
}

class NavigationRailSection extends StatefulWidget {
  final void Function(int) onSelectItem;
  final int selectedIndex;

  const NavigationRailSection({
    super.key,
    required this.onSelectItem,
    required this.selectedIndex,
  });

  @override
  State<NavigationRailSection> createState() => _NavigationRailSectionState();
}

class _NavigationRailSectionState extends State<NavigationRailSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      minWidth: 50,
      destinations: navRailDestinations,
      selectedIndex: selectedIndex,
      useIndicator: true,
      //
      // ignore: prefer-extracting-callbacks
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
        widget.onSelectItem(index);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }
}
