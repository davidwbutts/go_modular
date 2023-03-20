
import 'dart:developer' show log;
import 'package:flutter/foundation.dart';

abstract class AppLogger {
    static void onFlutterError(FlutterErrorDetails errorDetails) {
      log(errorDetails.toString(minLevel: DiagnosticLevel.debug), name: 'ERR_FLUTTER');
    }

    static bool onPlatformError(Object exception, StackTrace stackTrace) {
      log('$exception\n$stackTrace', name: 'ERR_PLATFORM');
      return true;
    }
}