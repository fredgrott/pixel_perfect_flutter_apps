// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';

class ButtonsWithIcon extends StatefulWidget {
  @override
  State<ButtonsWithIcon> createState() => _ButtonsWithIconState();
}

class _ButtonsWithIconState extends State<ButtonsWithIcon> {
  @override
  Widget build(BuildContext context) {
    late Flushbar<bool> flush;


    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: () {
              flush = Flushbar<bool>(
                margin: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(8),
                duration: const Duration(seconds: 45),
                backgroundColor: Theme.of(context).colorScheme.background,
                messageText: Text(
                  'Yay! ElevatedButton is clicked',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.surface),
                ),
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
            icon: const Icon(Icons.add),
            label: const Text('Icon'),
          ),
          colDivider,
          FilledButton.icon(
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
            label: const Text('Icon'),
            icon: const Icon(Icons.add),
          ),
          colDivider,
          FilledButton.tonalIcon(
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
                    // SetState() is optional here.
                    log("Dismissed");
                  });
                });
            },
            label: const Text('Icon'),
            icon: const Icon(Icons.add),
          ),
          colDivider,
          OutlinedButton.icon(
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
                   // SetState() is optional here.e
                    log("Dismissed");
                  });
                });
            },
            icon: const Icon(Icons.add),
            label: const Text('Icon'),
          ),
          colDivider,
          TextButton.icon(
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
            icon: const Icon(Icons.add),
            label: const Text('Icon'),
          ),
        ],
      ),
    );
  }


}
