import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

abstract class AppLogger {
  static void debug(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(
        '💡 [DEBUG] $message',
        error: error,
        stackTrace: stackTrace,
        name: 'AppLogger',
      );
    }
  }

  static void info(String message) {
    if (kDebugMode) {
      developer.log(
        'ℹ️ [INFO] $message',
        name: 'AppLogger',
      );
    }
  }

  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(
        '⚠️ [WARN] $message',
        error: error,
        stackTrace: stackTrace,
        name: 'AppLogger',
      );
    }
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(
      '🚨 [ERROR] $message',
      error: error,
      stackTrace: stackTrace,
      name: 'AppLogger',
    );
  }
}
