// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/narrow_screen_width.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/elevation_screen/elevation_card.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/elevation_screen/elevation_info.dart';

class ElevationGrid extends StatelessWidget {
  const ElevationGrid({
    super.key,
    this.shadowColor,
    this.surfaceTintColor,
  });

  final Color? shadowColor;
  final Color? surfaceTintColor;

  List<ElevationCard> elevationCards(
    Color? shadowColor,
    Color? surfaceTintColor,
  ) {
    return elevations
        .map(
          (elevationInfo) => ElevationCard(
            info: elevationInfo,
            shadowColor: shadowColor,
            surfaceTint: surfaceTintColor,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          if (constraints.maxWidth < narrowScreenWidthThreshold) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: elevationCards(shadowColor, surfaceTintColor,),
            );
          } else {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 6,
              children: elevationCards(
                shadowColor,
                surfaceTintColor,
              ),
            );
          }
        },
      ),
    );
  }
}
