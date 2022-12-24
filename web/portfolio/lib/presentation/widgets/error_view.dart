// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.error, {super.key});
  final Exception error;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(error.toString()),
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('Home'),
            ),
          ],
        ),
      );
}
