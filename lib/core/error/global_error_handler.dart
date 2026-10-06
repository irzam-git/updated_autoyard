import 'package:flutter/foundation.dart';
import '../utils/logger.dart';

abstract class GlobalErrorHandler {
  static void initialize() {
    // Catch Flutter UI framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      AppLogger.error(
        'FlutterError caught by GlobalErrorHandler',
        details.exception,
        details.stack,
      );
    };

    // Catch asynchronous / platform errors
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      AppLogger.error(
        'Async error caught by PlatformDispatcher',
        error,
        stack,
      );
      return true;
    };
  }
}
