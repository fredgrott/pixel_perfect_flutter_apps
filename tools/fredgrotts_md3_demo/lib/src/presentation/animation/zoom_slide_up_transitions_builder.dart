// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class ZoomSlideUpTransitionsBuilder extends PageTransitionsBuilder {
  const ZoomSlideUpTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _ZoomSlideUpTransitionsBuilder(
        routeAnimation: animation, child: child,);
  }
}

class _ZoomSlideUpTransitionsBuilder extends StatelessWidget {
  _ZoomSlideUpTransitionsBuilder({
    
    required Animation<double> routeAnimation,
    required this.child,
  })  : _scaleAnimation = CurvedAnimation(
          parent: routeAnimation,
          curve: Curves.bounceIn,
        ).drive(_scaleTween),
        _slideAnimation = CurvedAnimation(
          parent: routeAnimation,
          curve: Curves.bounceIn,
        ).drive(_kBottomUpTween);

  final Animation<Offset> _slideAnimation;
  final Animation<double> _scaleAnimation;

  static final Animatable<double> _scaleTween =
      Tween<double>(begin: 0.0, end: 1,);
  static final Animatable<Offset> _kBottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 1.0,),
    end: const Offset(0.0, 0.0,),
  );

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: child,
      ),
    );
  }
}
