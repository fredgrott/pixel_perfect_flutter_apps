// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/my_app.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/icon_toggle_buttons.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/navigation_stuff.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/components_screen/radios.dart';

import 'widget_setup.dart';

void main() {
  testWidgets('Default main page shows all M3 components', (tester) async {
    widgetSetup(tester, 800, windowHeight: 3500,);
    await tester.pumpWidget(MyApp());

   // Elements on the app bar.
    expect(find.text('Material 3'), findsOneWidget,);
    

    // Elements on the component screen
    // Buttons
    expect(find.widgetWithText(ElevatedButton, 'Elevated',), findsNWidgets(2),);
    expect(find.widgetWithText(FilledButton, 'Filled',), findsNWidgets(2),);
    expect(find.widgetWithText(FilledButton, 'Filled Tonal',), findsNWidgets(2),);
    expect(find.widgetWithText(OutlinedButton, 'Outlined',), findsNWidgets(2),);
    expect(find.widgetWithText(TextButton, 'Text',), findsNWidgets(2),);
    expect(find.text('Icon'), findsNWidgets(5),);

    // IconButtons
    expect(find.byType(IconToggleButton), findsNWidgets(8),);

    // FABs
    expect(find.byType(FloatingActionButton), findsNWidgets(4),);
    expect(find.widgetWithText(FloatingActionButton, 'Create',), findsOneWidget,);

    // Chips.
    expect(find.byType(ActionChip),
        findsNWidgets(7),); // Includes Assist and Suggestion chip.
    expect(find.byType(FilterChip), findsNWidgets(4),);
    expect(find.byType(InputChip), findsNWidgets(4),);

    // Cards.
    expect(find.widgetWithText(Card, 'Filled',), findsOneWidget,);
    expect(find.widgetWithText(Card, 'Filled',), findsOneWidget,);
    expect(find.widgetWithText(Card, 'Outlined',), findsOneWidget,);

    // TextFields.
    expect(find.widgetWithText(TextField, 'Disabled',), findsNWidgets(2),);
    expect(find.widgetWithText(TextField, 'Filled',), findsNWidgets(2),);
    expect(find.widgetWithText(TextField, 'Outlined',), findsNWidgets(2),);

    // Alert Dialog.
    final Finder dialogExample = find.widgetWithText(TextButton, 'Open Dialog',);
    expect(dialogExample, findsOneWidget,);

    // Switches.
    final Finder switchExample = find.byType(Switch);
    expect(switchExample, findsNWidgets(4),);

    // Checkboxes.
    final Finder checkboxExample = find.byType(Checkbox);
    expect(checkboxExample, findsNWidgets(8),);

    // Radios.
    final Finder radioExample = find.byType(Radio<Value>);
    expect(radioExample, findsNWidgets(2),);

    // ProgressIndicator.
    final Finder circularProgressIndicator = find.byType(CircularProgressIndicator);
    expect(circularProgressIndicator, findsOneWidget,);
    final Finder linearProgressIndicator = find.byType(LinearProgressIndicator);
    expect(linearProgressIndicator, findsOneWidget,);
  },);

  testWidgets(
      "NavigationRail doesn't show when width value is small than 450 "
      '(in Portrait mode or narrow screen)', (tester) async {
    widgetSetup(tester, 449,);
    await tester.pumpWidget(MyApp());

    // When screen width is less than 450, NavigationBar will show. At the same
    // time, the NavigationRail and the NavigationBar example will NOT show.
    expect(find.byType(NavigationBars), findsOneWidget,);
    expect(find.widgetWithText(NavigationBar, 'Components',), findsOneWidget,);
    expect(find.widgetWithText(NavigationBar, 'Color',), findsOneWidget,);
    expect(find.widgetWithText(NavigationBar, 'Typography',), findsOneWidget,);
    expect(find.widgetWithText(NavigationBar, 'Elevation',), findsOneWidget,);

    expect(find.byType(NavigationRailSection), findsNothing,);
    expect(find.widgetWithText(NavigationBar, 'Explore',), findsNothing,);
    expect(find.widgetWithText(NavigationBar, 'Pets',), findsNothing,);
    expect(find.widgetWithText(NavigationBar, 'Account',), findsNothing,);
  },);

  testWidgets(
      'NavigationRail shows when width value is greater than or equal '
      'to 450 (in Landscape mode or wider screen)', (tester) async {
    widgetSetup(tester, 450,);
    await tester.pumpWidget(MyApp());

    // When screen width is greater than or equal to 450, NavigationRail and
    // NavigationBar example will show. At the same time, the NavigationBar
    // will NOT show.
    expect(find.byType(NavigationRailSection), findsOneWidget,);
    expect(find.byType(Tooltip, skipOffstage: false,), findsWidgets,);
    expect(find.widgetWithText(NavigationRailSection, 'Components',),
        findsOneWidget,);
    expect(find.widgetWithText(NavigationRailSection, 'Color',), findsOneWidget,);
    expect(find.widgetWithText(NavigationRailSection, 'Typography',),
        findsOneWidget,);
    expect(find.widgetWithText(NavigationRailSection, 'Elevation',),
        findsOneWidget,);

    final navbarExample = find.byType(NavigationBars);
    await tester.scrollUntilVisible(
      scrollable: find.byType(Scrollable).first,
      navbarExample,
      500.0,
    );
    expect(find.byType(NavigationBars), findsOneWidget,);
    expect(find.widgetWithText(NavigationBar, 'Explore',), findsOneWidget,);
    expect(find.widgetWithText(NavigationBar, 'Pets',), findsOneWidget,);
    expect(find.widgetWithText(NavigationBar, 'Account',), findsOneWidget,);

    expect(find.widgetWithText(NavigationBar, 'Components',), findsNothing,);
    expect(find.widgetWithText(NavigationBar, 'Colors',), findsNothing,);
    expect(find.widgetWithText(NavigationBar, 'Typography',), findsNothing,);
    expect(find.widgetWithText(NavigationBar, 'Elevation',), findsNothing,);
  },);

  testWidgets(
      'Material version switches between Material3 and Material2 when '
      'the version icon is clicked', (tester) async {
    widgetSetup(tester, 450, windowHeight: 3000,);
    await tester.pumpWidget(MyApp());
    final Finder m3Icon = find.widgetWithIcon(IconButton, Icons.filter_3,);
    final Finder m2Icon = find.widgetWithIcon(IconButton, Icons.filter_2,);
    final BuildContext defaultElevatedButton =
        tester.firstElement(find.byType(ElevatedButton));
    final BuildContext defaultIconButton =
        tester.firstElement(find.byType(IconButton));
    final BuildContext defaultFAB =
        tester.firstElement(find.byType(FloatingActionButton));
    final BuildContext defaultCard =
        tester.firstElement(find.widgetWithText(Card, 'Elevated',),);
    final BuildContext defaultChip =
        tester.firstElement(find.widgetWithText(ActionChip, 'Assist',));
    final Finder dialog = find.text('Open Dialog');
    await tester.tap(dialog);
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    final BuildContext defaultAlertDialog = tester.element(find.byType(AlertDialog));
    expect(Theme.of(defaultAlertDialog).useMaterial3, true,);
    final Finder dismiss = find.text('Dismiss');
    await tester.tap(dismiss);
    await tester.pumpAndSettle(const Duration(microseconds: 500));

    expect(m3Icon, findsOneWidget,);
    expect(m2Icon, findsNothing,);
    expect(find.text('Material 3'), findsOneWidget,);
    expect(Theme.of(defaultElevatedButton).useMaterial3, true,);
    expect(Theme.of(defaultIconButton).useMaterial3, true,);
    expect(Theme.of(defaultFAB).useMaterial3, true,);
    expect(Theme.of(defaultCard).useMaterial3, true,);
    expect(Theme.of(defaultChip).useMaterial3, true,);

    await tester.tap(m3Icon);
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    final BuildContext updatedElevatedButton =
        tester.firstElement(find.byType(ElevatedButton));
    final BuildContext updatedIconButton =
        tester.firstElement(find.byType(IconButton));
    final BuildContext updatedFAB =
        tester.firstElement(find.byType(FloatingActionButton));
    final BuildContext updatedCard = tester.firstElement(find.byType(Card));
    final BuildContext updatedChip =
        tester.firstElement(find.widgetWithText(ActionChip, 'Assist',));
    final Finder updatedDialog = find.text('Open Dialog');
    await tester.tap(updatedDialog);
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    final BuildContext updatedAlertDialog =
        tester.firstElement(find.byType(AlertDialog));
    expect(Theme.of(updatedAlertDialog).useMaterial3, false,);
    final Finder updatedDismiss = find.text('Dismiss');
    await tester.tap(updatedDismiss);
    await tester.pumpAndSettle(const Duration(microseconds: 500));

    expect(m3Icon, findsNothing,);
    expect(m2Icon, findsOneWidget,);
    expect(find.text('Material 2'), findsOneWidget,);
    expect(Theme.of(updatedElevatedButton).useMaterial3, false,);
    expect(Theme.of(updatedIconButton).useMaterial3, false,);
    expect(Theme.of(updatedFAB).useMaterial3, false,);
    expect(Theme.of(updatedCard).useMaterial3, false,);
    expect(Theme.of(updatedChip).useMaterial3, false,);
  },);

  testWidgets(
      'Other screens become Material2 mode after changing mode from '
      'main screen', (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.widgetWithIcon(IconButton, Icons.filter_3,));
    await tester.tap(find.byIcon(Icons.format_paint_outlined));
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    final BuildContext lightThemeText = tester.element(find.text('Light Theme'));
    expect(Theme.of(lightThemeText).useMaterial3, false,);
    await tester.tap(find.byIcon(Icons.text_snippet_outlined));
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    final BuildContext displayLargeText = tester.element(find.text('Display Large'));
    expect(Theme.of(displayLargeText).useMaterial3, false,);
    await tester.tap(find.byIcon(Icons.invert_colors_on_outlined));
    await tester.pumpAndSettle(const Duration(microseconds: 500));
    final BuildContext material = tester.firstElement(find.byType(Material));
    expect(Theme.of(material).useMaterial3, false,);
  },);

  testWidgets(
      'Brightness mode switches between dark and light when '
      'the brightness icon is clicked', (tester) async {
    await tester.pumpWidget(MyApp());
    
    final BuildContext appBar = tester.element(find.byType(AppBar));
    final BuildContext body = tester.element(find.byType(Scaffold));
    final BuildContext navigationRail = tester.element(find.byType(NavigationRail));
    
    expect(Theme.of(appBar).brightness, Brightness.light,);
    expect(Theme.of(body).brightness, Brightness.light,);
    expect(Theme.of(navigationRail).brightness, Brightness.light,);
    
    await tester.pumpAndSettle(const Duration(microseconds: 500));

    final BuildContext appBar2 = tester.element(find.byType(AppBar));
    final BuildContext body2 = tester.element(find.byType(Scaffold));
    final BuildContext navigationRail2 = tester.element(find.byType(NavigationRail));
    
    expect(Theme.of(appBar2).brightness, Brightness.dark,);
    expect(Theme.of(body2).brightness, Brightness.dark,);
    expect(Theme.of(navigationRail2).brightness, Brightness.dark,);
  },);

  testWidgets('Color theme changes when a color is selected from menu',
      (tester) async {
    await tester.pumpWidget(MyApp(),);
    

    

    final BuildContext appBar2 = tester.element(find.byType(AppBar));
    final BuildContext body2 = tester.element(find.byType(Scaffold));
    final BuildContext navigationRail2 = tester.element(find.byType(NavigationRail));
    final ThemeData expectedTheme = ThemeData(colorSchemeSeed: Colors.blue);
    expect(Theme.of(appBar2).primaryColor, expectedTheme.primaryColor,);
    expect(Theme.of(body2).primaryColor, expectedTheme.primaryColor,);
    expect(Theme.of(navigationRail2).primaryColor, expectedTheme.primaryColor,);
  },);
}
