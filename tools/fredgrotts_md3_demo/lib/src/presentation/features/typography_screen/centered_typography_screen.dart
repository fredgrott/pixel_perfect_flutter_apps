// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/typography_screen/text_style_example.dart';
import 'package:fredgrotts_md3_demo/src/presentation/widgets/responsive_centered_body.dart';



class CenteredTypographyScreen extends StatelessWidget {
  final ScrollController myScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget title = Text(
      "Typography",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
            duration: 1200.ms, color: Theme.of(context).colorScheme.secondary,)
        .animate()// This wraps the previous Animate in another Animate.
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad,)
        .slide();

    List<Widget> widgetList = [
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

    widgetList = widgetList
    .animate(interval: 600.ms)
    .saturate(
          duration: 900.ms,
          delay: 300.ms,
        );

    
    return ResponsiveCenteredBody(
      controller: myScrollController,
      whichContent: WhichContent.oneContentBody,
      isTwoContentBodies: false,
      bodyRatio: 1.0,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
      child: ListView(
        controller: myScrollController,
        children: [
          title,
          ...widgetList,
          ],
      ),
      
      
    );
  }
}
