// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef PlatformCallback = void Function(TargetPlatform platform);

class PlatformSelector extends StatefulWidget {
  const PlatformSelector({
    super.key,
    required this.onChangedPlatform,
  });

  final PlatformCallback onChangedPlatform;

  @override
  State<PlatformSelector> createState() => _PlatformSelectorState();
}

class _PlatformSelectorState extends State<PlatformSelector> {
  static const int targetPlatformStringLength = 15; // 'TargetPlatform.'.length.

  static String _platformToString(TargetPlatform platform) {
    return platform.toString().substring(targetPlatformStringLength);
  }

  final TargetPlatform originaPlatform = defaultTargetPlatform;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      child: DropdownButton<TargetPlatform>(
        value: defaultTargetPlatform,
        icon: const Icon(CommunityMaterialIcons.devices),
        elevation: 16,
        //
        // ignore: prefer-extracting-callbacks
        onChanged: (TargetPlatform? value) {
          if (value == null) {
            return;
          }

          widget.onChangedPlatform(value);
          //
          // ignore: no-empty-block
          setState(() {});
        },
        items: TargetPlatform.values.map((TargetPlatform platform) {
          return DropdownMenuItem<TargetPlatform>(
            value: platform,
            child: Row(
              children: <Widget>[
                if (platform == originaPlatform)
                  const Icon(
                    Icons.home,
                    color: Color(0xff616161),
                  ),
                Text(_platformToString(platform)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
