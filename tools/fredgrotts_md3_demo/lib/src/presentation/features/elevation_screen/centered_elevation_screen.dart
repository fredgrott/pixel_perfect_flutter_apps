// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/elevation_screen/elevation_grid.dart';
import 'package:fredgrotts_md3_demo/src/presentation/widgets/responsive_centered_body.dart';



class CenteredElevationScreen extends StatelessWidget {
  final ScrollController myScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Theme.of(context).colorScheme.shadow;
    Color surfaceTint = Theme.of(context).colorScheme.primary;

    Widget title = Text(
      "Elevation",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
            duration: 1200.ms, color: Theme.of(context).colorScheme.secondary)
        .animate() // this wraps the previous Animate in another Animate
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
        .slide();

    List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 0),
        child: Text(
          'Surface Tint only',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ElevationGrid(surfaceTintColor: surfaceTint),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
        child: Text(
          'Surface Tint and Shadow',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ElevationGrid(
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTint,
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
        child: Text(
          'Shadow only',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ElevationGrid(shadowColor: shadowColor),

    ];

    widgetList = widgetList
    .animate(interval: 600.ms)
    .saturate(
          duration: 900.ms,
          delay: 300.ms,
        );

    

    return ResponsiveCenteredBody(
      controller: myScrollController,
      bodyRatio: 1.0,
      whichContent: WhichContent.oneContentBody,
      isTwoContentBodies: false,
      bodyOrientation: Axis.horizontal,
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
