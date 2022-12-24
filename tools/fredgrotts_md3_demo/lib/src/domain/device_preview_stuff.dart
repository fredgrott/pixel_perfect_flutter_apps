// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:io';
import 'package:path/path.dart';
import 'package:screenshot_modes/screenshot_modes.dart';

Future<String> saveScreenShot(DeviceScreenshotWithLabel screen) async {
  final String name = screen.label.join('/');
  final path = join(Directory.current.path, 'screenshot', '$name.png',);
  final imageFile = File(path);
  await imageFile.create(recursive: true);
  await imageFile.writeAsBytes(screen.deviceScreenshot.bytes);
  
  return '$path saved'; // Messege printed to device preview plugins windwos.
}
