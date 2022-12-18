// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/app_break_points.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/color_scheme_view.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/static_theme_datas.dart';
import 'package:fredgrotts_md3_demo/src/presentation/widgets/centered_page_body.dart';

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

    if (SmallBreakpoint().isActive(context) ||
        MediumBreakpoint().isActive(context)) {
      return CenteredPageBody(
        controller: myScrollController,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width / 2,
        ),
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
        child: SingleChildScrollView(
          controller: myScrollController,
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
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
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return CenteredPageBody(
        controller: myScrollController,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width / 2,
        ),
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
        child: SingleChildScrollView(
          controller: myScrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Expanded(
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          schemeLabel('Light Theme'),
                          schemeView(lightStaticThemeData),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          schemeLabel('Light HC Theme'),
                          schemeView(lighthighcontrastStaticThemeData),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          schemeLabel('Dark Theme'),
                          schemeView(darkStaticThemeData),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          schemeLabel('Dark HC Theme'),
                          schemeView(darkhighcontrastStaticThemeData),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
