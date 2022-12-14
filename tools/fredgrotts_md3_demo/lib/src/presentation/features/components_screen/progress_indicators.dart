// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class ProgressIndicators extends StatefulWidget {
  const ProgressIndicators({super.key});

  @override
  State<ProgressIndicators> createState() => _ProgressIndicatorsState();
}

class _ProgressIndicatorsState extends State<ProgressIndicators> {
  bool playProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    final double? progressValue = playProgressIndicator ? null : 0.7;

    return Column(
      children: <Widget>[
        Row(
          children: [
            IconButton(
              isSelected: playProgressIndicator,
              selectedIcon: const Icon(Icons.pause),
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                setState(() {
                  playProgressIndicator = !playProgressIndicator;
                });
              },
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CircularProgressIndicator.adaptive(
                    value: progressValue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progressValue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
