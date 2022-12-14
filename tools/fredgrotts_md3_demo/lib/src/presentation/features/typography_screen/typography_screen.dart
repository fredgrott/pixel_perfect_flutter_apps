// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/typography_screen/text_style_example.dart';

class TypographyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<Widget> widgetList = [
      const SizedBox(height: 7),
      TextStyleExample(
        name: 'Display Large',
        style: textTheme.displayLarge!,
      ),
      TextStyleExample(
        name: 'Display Medium',
        style: textTheme.displayMedium!,
      ),
      TextStyleExample(
        name: 'Display Small',
        style: textTheme.displaySmall!,
      ),
      TextStyleExample(
        name: 'Headline Large',
        style: textTheme.headlineLarge!,
      ),
      TextStyleExample(
        name: 'Headline Medium',
        style: textTheme.headlineMedium!,
      ),
      TextStyleExample(
        name: 'Headline Small',
        style: textTheme.headlineSmall!,
      ),
      TextStyleExample(name: 'Title Large', style: textTheme.titleLarge!,),
      TextStyleExample(name: 'Title Medium', style: textTheme.titleMedium!,),
      TextStyleExample(name: 'Title Small', style: textTheme.titleSmall!,),
      TextStyleExample(name: 'Label Large', style: textTheme.labelLarge!,),
      TextStyleExample(name: 'Label Medium', style: textTheme.labelMedium!,),
      TextStyleExample(name: 'Label Small', style: textTheme.labelSmall!,),
      TextStyleExample(name: 'Body Large', style: textTheme.bodyLarge!,),
      TextStyleExample(name: 'Body Medium', style: textTheme.bodyMedium!,),
      TextStyleExample(name: 'Body Small', style: textTheme.bodySmall!,),
    ];

    return AnimationLimiter(
      child: ListView.builder(
        itemCount: widgetList.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              child: FadeInAnimation(
                child: widgetList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
