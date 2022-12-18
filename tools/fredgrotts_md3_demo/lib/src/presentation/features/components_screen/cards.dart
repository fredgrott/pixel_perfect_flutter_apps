// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is md3 demo by Flutter Team as part of
// the experimental part of Flutter Samples under BSD-clause 3 license
// copyrigth 2021 see: https://github.com/flutter/samples/tree/main/experimental/material_3_demo

import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/entities/divider.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: cardWidth,
            child: Tooltip(
              margin: const EdgeInsets.only(top: 20),
              message: 'Elevated Card',
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.more_vert),
                      ),
                      SizedBox(height: 35),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Elevated'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: cardWidth,
            child: Tooltip(
              margin: const EdgeInsets.only(top: 20),
              message: 'Filled Card',
              child: Card(
                color: Theme.of(context).colorScheme.surfaceVariant,
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.more_vert),
                      ),
                      SizedBox(height: 35),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Filled'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: cardWidth,
            child: Tooltip(
              margin: const EdgeInsets.only(top: 20),
              message: 'Outlined Card',
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.more_vert),
                      ),
                      SizedBox(height: 35),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Outlined'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
