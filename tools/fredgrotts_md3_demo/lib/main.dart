// ignore_for_file: noop_primitive_operations

import 'dart:async';

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:fredgrotts_md3_demo/src/domain/asset_list.dart';
import 'package:fredgrotts_md3_demo/src/domain/catcher_options.dart';
import 'package:fredgrotts_md3_demo/src/domain/set_up_app_logging.dart';
import 'package:fredgrotts_md3_demo/src/presentation/features/app/my_app.dart';

// Required for build variants functionality.
void mainDelegate() => main();


void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  // This is how to implement an asset cache.
  binding.addPostFrameCallback((_) async {
    final Element? context = binding.renderViewElement;
    if (context != null) {
      for (final asset in assetList) {
        precacheImage(
          AssetImage(asset),
          context,
        );
      }
    }
  });

  setUpAppLogging();

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (FlutterErrorDetails errorDetails) {
        appLog.warning("Will log here ${errorDetails.exception.toString()}");
      };
      Catcher(
        debugConfig: debugOptions,
        releaseConfig: releaseOptions,
        profileConfig: profileOptions,
        runAppFunction: ()  {
          runApp(MyApp());

        },
      );
      
    },
    (
      error,
      stackTrace,
    ) {
      appLog.warning("Others catching ${error.toString()}");
    },
  );
}
