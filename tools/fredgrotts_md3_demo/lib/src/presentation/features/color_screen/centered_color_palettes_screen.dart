// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/app_break_points.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/color_scheme_view.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/static_theme_datas.dart';
import 'package:fredgrotts_md3_demo/src/presentation/widgets/responsive_centered_body.dart';



class CenteredColorPalettesScreen extends StatelessWidget {
  final ScrollController myScrollController = ScrollController();

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
    Widget title = Text(
      "Color Palettes",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
            duration: 1200.ms, color: Theme.of(context).colorScheme.secondary,)
        .animate() // This wraps the previous Animate in another Animate.
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad,)
        .slide();

    

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

    List<Widget> widgetListOne = [
      divider,
      schemeLabel('Light Theme'),
      schemeView(lightStaticThemeData),
      divider,
      schemeLabel('Light HC Theme'),
      schemeView(lighthighcontrastStaticThemeData),
      divider,
      divider,
      schemeLabel('Dark Theme'),
      schemeView(darkStaticThemeData),
      divider,
      schemeLabel('Dark HC Theme'),
      schemeView(darkhighcontrastStaticThemeData),
    ];

    widgetListOne = widgetListOne
        .animate(interval: 600.ms)
        .saturate(
          duration: 900.ms,
          delay: 300.ms,
        );

    if (SmallBreakpoint().isActive(context) ||
        MediumBreakpoint().isActive(context)) {
      return ResponsiveCenteredBody(
        controller: myScrollController,
        bodyRatio: 1.0,
        whichContent: WhichContent.oneContentBody,
        isTwoContentBodies: false,
        bodyOrientation: Axis.horizontal,
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
        child: SingleChildScrollView(
          controller: myScrollController,
          child: Column(
            children: [
              title,
              ...widgetListOne,
            ],
                
          ),
        ),
      );
    } else {
      return ResponsiveCenteredBody(
        controller: myScrollController,
        bodyRatio: 1.0,
        whichContent: WhichContent.oneContentBody,
        isTwoContentBodies: false,
        bodyOrientation: Axis.horizontal,
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
        child: SingleChildScrollView(
          controller: myScrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                  child: Column(
                    children: [
                      title,
                    ],
                  ),
                ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                  child: Column(
                    children: [
                      schemeLabel('Light Theme'),
                      schemeView(lightStaticThemeData),
                    ]
                        .animate(interval: 600.ms)
                        .saturate(
                              duration: 900.ms,
                              delay: 300.ms,
                            ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      schemeLabel('Light HC Theme'),
                      schemeView(lighthighcontrastStaticThemeData),
                    ]
                        .animate(interval: 600.ms)
                        .saturate(
                              duration: 900.ms,
                              delay: 300.ms,
                            ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      schemeLabel('Dark Theme'),
                      schemeView(darkStaticThemeData),
                    ]
                        .animate(interval: 600.ms)
                        .saturate(
                              duration: 900.ms,
                              delay: 300.ms,
                            ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      schemeLabel('Dark HC Theme'),
                      schemeView(darkhighcontrastStaticThemeData),
                    ]
                        .animate(interval: 600.ms)
                        .saturate(
                              duration: 900.ms,
                              delay: 300.ms,
                            ),
                  ),
                ),
                  ],
                ),
              ],
            ),
            
          ),
        ),
      );
    }
  }
}
