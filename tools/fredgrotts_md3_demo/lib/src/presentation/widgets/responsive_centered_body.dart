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
//
//       Core architect concept is that the body and secondBody slots in the adaptive alyout
//       class use BoxConstraints use the Size construct so if I set the max in BoxConstraints
//       my child widget will adjust downward in size bsed upon the parent BoxConstraint Size consgtruct settings.

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

  final Axis bodyOrientation;

  const ResponsiveCenteredBody({
    super.key,
    this.controller,
    required this.bodyRatio,
    this.padding = EdgeInsets.zero,
    required this.child,
    required this.whichContent,
    required this.isTwoContentBodies,
    required this.bodyOrientation,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    late double trueContentWidth;
    late double trueContentHeight;

    if (bodyOrientation == Axis.horizontal) {
      if (isTwoContentBodies) {
        if (whichContent == WhichContent.oneContentBody) {
          trueContentWidth = width / bodyRatio;
          trueContentHeight = height;
        }
        if (whichContent == WhichContent.twoContentBody) {
          trueContentWidth = width / (1.0 - bodyRatio);
          trueContentHeight = height;
        }
      } else {
        trueContentWidth = width / bodyRatio;
        trueContentHeight = height;
      }
    } else {
      // Compute max height for vertical body content.
      if (isTwoContentBodies) {
        if (whichContent == WhichContent.oneContentBody) {
          trueContentHeight = height / bodyRatio;
          trueContentWidth = width;
        }
        if (whichContent == WhichContent.twoContentBody) {
          trueContentHeight = height / (1.0 - bodyRatio);
          trueContentWidth = width;
        }
      } else {
        trueContentHeight = height / bodyRatio;
        trueContentWidth = width;
      }
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
              maxHeight: trueContentHeight,
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
