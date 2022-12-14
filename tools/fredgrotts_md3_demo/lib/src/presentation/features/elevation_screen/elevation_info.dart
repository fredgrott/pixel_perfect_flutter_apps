// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class ElevationInfo {
  const ElevationInfo(
    this.level,
    this.elevation,
    this.overlayPercent,
  );
  final int level;
  final double elevation;
  final int overlayPercent;
}

const List<ElevationInfo> elevations = <ElevationInfo>[
  ElevationInfo(
    0,
    0.0,
    0,
  ),
  ElevationInfo(
    1,
    1.0,
    5,
  ),
  ElevationInfo(
    2,
    3.0,
    8,
  ),
  ElevationInfo(
    3,
    6.0,
    11,
  ),
  ElevationInfo(
    4,
    8.0,
    12,
  ),
  ElevationInfo(
    5,
    12.0,
    14,
  ),
];
