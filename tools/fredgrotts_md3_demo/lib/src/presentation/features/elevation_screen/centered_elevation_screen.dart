// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/elevation_screen/elevation_gird.dart';
import 'package:fredgrotts_md3_demo/src/presentation/widgets/centered_page_body.dart';

class CenteredElevationScreen extends StatelessWidget {
  final ScrollController myScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Theme.of(context).colorScheme.shadow;
    Color surfaceTint = Theme.of(context).colorScheme.primary;

    final List<Widget> widgetList = [
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

    return CenteredPageBody(
      controller: myScrollController,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width / 2,
      ),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: widgetList.length,
          controller: myScrollController,
          itemBuilder: (BuildContext context, int index) {
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
