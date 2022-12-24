// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/my_app.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/typography_screen/centered_typography_screen.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/typography_screen/text_style_example.dart';

import 'widget_setup.dart';

void main() {
  testWidgets(
      'Typography screen shows correctly when the corresponding icon is '
      'selected on NavigationBar', (tester) async {
    widgetSetup(tester, 449,);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(MyApp());

    expect(find.text('Display Large'), findsNothing,);
    expect(find.byType(NavigationBar), findsOneWidget,);
    final Finder textIconOnBar = find.byIcon(Icons.text_snippet_outlined);
    expect(textIconOnBar, findsOneWidget,);
    await tester.tap(textIconOnBar,);
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    expect(textIconOnBar, findsNothing,);
    expect(find.byIcon(Icons.text_snippet), findsOneWidget,);
    expect(find.text('Display Large'), findsOneWidget,);
  },);

  testWidgets(
      'Typography screen shows correctly when the corresponding icon is '
      'selected on NavigationRail', (tester) async {
    widgetSetup(tester, 450,); // NavigationRail shows only when width is >= 450.
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(MyApp());
    expect(find.text('Display Large'), findsNothing,);
    expect(find.byType(NavigationRail), findsOneWidget,);
    final Finder textIconOnRail = find.byIcon(Icons.text_snippet_outlined);
    expect(textIconOnRail, findsOneWidget,);
    await tester.tap(textIconOnRail);
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    expect(textIconOnRail, findsNothing,);
    expect(find.byIcon(Icons.text_snippet), findsOneWidget,);
    expect(find.text('Display Large'), findsOneWidget,);
  },);

  testWidgets('Typography screen shows correct content', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: Row(children: [CenteredTypographyScreen()])),
    ),);
    expect(find.text('Display Large'), findsOneWidget,);
    expect(find.text('Display Medium'), findsOneWidget,);
    expect(find.text('Display Small'), findsOneWidget,);
    expect(find.text('Headline Large'), findsOneWidget);
    expect(find.text('Headline Medium'), findsOneWidget,);
    expect(find.text('Headline Small'), findsOneWidget,);
    expect(find.text('Title Large'), findsOneWidget,);
    expect(find.text('Title Medium'), findsOneWidget,);
    expect(find.text('Title Small'), findsOneWidget,);
    await tester.scrollUntilVisible(
      find.text('Body Small'),
      500.0,
    );
    expect(find.text('Label Large'), findsOneWidget,);
    expect(find.text('Label Medium'), findsOneWidget,);
    expect(find.text('Label Small'), findsOneWidget,);
    expect(find.text('Body Large'), findsOneWidget,);
    expect(find.text('Body Medium'), findsOneWidget,);
    expect(find.text('Body Small'), findsOneWidget,);

    expect(find.byType(TextStyleExample), findsNWidgets(15));
  },);
}
