// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo






import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/buttons.dart';

class ButtonsWithoutIcon extends StatefulWidget {
  final bool isDisabled;

  const ButtonsWithoutIcon({super.key, required this.isDisabled,});

  @override
  State<ButtonsWithoutIcon> createState() => _ButtonsWithoutIconState();
}

class _ButtonsWithoutIconState extends State<ButtonsWithoutIcon> {
  @override
  Widget build(BuildContext context) {
    

    if (widget.isDisabled) {
      return IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              //
              // ignore: no-empty-block
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            colDivider,
            FilledButton(
              //
              // ignore: no-empty-block
              onPressed: () {},
              child: const Text('Filled'),
            ),
            colDivider,
            FilledButton.tonal(
              //
              // ignore: no-empty-block
              onPressed: () {},
              child: const Text('Filled Tonal'),
            ),
            colDivider,
            OutlinedButton(
              //
              // ignore: no-empty-block
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            colDivider,
            TextButton(
              //
              // ignore: no-empty-block
              onPressed: () {},
              child: const Text('Text'),
            ),
          ],
        ),
      );
    } else {
      return IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: handlePressed(context, widget.isDisabled, 'ElevatedButton',),
              child: const Text('Elevated'),
            ),
            colDivider,
            FilledButton(
              onPressed: handlePressed(context, widget.isDisabled, 'FilledButton',),
              child: const Text('Filled'),
            ),
            colDivider,
            FilledButton.tonal(
              onPressed: handlePressed(context, widget.isDisabled, 'Filled Tonal Button',),
              child: const Text('Filled Tonal'),
            ),
            colDivider,
            OutlinedButton(
              onPressed: handlePressed(context, widget.isDisabled, 'Outlined Button',),
              child: const Text('Outlined'),
            ),
            colDivider,
            TextButton(
              onPressed: handlePressed(context, widget.isDisabled, 'Text Button',),
              child: const Text('Text'),
            ),
          ],
        ),
      );
    }
  }
}
