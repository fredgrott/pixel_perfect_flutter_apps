// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally the MD3Demo code from the Flutter Samples 
// experimental folder authored by the Flutter SDK team
// under BSD clause 3 license. Modifications by Fredrick
// Grott changed to the adaptive constructors for 
// crossplatform functionality which pertains to such 
// widgets as CircleProgressIndicator.

import 'package:flutter/material.dart';

const Widget divider = SizedBox(height: 10);

const rowDivider = SizedBox(width: 10);
const colDivider = SizedBox(height: 10);
const double cardWidth = 115;
// To match the max smallMobile.
const double maxWidthConstraint = 600;
