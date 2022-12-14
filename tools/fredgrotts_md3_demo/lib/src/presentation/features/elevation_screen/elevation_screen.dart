// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/elevation_screen/elevation_gird.dart';

class ElevationScreen extends StatelessWidget {
  const ElevationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Theme.of(context).colorScheme.shadow;
    Color surfaceTint = Theme.of(context).colorScheme.primary;

    

    final List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 20,
          right: 16.0,
        ),
        child: Text(
          'Surface Tint only',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ElevationGrid(surfaceTintColor: surfaceTint),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 8.0,
          right: 16.0,
        ),
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
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 8.0,
          right: 16.0,
        ),
        child: Text(
          'Shadow only',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ElevationGrid(shadowColor: shadowColor),
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
