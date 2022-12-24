// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.title = "FG",
    
    this.titleStyle,
    this.fontSize = 60,
  });

  final String title;
  final TextStyle? titleStyle;
  
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Text(
      title,
      style: titleStyle ??
          textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontSize: fontSize,
          ),
    );
  }
}
