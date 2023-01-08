// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original under BSD coopyright 2020, Flutter project authros.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:mdthree_breakpoints/internal/adaptive_column.dart';
import 'package:mdthree_breakpoints/internal/adaptive_container.dart';

class AdaptiveColumnsExample extends StatelessWidget {
  const AdaptiveColumnsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AdaptiveColumn(
          children: [
            AdaptiveContainer(
              constraints: const AdaptiveConstraints.xsmall(),
              columnSpan: 2,
              color: Colors.red,
              child: const Text('This is an extra small window'),
            ),
            AdaptiveContainer(
              constraints: const AdaptiveConstraints.small(),
              columnSpan: 2,
              color: Colors.orange,
              child: const Text('This is a small window'),
            ),
            AdaptiveContainer(
              constraints: const AdaptiveConstraints.medium(),
              columnSpan: 2,
              color: Colors.yellow,
              child: const Text('This is a medium window'),
            ),
            AdaptiveContainer(
              constraints: const AdaptiveConstraints.large(),
              columnSpan: 2,
              color: Colors.green,
              child: const Text('This is a large window'),
            ),
            AdaptiveContainer(
              constraints: const AdaptiveConstraints.xlarge(),
              columnSpan: 2,
              color: Colors.blue,
              child: const Text('This is an extra large window'),
            ),
            AdaptiveContainer(
              constraints: const AdaptiveConstraints.xsmall(
                xsmall: true,
                small: true,
              ),
              columnSpan: 2,
              color: Colors.indigo,
              child: const Text('This is a small or extra small window'),
            ),
            AdaptiveContainer(
              constraints: const AdaptiveConstraints.medium(
                medium: true,
                large: true,
                xlarge: true,
              ),
              columnSpan: 2,
              color: Colors.pink,
              child:
                  const Text('This is a medium, large, or extra large window'),
            ),
            AdaptiveContainer(
              columnSpan: 12,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 6,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 6,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 4,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 4,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 4,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 2,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 2,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 2,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 2,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 2,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
            AdaptiveContainer(
              columnSpan: 2,
              color: Colors.black,
              child: const Text('This is for every screen size'),
            ),
          ],
        ),
    
    );
  }
}
