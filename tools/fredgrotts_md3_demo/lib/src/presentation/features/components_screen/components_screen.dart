// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:boxy/boxy.dart';
import 'package:flutter/material.dart';

import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/app_break_points.dart';
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

class ComponentScreen extends StatelessWidget {
  const ComponentScreen({
    super.key,
    required this.showNavBottomBar,
  });

  final bool showNavBottomBar;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: [
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
          // ignore: prefer_if_elements_to_conditional_expressions
          showNavBottomBar
              ? const NavigationBars(
                  selectedIndex: 0,
                  isExampleBar: true,
                )
              : Container(),
        ],
      
    );
    
  }
}
