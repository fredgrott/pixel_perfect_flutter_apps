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

import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/buttons.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/cards.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/checkboxes.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/chips.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/dialogs.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/floating_action_buttons.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/icon_toggle_buttons.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/navigation_stuff.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/progress_indicators.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/radios.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/switches.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/text_fields.dart';
import 'package:fredgrotts_md3_demo/src/presentation/widgets/responsive_centered_body.dart';



class CenteredComponentsScreen extends StatelessWidget {
  final bool showNavBottomBar;
  CenteredComponentsScreen({
    super.key,
    required this.showNavBottomBar,
  });

  final ScrollController myScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      "Components",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1200.ms, color: Theme.of(context).colorScheme.secondary,)
        .animate() // This wraps the previous Animate in another Animate.
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad,)
        .slide();

    List<Widget> widgetList = [
      colDivider,
      colDivider,
      const Buttons(),
      colDivider,
      colDivider,
      const IconToggleButtons(),
      colDivider,
      const FloatingActionButtons(),
      colDivider,
      const Chips(),
      colDivider,
      const Cards(),
      colDivider,
      const TextFields(),
      colDivider,
      const Dialogs(),
      colDivider,
      const Switches(),
      colDivider,
      const Checkboxes(),
      colDivider,
      const Radios(),
      colDivider,
      const ProgressIndicators(),
      colDivider,
      //
      // ignore: prefer_if_elements_to_conditional_expressions
      showNavBottomBar
          ? const NavigationBars(
              selectedIndex: 0,
              isExampleBar: true,
            )
          : Container(),
      // With scroll controller, flutter animate shortcut wise
      // put animate effects at end of list via cascades either
      // here or in ListView itself
    ];

    widgetList = widgetList
        .animate(interval: 600.ms)
        .saturate(duration: 900.ms, delay: 300.ms,);

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
