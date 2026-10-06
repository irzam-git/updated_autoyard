# Flutter Production Boilerplate

A production-ready Flutter starter architecture adhering strictly to **Clean Architecture** (Presentation → Domain → Data), **Zero Hardcoding**, and reactive state management.

---

## 🏗️ Architecture Blueprint

Based on [architecture.md](file:///Users/pixelz360/Desktop/boilerplate/start/architecture.md):

- **State Management & DI**: [Riverpod](https://riverpod.dev) with code generation (`@riverpod`)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router) with auth redirect guards and shell routing
- **Network Layer**: [Dio](https://pub.dev/packages/dio) singleton with typed errors, logging interceptor, and secure token injection
- **Local Storage**: [Hive](https://pub.dev/packages/hive_flutter) (AES encrypted box for tokens) & [SharedPreferences](https://pub.dev/packages/shared_preferences)
- **Functional Error Handling**: [fpdart](https://pub.dev/packages/fpdart) `Either<Failure, T>`
- **Serialization**: [Freezed](https://pub.dev/packages/freezed) immutable sealed classes & [json_serializable](https://pub.dev/packages/json_serializable)
- **Design System**: Strict design tokens (`AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`, `AppShadows`, `AppTheme`)
- **Component Library**: 12 custom, reusable `App*` UI components (zero raw unstyled Flutter widgets)

---

## 📁 Project Directory Structure

```
lib/
├── main.dart                        # Entry point & async initializations
├── app.dart                         # ScreenUtilInit, Theme binding, GoRouter
│
├── core/
│   ├── config/                      # app_config.dart, flavor.dart
│   ├── constants/                   # app_strings.dart, app_assets.dart, app_enums.dart
│   ├── design/                      # app_colors.dart, app_typography.dart, app_spacing.dart, app_radius.dart, app_shadows.dart, app_animations.dart, app_theme.dart
│   ├── error/                       # app_exception.dart, failure.dart, global_error_handler.dart
│   ├── network/                     # dio_client.dart, auth_interceptor.dart, log_interceptor.dart, api_exception.dart
│   ├── router/                      # app_router.dart, app_routes.dart
│   ├── storage/                     # hive_service.dart, prefs_service.dart
│   └── utils/                       # extensions.dart, validators.dart, logger.dart
│
├── components/                      # 100% reusable App* UI widgets
│   ├── app_button.dart
│   ├── app_text_field.dart
│   ├── app_heading.dart
│   ├── app_avatar.dart
│   ├── app_list_tile.dart
│   ├── app_header.dart
│   ├── app_bottom_nav.dart
│   ├── app_theme_switch.dart
│   ├── app_loader.dart
│   ├── app_snackbar.dart
│   ├── app_dialog.dart
│   └── app_empty_state.dart
│
└── features/
    ├── auth/                        # Clean Architecture Auth Feature
    │   ├── data/                    # Remote data sources & repo implementations
    │   ├── domain/                  # Repository contracts & Freezed models
    │   └── presentation/            # Riverpod controllers & UI screens
    ├── home/                        # Shell, Home, and Profile screens
    └── splash/                      # Splash screen with auto-auth redirection
```

---

## 🚀 Getting Started on a New App Project

### 1. Rename the Project
Run the automated renaming script:
```bash
./scripts/rename_project.sh <new_package_name> [new_bundle_id]
```
Example:
```bash
./scripts/rename_project.sh ride_share com.company.rideshare
```

### 2. Run Code Generation
```bash
# One-time build
dart run build_runner build

# Watch mode during feature development
dart run build_runner watch
```

### 3. Run the App with Environment Flavors
```bash
# Development
flutter run --dart-define=FLAVOR=dev --dart-define=BASE_URL=https://dev-api.example.com

# Production
flutter run --dart-define=FLAVOR=prod --dart-define=BASE_URL=https://api.example.com
```
