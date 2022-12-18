// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';

import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/button_styles.dart';

class IconToggleButtons extends StatefulWidget {
  const IconToggleButtons({super.key});

  @override
  State<IconToggleButtons> createState() => _IconToggleButtonsState();
}

class _IconToggleButtonsState extends State<IconToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Standard IconButton.
            children: const <Widget>[
              IconToggleButton(isEnabled: true),
              colDivider,
              IconToggleButton(isEnabled: false),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              // Filled IconButton.
              IconToggleButton(
                isEnabled: true,
                getDefaultStyle: enabledFilledButtonStyle,
              ),
              colDivider,
              IconToggleButton(
                isEnabled: false,
                getDefaultStyle: disabledFilledButtonStyle,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              // Filled Tonal IconButton.
              IconToggleButton(
                isEnabled: true,
                getDefaultStyle: enabledFilledTonalButtonStyle,
              ),
              colDivider,
              IconToggleButton(
                isEnabled: false,
                getDefaultStyle: disabledFilledTonalButtonStyle,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              // Outlined IconButton.
              IconToggleButton(
                isEnabled: true,
                getDefaultStyle: enabledOutlinedButtonStyle,
              ),
              colDivider,
              IconToggleButton(
                isEnabled: false,
                getDefaultStyle: disabledOutlinedButtonStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconToggleButton extends StatefulWidget {
  const IconToggleButton({
    required this.isEnabled,
    this.getDefaultStyle,
    super.key,
  });

  final bool isEnabled;
  final ButtonStyle? Function(
    bool,
    ColorScheme,
  )? getDefaultStyle;

  @override
  State<IconToggleButton> createState() => _IconToggleButtonState();
}

class _IconToggleButtonState extends State<IconToggleButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final VoidCallback? onPressed = widget.isEnabled
        ? () {
            setState(() {
              selected = !selected;
            });
          }
        : null;
    final ButtonStyle? style = widget.getDefaultStyle?.call(
      selected,
      colors,
    );

    return IconButton(
      visualDensity: VisualDensity.standard,
      isSelected: selected,
      icon: const Icon(Icons.settings_outlined),
      selectedIcon: const Icon(Icons.settings),
      onPressed: onPressed,
      style: style,
    );
  }
}
