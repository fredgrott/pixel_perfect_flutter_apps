// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/app/app_break_points.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/color_scheme_view.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/static_theme_datas.dart';

class ColorPalettesScreen extends StatelessWidget {
  const ColorPalettesScreen({super.key});

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

    return Expanded(
      child: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          if (SmallBreakpoint().isActive(context) || MediumBreakpoint().isActive(context)) {
            return SingleChildScrollView(
              child: AnimationLimiter(
                child: 
                    
                    Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset:
                              MediaQuery.of(context).size.width / 2,
                          child: FadeInAnimation(child: widget),
                        ),
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
                  
                
                
                
                
              ),
            );
          } else {
            return SingleChildScrollView(
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
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 2,
                              child: FadeInAnimation(child: widget),
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
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 2,
                              child: FadeInAnimation(child: widget),
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
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 2,
                              child: FadeInAnimation(child: widget),
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
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 2,
                              child: FadeInAnimation(child: widget),
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
            );
          }
        },
      ),
    );
  }
}
