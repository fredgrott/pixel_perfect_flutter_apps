// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'dart:math';



import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/app_break_points.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/color_scheme_view.dart';

import 'package:fredgrotts_md3_demo/src/presentation/themes/static_theme_datas.dart';

class ColorSchemePalettesScreen extends StatelessWidget {
  static Color contrastColor(Color color) {
    final brightness = ThemeData.estimateBrightnessForColor(color);
    switch (brightness) {
      case Brightness.dark:
        return Colors.white;
      case Brightness.light:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget schemeLabel(String brightness) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          brightness,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget schemeView(ThemeData theme) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ColorSchemeView(
          colorScheme: theme.colorScheme,
        ),
      );
    }

    // Return one column variant for small screens.
    // Switch from Single Child ScrollView To Listview
    if (SmallBreakpoint().isActive(context) ||
        MediumBreakpoint().isActive(context)) {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: LayoutGrid(
              columnSizes: [1.fr],
              rowSizes: const [
                auto,
                auto,
                auto,
                auto,
                auto,
                auto,
                auto,
                auto,
                auto,
                auto,
                auto,
                auto,
              ],
              rowGap: 5,
              columnGap: 5,
              children: [
                divider,
                schemeLabel('Light Theme'),
                schemeView(lightStaticThemeData),
                divider,
                schemeLabel('Light HC Theme'),
                schemeView(lighthighcontrastStaticThemeData),
                divider,
                schemeLabel('Dark Theme'),
                schemeView(darkStaticThemeData),
                divider,
                schemeLabel('Dark HC Theme'),
                schemeView(darkhighcontrastStaticThemeData),
              ],
            ),
          ),
        ],
      );
    } else {
      // Expands in vertical aaxis of child
      // This is wrong, no layout builder and constrainted box
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: LayoutGrid(
              columnSizes: [1.fr, 1.fr,],
              rowSizes: const [auto, auto,],
              rowGap: 5,
              columnGap: 5,
              children: [
                schemeLabel('Light Theme'),
                schemeView(lightStaticThemeData),
                schemeLabel('Light HC Theme'),
                schemeView(lighthighcontrastStaticThemeData),
                schemeLabel('Dark Theme'),
                schemeView(darkStaticThemeData),
                schemeLabel('Dark HC Theme'),
                schemeView(darkhighcontrastStaticThemeData),
              ],
            ),
          ),
        ],
      );

      
    }
  }
}
