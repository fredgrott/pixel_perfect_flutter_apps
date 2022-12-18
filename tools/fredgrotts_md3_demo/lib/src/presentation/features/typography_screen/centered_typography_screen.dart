// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/typography_screen/text_style_example.dart';
import 'package:fredgrotts_md3_demo/src/presentation/widgets/centered_page_body.dart';

class CenteredTypographyScreen extends StatelessWidget {
  final ScrollController myScrollController = ScrollController();

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
      TextStyleExample(name: 'Title Large', style: textTheme.titleLarge!),
      TextStyleExample(name: 'Title Medium', style: textTheme.titleMedium!),
      TextStyleExample(name: 'Title Small', style: textTheme.titleSmall!),
      TextStyleExample(name: 'Label Large', style: textTheme.labelLarge!),
      TextStyleExample(name: 'Label Medium', style: textTheme.labelMedium!),
      TextStyleExample(name: 'Label Small', style: textTheme.labelSmall!),
      TextStyleExample(name: 'Body Large', style: textTheme.bodyLarge!),
      TextStyleExample(name: 'Body Medium', style: textTheme.bodyMedium!),
      TextStyleExample(name: 'Body Small', style: textTheme.bodySmall!),
    ];

    return CenteredPageBody(
      controller: myScrollController,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width / 2,
      ),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
      child: AnimationLimiter(
        child: ListView.builder(
          controller: myScrollController,
          itemCount: widgetList.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: widgetList[index],
                ),
              ),

            );
          },
        ),
      ),
    );
  }
}
