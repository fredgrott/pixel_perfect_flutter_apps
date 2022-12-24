// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    required this.body,
    super.key,
  });

  final Widget body;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: body,
      );
}
