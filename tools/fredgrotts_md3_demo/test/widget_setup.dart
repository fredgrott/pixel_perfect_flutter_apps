// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void widgetSetup(WidgetTester tester, double windowWidth,
    {double? windowHeight,}) {
  final height = windowHeight ?? 846;
  tester.binding.window.devicePixelRatioTestValue = 2;
  final dpi = tester.binding.window.devicePixelRatio;
  tester.binding.window.physicalSizeTestValue =
      Size(windowWidth * dpi, height * dpi);
}
