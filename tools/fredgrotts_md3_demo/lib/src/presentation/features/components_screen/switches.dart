// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';

class Switches extends StatelessWidget {
  const Switches({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        SwitchRow(isEnabled: true),
        SwitchRow(isEnabled: false),
      ],
    );
  }
}

class SwitchRow extends StatefulWidget {
  const SwitchRow({
    super.key,
    required this.isEnabled,
  });

  final bool isEnabled;

  @override
  State<SwitchRow> createState() => _SwitchRowState();
}

class _SwitchRowState extends State<SwitchRow> {
  bool value0 = false;
  bool value1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }

    return const Icon(Icons.close);
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Switch.adaptive(
          value: value0,
          onChanged: widget.isEnabled
              ? (value) {
                  setState(() {
                    value0 = value;
                  });
                }
              : null,
        ),
        Switch.adaptive(
          thumbIcon: thumbIcon,
          value: value1,
          onChanged: widget.isEnabled
              ? (value) {
                  setState(() {
                    value1 = value;
                  });
                }
              : null,
        ),
      ],
    );
  }
}
