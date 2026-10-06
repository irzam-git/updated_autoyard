import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'core/error/global_error_handler.dart';
import 'core/storage/hive_service.dart';
import 'core/storage/prefs_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide system bottom navigation bar persistently (auto re-hides after edge swipe)
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );

  // Configure transparent navigation bar styling
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  // Initialize global crash/error handling
  GlobalErrorHandler.initialize();

  // Initialize storage layers
  await PrefsService.initialize();
  await HiveService.initialize();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
