// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class Dialogs extends StatefulWidget {
  const Dialogs({super.key});

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  void openDialog(BuildContext context) {
    //  From animations package showModal.
    showModal<void>(
      // BarrierColor: semanticColors?.semanticThree?.withOpacity(0.25),.
      configuration: const FadeScaleTransitionConfiguration(),
      context: context,
      builder: (context) => AlertDialog(
        // BackgroundColor: semanticColors?.semanticContainerTwo,.o,
        title: const Text(
          'Basic Dialog Title',
          // Style: TextStyle(color: semanticColors?.onSemanticContainerTwo),.wo),
        ),
        content: const Text(
          'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
          //style: TextStyle(
          //color: semanticColors?.onSemanticContainerTwo,
          //),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Dismiss',
              //style: TextStyle(
              //  color: semanticColors?.onSemanticContainerTwo,
              // ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text(
              'Action',
              //style: TextStyle(
              //color: semanticColors?.onSemanticContainerTwo,
              //),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        child: const Text(
          'Open Dialog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () => openDialog(context),
      ),
    );
  }
}
