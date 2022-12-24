// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fredgrotts_md3_demo/src/domain/log_appenders.dart';
import 'package:logging/logging.dart';

const String appTitle = "Material Design 3 Demo";

final Logger appLog = Logger(appTitle);

late StreamSubscription<LogRecord>? _subscription;

void setUpAppLogging() {
  if (kDebugMode) {
    recordStackTraceAtLevel = Level.ALL;

    _subscription = Logger.root.onRecord.listen((record) {
      if (record.error != null && record.stackTrace != null) {
        log('${record.level.name}: ${record.loggerName}: ${record.time}: ${record.message}: ${record.error}: ${record.stackTrace}');

        log(
          'level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error} exception: ${record.stackTrace}',
        );
      } else if (record.error != null) {
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error}');
      } else {
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message}');
      }
      

    });
    MyDevLogAppender(formatter: const MyDevLogRecordFormatter())
        .attachToLogger(Logger.root);
  }
  if (kReleaseMode) {
    recordStackTraceAtLevel = Level.WARNING;

    _subscription = Logger.root.onRecord.listen((record) {
      if (record.error != null && record.stackTrace != null) {
        log('${record.level.name}: ${record.loggerName}: ${record.time}: ${record.message}: ${record.error}: ${record.stackTrace}');

        log(
          'level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error} exception: ${record.stackTrace}',
        );
      } else if (record.error != null) {
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error}');
      } else {
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message}');
      }


    });
    MyReleaseLogAppender(formatter: const MyReleaseLogRecordFormatter())
        .attachToLogger(Logger.root);

  }
}
