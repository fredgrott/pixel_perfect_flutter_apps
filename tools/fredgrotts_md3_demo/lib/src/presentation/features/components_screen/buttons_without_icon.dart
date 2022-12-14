// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';

class ButtonsWithoutIcon extends StatefulWidget {
  final bool isDisabled;

  const ButtonsWithoutIcon({super.key, required this.isDisabled});

  @override
  State<ButtonsWithoutIcon> createState() => _ButtonsWithoutIconState();
}

class _ButtonsWithoutIconState extends State<ButtonsWithoutIcon> {
  @override
  Widget build(BuildContext context) {
    late Flushbar<bool> flush;

    if (widget.isDisabled) {
      return IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            colDivider,
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            colDivider,
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Filled Tonal'),
            ),
            colDivider,
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            colDivider,
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
          ],
        ),
      );
    } else {
      return IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                flush = Flushbar<bool>(
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                  duration: const Duration(seconds: 45),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  messageText: Text(
                    'Yay! ElevatedButton is clicked',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                  messageColor: Theme.of(context).colorScheme.onBackground,
                  mainButton: ElevatedButton(
                    onPressed: () {
                      flush.dismiss(true);
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,),
                    ),
                  ),
                )..show(context).then((result) {
                  setState(() {
                      // setState() is optional here
                      log("Dismissed");
                    });
                });
              },
              child: const Text('Elevated'),
            ),
            colDivider,
            FilledButton(
              onPressed: () {
                flush = Flushbar<bool>(
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                  duration: const Duration(seconds: 45),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  messageText: Text(
                    'Yay! FilledButton is clicked',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                  messageColor: Theme.of(context).colorScheme.onBackground,
                  mainButton: ElevatedButton(
                    onPressed: () {
                      flush.dismiss(true);
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                )..show(context).then((result) {
                    setState(() {
                      // setState() is optional here
                      log("Dismissed");
                    });
                  });
              },
              child: const Text('Filled'),
            ),
            colDivider,
            FilledButton.tonal(
              onPressed: () {
                flush = Flushbar<bool>(
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                  duration: const Duration(seconds: 45),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  messageText: Text(
                    'Yay! FilledButton Tonal is clicked',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                  messageColor: Theme.of(context).colorScheme.onBackground,
                  mainButton: ElevatedButton(
                    onPressed: () {
                      flush.dismiss(true);
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                )..show(context).then((result) {
                    setState(() {
                      // setState() is optional here
                      log("Dismissed");
                    });
                  });
              },
              child: const Text('Filled Tonal'),
            ),
            colDivider,
            OutlinedButton(
              onPressed: () {
                flush = Flushbar<bool>(
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                  duration: const Duration(seconds: 45),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  messageText: Text(
                    'Yay! OutlinedButton is clicked',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                  messageColor: Theme.of(context).colorScheme.onBackground,
                  mainButton: ElevatedButton(
                    onPressed: () {
                      flush.dismiss(true);
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                )..show(context).then((result) {
                    setState(() {
                      // setState() is optional here
                      log("Dismissed");
                    });
                  });
              },
              child: const Text('Outlined'),
            ),
            colDivider,
            TextButton(
              onPressed: () {
                flush = Flushbar<bool>(
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                  duration: const Duration(seconds: 45),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  messageText: Text(
                    'Yay! TextButton is clicked',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                  messageColor: Theme.of(context).colorScheme.onBackground,
                  mainButton: ElevatedButton(
                    onPressed: () {
                      flush.dismiss(true);
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                )..show(context).then((result) {
                    setState(() {
                      // setState() is optional here
                      log("Dismissed");
                    });
                  });
              },
              child: const Text('Text'),
            ),
          ],
        ),
      );
    }
  }
}
