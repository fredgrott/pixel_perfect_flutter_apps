// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// See source,
// https://github.com/rydmike/flex_seed_scheme/blob/master/lib/src/flex_tones.dart

FlexTones appCustomVividFlexTones(Brightness brightness) =>
    brightness == Brightness.light
        ? const FlexTones.light(
            primaryTone: 35,
            surfaceTintTone: 35,
            surfaceTone: 96,
            //
            primaryMinChroma: 45,
          )
        : const FlexTones.dark(
            onPrimaryTone: 15,
            primaryContainerTone: 25,
            backgroundTone: 10,
            //
            primaryMinChroma: 45,
          );

FlexTones appCustomHighContrastFlexTones(Brightness brightness) =>
    brightness == Brightness.light
        ? const FlexTones.light(
          primaryTone: 35,
          tertiaryTone: 35,
          primaryContainerTone: 98,
          secondaryContainerTone: 98,
          tertiaryContainerTone: 98,
          errorContainerTone: 98,
          surfaceTintTone: 35,
          //
          primaryMinChroma: 70,
          secondaryMinChroma: 60,
          tertiaryMinChroma: 60,
        )
        : const FlexTones.dark(
          onPrimaryTone: 15,
          onSecondaryTone: 15,
          onTertiaryTone: 15,
          onErrorTone: 15,
          primaryContainerTone: 25,
          secondaryContainerTone: 25,
          tertiaryContainerTone: 25,
          errorContainerTone: 25,
          onErrorContainerTone: 95,
          //
          primaryMinChroma: 70,
          secondaryMinChroma: 60,
          tertiaryMinChroma: 60,
        );
