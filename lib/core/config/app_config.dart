import 'flavor.dart';

abstract class AppConfig {
  static const String appVersion = '1.0.0';
  static const String flavorName = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://dev.autoyard.com.au/api/v1',
  );

  static Flavor get flavor {
    switch (flavorName.toLowerCase()) {
      case 'prod':
      case 'production':
        return Flavor.prod;
      case 'staging':
        return Flavor.staging;
      case 'dev':
      default:
        return Flavor.dev;
    }
  }

  static bool get isProduction => flavor == Flavor.prod;
  static bool get isStaging => flavor == Flavor.staging;
  static bool get isDev => flavor == Flavor.dev;
}
