// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original under BSD coopyright 2020, Flutter project authros.

import 'package:flutter/material.dart';
import 'package:mdthree_breakpoints/app/adaptive_columns_example.dart';
import 'package:mdthree_breakpoints/app/adaptive_container_example.dart';

class DemoSelector extends StatelessWidget {
  const DemoSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Adaptive Column'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const AdaptiveColumnsExample();
                    },
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Adaptive Container'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const AdaptiveContainerExample();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
