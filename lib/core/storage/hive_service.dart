import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../utils/logger.dart';

abstract class HiveBoxes {
  static const String authBox = 'AUTH_BOX';
  static const String appDataBox = 'APP_DATA_BOX';
}

abstract class HiveKeys {
  static const String authToken = 'AUTH_TOKEN';
  static const String refreshToken = 'REFRESH_TOKEN';
  static const String userData = 'USER_DATA';
}

class HiveService {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> initialize() async {
    await Hive.initFlutter();

    // Setup encryption key for secure hive box
    final encryptionKeyString = await _secureStorage.read(key: 'HIVE_ENCRYPTION_KEY');
    List<int> encryptionKey;
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await _secureStorage.write(key: 'HIVE_ENCRYPTION_KEY', value: base64UrlEncode(key));
      encryptionKey = key;
    } else {
      encryptionKey = base64Url.decode(encryptionKeyString);
    }

    try {
      await Hive.openBox(
        HiveBoxes.authBox,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      await Hive.openBox(HiveBoxes.appDataBox);
      AppLogger.info('HiveService initialized successfully');
    } catch (e, st) {
      AppLogger.error('Failed to open Hive boxes', e, st);
    }
  }

  // Token management
  static Future<void> saveTokens({required String token, String? refreshToken}) async {
    final box = Hive.box(HiveBoxes.authBox);
    await box.put(HiveKeys.authToken, token);
    if (refreshToken != null) {
      await box.put(HiveKeys.refreshToken, refreshToken);
    }
  }

  static String? getAuthToken() {
    final box = Hive.box(HiveBoxes.authBox);
    return box.get(HiveKeys.authToken) as String?;
  }

  static String? getRefreshToken() {
    final box = Hive.box(HiveBoxes.authBox);
    return box.get(HiveKeys.refreshToken) as String?;
  }

  static Future<void> saveUserData(Map<String, dynamic> json) async {
    final box = Hive.box(HiveBoxes.authBox);
    await box.put(HiveKeys.userData, jsonEncode(json));
  }

  static Map<String, dynamic>? getUserData() {
    final box = Hive.box(HiveBoxes.authBox);
    final raw = box.get(HiveKeys.userData) as String?;
    if (raw == null || raw.isEmpty) return null;
    try {
      return jsonDecode(raw) as Map<String, dynamic>?;
    } catch (_) {
      return null;
    }
  }

  static bool hasValidToken() {
    final token = getAuthToken();
    return token != null && token.isNotEmpty;
  }

  static Future<void> clearAuthData() async {
    final box = Hive.box(HiveBoxes.authBox);
    await box.clear();
  }

  // General Box operations
  static Box getAppDataBox() => Hive.box(HiveBoxes.appDataBox);
}
