// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/presentation/themes/static_theme_datas.dart';

class ThemeStore extends InheritedWidget {
  final ValueNotifier<ThemeData> theme = ValueNotifier(lightStaticThemeData);

  ThemeStore({required super.child});

  static ThemeStore? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeStore>();

  void updateTheme(ThemeData theme) => this.theme.value = theme;

  @override
  bool updateShouldNotify(ThemeStore oldWidget) =>
      oldWidget.theme != theme;
}
