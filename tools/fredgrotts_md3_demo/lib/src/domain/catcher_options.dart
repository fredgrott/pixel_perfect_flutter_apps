// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:catcher/catcher.dart';
import 'package:fredgrotts_md3_demo/src/domain/catcher_custom_logger.dart';

// Per Issue repot https://github.com/jhomlala/catcher/issues/197
// I have to use SilentRportMode as even supplying navigatorKey via
// routes does not fully resovle it.
final ReportMode reportMode = SilentReportMode();

const String kAppErrorEmailAddyOne = "myname@myname.com";
const String kAppErrorEmailAddyTwo = "myname@myname.com";

const String kAppErrorReportTitle = "Error";
const String kAppErrorReportHeader = "ErrorDetail";

final CatcherOptions debugOptions = CatcherOptions(
  reportMode,
  [
    ConsoleHandler(
      enableApplicationParameters: true,
      enableDeviceParameters: true,
      enableCustomParameters: true,
      enableStackTrace: true,
    ),
    // Requires the SentryClient import, put this in pubspec sentry: ^5.1.0
    //SentryHandler(
    //SentryClient(SentryOptions(dsn: 'YOUR DSN HERE')),
    //printLogs: true,
    //),
  ],
  logger: CatcherCustomLogger(),
);

final CatcherOptions releaseOptions = CatcherOptions(
  reportMode,
  [
    EmailManualHandler(
      [
        kAppErrorEmailAddyOne,
        kAppErrorEmailAddyTwo,
      ],
      enableDeviceParameters: true,
      enableStackTrace: true,
      enableCustomParameters: true,
      enableApplicationParameters: true,
      sendHtml: true,
      emailTitle: kAppErrorReportTitle,
      emailHeader: kAppErrorReportHeader,
      printLogs: true,
    ),
  ],
  logger: CatcherCustomLogger(),
);

final CatcherOptions profileOptions = CatcherOptions(
  reportMode,
  [
    EmailManualHandler(
      [
        kAppErrorEmailAddyOne,
        kAppErrorEmailAddyTwo,
      ],
      enableDeviceParameters: true,
      enableStackTrace: true,
      enableCustomParameters: true,
      enableApplicationParameters: true,
      sendHtml: true,
      emailTitle: kAppErrorReportTitle,
      emailHeader: kAppErrorReportHeader,
      printLogs: true,
    ),
  ],
  logger: CatcherCustomLogger(),
);
