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

class ButtonsWithIcon extends StatefulWidget {
  @override
  State<ButtonsWithIcon> createState() => _ButtonsWithIconState();
}

class _ButtonsWithIconState extends State<ButtonsWithIcon> {
  @override
  Widget build(BuildContext context) {
    


    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: handlePressed(context, false, 'ElevatedButton',),
            icon: const Icon(Icons.add),
            label: const Text('Icon'),
          ),
          colDivider,
          FilledButton.icon(
            onPressed: handlePressed(context, false, 'FilledButton',),
            label: const Text('Icon'),
            icon: const Icon(Icons.add),
          ),
          colDivider,
          FilledButton.tonalIcon(
            onPressed: handlePressed(context, false, 'Filled TonalButton',),
            label: const Text('Icon'),
            icon: const Icon(Icons.add),
          ),
          colDivider,
          OutlinedButton.icon(
            onPressed: handlePressed(context, false, 'Outlined Button',),
            icon: const Icon(Icons.add),
            label: const Text('Icon'),
          ),
          colDivider,
          TextButton.icon(
            onPressed: handlePressed(context, false, 'Text Button',),
            icon: const Icon(Icons.add),
            label: const Text('Icon'),
          ),
        ],
      ),
    );
  }


}
