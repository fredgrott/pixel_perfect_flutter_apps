// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original was by RydMike under MIT License,
// see source of
// https://github.com/rydmike/flex_color_scheme/blob/master/example/lib/shared/widgets/unive
// and see blog post of
// https://rydmike.com/blog_layout_and_theming

import 'package:flutter/material.dart';

enum WhichContent {
  oneContentBody,
  twoContentBody,
}

// Note: The approach to Feed and Summary Detail type layouts is slightly different where
//       List model is from outside and we supply listModel global in one and listModel[index]
//       in another to get the two distinct differnt pages for the two screens in foldables.
//       In non foldables could probably still assume both contal panels assumed as that seems
//       to be the assumption of the flutter adaptive package.

/// This class is specifically engineered to be use with the Flutter Adaptive Scaffold package.
/// Since the flutter adaptice scaffold package uses BoxConstraints.ttight and other things
/// in the the body and SecondBody slots I have to use a hack way to figure out how
/// much screen is left to assign to content body width.
///
///
///
/// @author Fredrick Allan Grott
class ResponsiveCenteredBody extends StatelessWidget {
  /// Optional scroll controller for the constrained page body.
  ///
  /// If you use a scrolling view as child to the page body, that needs a
  /// scroll controller, we need to use the same controller here too.
  ///
  /// If null, a default controller is used.
  final ScrollController? controller;

  // Support foldables.
  final double bodyRatio;

  /// Padding around the page body.
  ///
  /// Defaults to EdgeInsets.zero
  final EdgeInsetsGeometry padding;

  /// Child to be wrapped in the centered width constrained body, with an
  /// un-focus tap handler, the way an app should behave.
  final Widget child;

  final WhichContent whichContent;

  final bool isTwoContentBodies;

  const ResponsiveCenteredBody({
    super.key,
    this.controller,
    required this.bodyRatio,
    this.padding = EdgeInsets.zero,
    required this.child,
    required this.whichContent,
    required this.isTwoContentBodies,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    late double trueContentWidth;

    if (isTwoContentBodies) {
      if (whichContent == WhichContent.oneContentBody) {
        trueContentWidth = width / bodyRatio;
      }
      if (whichContent == WhichContent.twoContentBody) {
        trueContentWidth = width / (1.0 - bodyRatio);
      }
    } else {
      trueContentWidth = width / bodyRatio;
    }

    return Scrollbar(
      controller: controller,
      child: GestureDetector(
        // This allows us to un-focus a widget, typically a TextField with focus
        // by tapping somewhere outside it. It is no longer needed on desktop
        // builds, it is done automatically there, but not on tablet and phone
        // app. In this demo we want it on them too.
        onTap: () => FocusScope.of(context).unfocus(),

        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: trueContentWidth,
            ),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
