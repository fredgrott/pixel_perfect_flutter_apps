// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/my_app.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/centered_color_palettes_screen.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/color_screen/color_group.dart';

import 'widget_setup.dart';

void main() {
  testWidgets(
      'Color palettes screen shows correctly when color icon is clicked '
      'on NavigationBar', (tester) async {
    widgetSetup(tester, 449);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(MyApp());

    expect(find.text('Light Theme'), findsNothing);
    expect(find.text('Dark Theme'), findsNothing);
    expect(find.byType(NavigationBar), findsOneWidget);
    final Finder colorIconOnBar = find.byIcon(Icons.format_paint_outlined);
    expect(colorIconOnBar, findsOneWidget);
    await tester.tap(colorIconOnBar);
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    expect(colorIconOnBar, findsNothing);
    expect(find.byIcon(Icons.format_paint), findsOneWidget);
    expect(find.text('Light Theme'), findsOneWidget);
    expect(find.text('Dark Theme'), findsOneWidget);
  });

  testWidgets(
      'Color palettes screen shows correctly when color icon is clicked '
      'on NavigationRail', (tester) async {
    widgetSetup(tester, 450); // NavigationRail shows only when width is >= 450.
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(MyApp());
    expect(find.text('Light Theme'), findsNothing);
    expect(find.text('Dark Theme'), findsNothing);
    expect(find.byType(NavigationRail), findsOneWidget);
    final Finder colorIconOnRail = find.byIcon(Icons.format_paint_outlined);
    expect(colorIconOnRail, findsOneWidget);
    await tester.tap(colorIconOnRail);
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    expect(colorIconOnRail, findsNothing);
    expect(find.byIcon(Icons.format_paint), findsOneWidget);
    expect(find.text('Light Theme'), findsOneWidget);
    expect(find.text('Dark Theme'), findsOneWidget);
  });

  testWidgets('Color screen shows correct content', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: Row(children: [CenteredColorPalettesScreen()])),
    ),);
    expect(find.text('Light Theme'), findsOneWidget);
    expect(find.text('Dark Theme'), findsOneWidget);
    expect(find.byType(ColorGroup, skipOffstage: false), findsNWidgets(14));
  });
}
