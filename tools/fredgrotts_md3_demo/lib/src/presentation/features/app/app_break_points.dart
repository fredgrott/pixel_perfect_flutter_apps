// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

const double smallEnd = 600;
const double mediumEnd = 840;
const double largeEnd = 1040;

class SmallBreakpoint extends Breakpoint {
  @override
  bool isActive(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width <= 600) {
      return true;
    } else {
      return false;
    }
  }
}

class MediumBreakpoint extends Breakpoint {
  @override
  bool isActive(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width > 600 && width < 840) {
      return true;
    } else {
      return false;
    }
  }
}

class LargeBreakpoint extends Breakpoint {
  @override
  bool isActive(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width > 840) {
      return true;
    } else {
      return false;
    }
  }
}
