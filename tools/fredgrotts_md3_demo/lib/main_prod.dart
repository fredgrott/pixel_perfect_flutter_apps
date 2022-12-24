// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:fredgrotts_md3_demo/main.dart';
import 'package:fredgrotts_md3_demo/src/domain/build_variants_vars.dart';

void main() {
  Constants().setEnvironment(Environment.prod);
  mainDelegate();
}
