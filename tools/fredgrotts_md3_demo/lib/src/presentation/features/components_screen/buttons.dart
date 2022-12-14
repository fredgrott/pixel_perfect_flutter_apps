// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/buttons_with_icon.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/buttons_without_icon.dart';


class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: <Widget>[
        const ButtonsWithoutIcon(isDisabled: false),
        rowDivider,
        ButtonsWithIcon(),
        rowDivider,
        const ButtonsWithoutIcon(isDisabled: true),
      ],
    );
  }
}
