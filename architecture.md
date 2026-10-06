# Flutter App Architecture Blueprint
> **Version:** 2.0
> This document is the **single source of truth** for how any new Flutter app must be structured, built, and maintained. Hand this file to any AI or developer and say *"follow this architecture"* — it contains everything needed.

---

## Table of Contents
1. [Core Philosophy](#1-core-philosophy)
2. [Tech Stack](#2-tech-stack)
3. [Folder Structure](#3-folder-structure)
4. [Naming Conventions](#4-naming-conventions)
5. [Design System & Theme Engine](#5-design-system--theme-engine)
6. [State Management — Riverpod](#6-state-management--riverpod)
7. [Navigation — GoRouter](#7-navigation--gorouter)
8. [Network & API Layer](#8-network--api-layer)
9. [Local Storage Strategy](#9-local-storage-strategy)
10. [Authentication Flow](#10-authentication-flow)
11. [Error Handling Strategy](#11-error-handling-strategy)
12. [Custom Component Library](#12-custom-component-library)
13. [Code Generation Setup](#13-code-generation-setup)
14. [Environment & Config Management](#14-environment--config-management)
15. [Testing Strategy](#15-testing-strategy)
16. [pubspec.yaml Starter Template](#16-pubspecyaml-starter-template)

---

## 1. Core Philosophy

- **Clean Architecture** — 3 strict layers: Presentation → Domain → Data. Dependencies only point inward.
- **Zero Hardcoding** — No inline colors, strings, sizes, paddings, or radii anywhere in UI files.
- **Single Responsibility** — Every file/class does exactly one thing.
- **UI is dumb** — Screens and widgets contain zero business logic. They only read state and dispatch events.
- **Everything is wrapped** — Never use raw Flutter widgets (Text, TextField, ElevatedButton) directly in screens. Always use your App* component wrappers.
- **Fail loudly in dev, fail gracefully in prod** — Use assertions in development; catch and surface errors gracefully in production.

---

## 2. Tech Stack

| Concern | Package | Notes |
|---|---|---|
| State Management & DI | `flutter_riverpod` + `riverpod_annotation` | Use `@riverpod` codegen annotations |
| Navigation | `go_router` | Declarative routing with auth guards |
| Network | `dio` | With interceptors for auth, logging, retry |
| Local Storage | `hive_flutter` | For structured data; `shared_preferences` for simple flags |
| Serialization | `freezed` + `json_serializable` | Immutable models with copyWith/toJson/fromJson |
| Code Generation | `build_runner` | Required for Riverpod, Freezed, JSON |
| Firebase | `firebase_core`, `cloud_firestore`, `firebase_auth`, `firebase_messaging` | Only import what the project needs |
| UI Utilities | `flutter_screenutil` | Responsive sizing |
| SVG | `flutter_svg` | For all SVG assets |
| Date/Time | `intl` | Formatting only; never use raw DateTime.toString() |
| Forms | Custom `AppTextField` + Riverpod | No third-party form libraries |

---

## 3. Folder Structure

```
lib/
├── main.dart                        # App entry point only — no logic here
├── app.dart                         # MaterialApp.router setup, theme binding
│
├── core/
│   ├── config/
│   │   ├── app_config.dart          # Env-specific config (baseUrl, keys)
│   │   └── flavor.dart              # Flavor enum: dev | staging | prod
│   │
│   ├── constants/
│   │   ├── app_strings.dart         # All user-facing strings (no hardcoded text in UI)
│   │   ├── app_assets.dart          # All asset paths as static constants
│   │   └── app_enums.dart           # Shared enums used across features
│   │
│   ├── design/
│   │   ├── app_colors.dart          # Color palette (light + dark tokens)
│   │   ├── app_typography.dart      # TextStyle tokens (h1-h6, body, label)
│   │   ├── app_spacing.dart         # Spacing/padding constants
│   │   ├── app_radius.dart          # Border radius constants
│   │   ├── app_shadows.dart         # Box shadow profiles
│   │   ├── app_animations.dart      # Duration + curve constants
│   │   └── app_theme.dart           # ThemeData light/dark + ThemeModeNotifier
│   │
│   ├── network/
│   │   ├── dio_client.dart          # Dio singleton with interceptors
│   │   ├── auth_interceptor.dart    # Injects Bearer token, handles 401 refresh
│   │   ├── log_interceptor.dart     # Debug-only request/response logging
│   │   └── api_exception.dart       # Typed network error model
│   │
│   ├── storage/
│   │   ├── hive_service.dart        # Hive initialization + box accessors
│   │   └── prefs_service.dart       # SharedPreferences wrapper
│   │
│   ├── error/
│   │   ├── app_exception.dart       # Base exception class hierarchy
│   │   ├── failure.dart             # Domain-level sealed Failure class
│   │   └── global_error_handler.dart
│   │
│   ├── router/
│   │   ├── app_router.dart          # GoRouter definition with all routes
│   │   ├── app_routes.dart          # Route name/path constants
│   │   └── route_guards.dart        # Auth redirect logic
│   │
│   └── utils/
│       ├── extensions.dart          # Dart extensions (String, DateTime, etc.)
│       ├── validators.dart          # Form validation functions
│       └── logger.dart              # Unified logging wrapper
│
├── components/                      # 100% reusable App* widgets
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
    ├── auth/
    │   ├── data/
    │   │   ├── auth_remote_datasource.dart
    │   │   └── auth_repository_impl.dart
    │   ├── domain/
    │   │   ├── auth_repository.dart        # Abstract interface
    │   │   └── models/
    │   │       └── user_model.dart         # @freezed model
    │   └── presentation/
    │       ├── controllers/
    │       │   └── auth_controller.dart    # @riverpod notifier
    │       └── screens/
    │           ├── login_screen.dart
    │           └── register_screen.dart
    │
    └── [feature_name]/             # Repeat this exact pattern for every new feature
        ├── data/
        ├── domain/
        └── presentation/
            ├── controllers/
            └── screens/
```

---

## 4. Naming Conventions

| Thing | Convention | Example |
|---|---|---|
| Files | `snake_case.dart` | `user_profile_screen.dart` |
| Classes | `PascalCase` | `UserProfileScreen` |
| Variables & Methods | `camelCase` | `fetchUserData()` |
| Constants | `camelCase` inside abstract class | `AppSpacing.md` |
| Riverpod Providers | auto-generated from class name | `authControllerProvider` |
| Route paths | `camelCase` string constant | `AppRoutes.home = '/home'` |
| Hive box names | `SCREAMING_SNAKE` const string | `'USER_BOX'` |
| Feature folders | `snake_case` | `features/vehicle_listing/` |
| Abstract repo | `XRepository` | `AuthRepository` |
| Concrete impl | `XRepositoryImpl` | `AuthRepositoryImpl` |
| Notifier/Controller | `XController` | `AuthController` |
| Frozen model | `XModel` | `UserModel` |

---

## 5. Design System & Theme Engine

### 5.1 Color Palette — app_colors.dart

Define an `AppColors` abstract class with **only** `static const` colors.
**Rule:** Never reference `Colors.*` from Material directly in UI files. Always use `AppColors.*`.

```dart
abstract class AppColors {
  // Brand
  static const Color primary      = Color(0xFF0057FF);
  static const Color primaryLight = Color(0xFF5E8FFF);
  static const Color primaryDark  = Color(0xFF003DBF);

  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8F9FB);
  static const Color backgroundDark  = Color(0xFF0F1117);
  static const Color surfaceLight    = Color(0xFFFFFFFF);
  static const Color surfaceDark     = Color(0xFF1C1E26);

  // Semantic
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error   = Color(0xFFEF4444);
  static const Color info    = Color(0xFF3B82F6);

  // Text
  static const Color textPrimaryLight   = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color textPrimaryDark    = Color(0xFFF9FAFB);
  static const Color textSecondaryDark  = Color(0xFF9CA3AF);
}
```

### 5.2 Typography — app_typography.dart

One unified class. All text in the app uses these styles.
**Rule:** Never define `TextStyle` inline in a widget file.

```dart
abstract class AppTypography {
  static const String fontFamily = 'ProductSans';

  static const TextStyle h1     = TextStyle(fontSize: 32, fontWeight: FontWeight.w700, fontFamily: fontFamily);
  static const TextStyle h2     = TextStyle(fontSize: 26, fontWeight: FontWeight.w700, fontFamily: fontFamily);
  static const TextStyle h3     = TextStyle(fontSize: 22, fontWeight: FontWeight.w600, fontFamily: fontFamily);
  static const TextStyle h4     = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: fontFamily);
  static const TextStyle h5     = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: fontFamily);
  static const TextStyle h6     = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: fontFamily);
  static const TextStyle bodyLg = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: fontFamily);
  static const TextStyle bodyMd = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: fontFamily);
  static const TextStyle bodySm = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: fontFamily);
  static const TextStyle label  = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: fontFamily);
  static const TextStyle button = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, fontFamily: fontFamily);
}
```

### 5.3 Spacing — app_spacing.dart

```dart
abstract class AppSpacing {
  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 16.0;
  static const double lg  = 24.0;
  static const double xl  = 32.0;
  static const double xxl = 48.0;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: md);
}
```

### 5.4 Border Radius — app_radius.dart

```dart
abstract class AppRadius {
  static const double sm   = 6.0;
  static const double md   = 12.0;
  static const double lg   = 20.0;
  static const double xl   = 28.0;
  static const double full = 999.0;

  static const BorderRadius card   = BorderRadius.all(Radius.circular(md));
  static const BorderRadius button = BorderRadius.all(Radius.circular(md));
  static const BorderRadius input  = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius chip   = BorderRadius.all(Radius.circular(full));
}
```

### 5.5 Theme — app_theme.dart

```dart
// Riverpod-managed theme mode, persisted in SharedPreferences
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() => ThemeMode.system;

  void setLight() => state = ThemeMode.light;
  void setDark()  => state = ThemeMode.dark;
  void toggle()   => state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}

ThemeData get lightTheme => ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    surface: AppColors.surfaceLight,
    error: AppColors.error,
  ),
);

ThemeData get darkTheme => ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    surface: AppColors.surfaceDark,
    error: AppColors.error,
  ),
);
```

---

## 6. State Management — Riverpod

### Rules
- **Always use `@riverpod` codegen** — never write providers manually.
- **Notifiers for mutable state** — use `@riverpod class X extends _$X`.
- **Providers for async read-only** — use `@riverpod Future<X> fetchX(...)`.
- **Never call `ref.read()` inside `build()`** — use `ref.watch()`.
- **Never put `BuildContext` in a notifier** — pass values as method arguments.
- **State is sealed** — every notifier's state is a `@freezed` sealed class.

### Controller Pattern

```dart
part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => const AuthState.initial();

  Future<void> login({required String email, required String password}) async {
    state = const AuthState.loading();
    final result = await ref.read(authRepositoryProvider).login(email: email, password: password);
    state = result.fold(
      (failure) => AuthState.error(failure.message),
      (user)    => AuthState.authenticated(user),
    );
  }

  void logout() {
    ref.read(authRepositoryProvider).logout();
    state = const AuthState.unauthenticated();
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial()                      = _Initial;
  const factory AuthState.loading()                      = _Loading;
  const factory AuthState.authenticated(UserModel user)  = _Authenticated;
  const factory AuthState.unauthenticated()              = _Unauthenticated;
  const factory AuthState.error(String message)          = _Error;
}
```

---

## 7. Navigation — GoRouter

### Router Setup — app_router.dart

```dart
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final isAuthenticated = authState is _Authenticated;
      final isOnAuthPage    = state.matchedLocation == AppRoutes.login;

      if (!isAuthenticated && !isOnAuthPage) return AppRoutes.login;
      if (isAuthenticated && isOnAuthPage)  return AppRoutes.home;
      return null;
    },
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashScreen()),
      GoRoute(path: AppRoutes.login,  builder: (_, __) => const LoginScreen()),
      ShellRoute(
        builder: (_, __, child) => AppShell(child: child),
        routes: [
          GoRoute(path: AppRoutes.home,    builder: (_, __) => const HomeScreen()),
          GoRoute(path: AppRoutes.profile, builder: (_, __) => const ProfileScreen()),
        ],
      ),
    ],
  );
}
```

### Route Constants — app_routes.dart

```dart
abstract class AppRoutes {
  static const String splash  = '/';
  static const String login   = '/login';
  static const String signup  = '/signup';
  static const String home    = '/home';
  static const String profile = '/profile';
  // Every route is defined here — never hardcode strings in widgets
}
```

### Rules
- **Never use `Navigator.push()`** — always use `context.go()` or `context.push()`.
- **Never hardcode route paths** — always reference `AppRoutes.*`.
- Passing data: use route `extra` param or a shared Riverpod provider.

---

## 8. Network & API Layer

### Dio Client — dio_client.dart

```dart
@riverpod
Dio dioClient(DioClientRef ref) {
  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {'Content-Type': 'application/json'},
  ));

  dio.interceptors.addAll([
    ref.read(authInterceptorProvider),
    if (kDebugMode) LogInterceptor(responseBody: true),
  ]);

  return dio;
}
```

### Auth Interceptor
- On every request: inject `Authorization: Bearer <token>` from `HiveService`.
- On **401** response: attempt silent token refresh → retry original request.
- If refresh fails: trigger logout and redirect to login.

### API Exception — api_exception.dart

```dart
@freezed
class ApiException with _$ApiException implements Exception {
  const factory ApiException.network()               = _Network;
  const factory ApiException.timeout()               = _Timeout;
  const factory ApiException.unauthorized()          = _Unauthorized;
  const factory ApiException.serverError(int code)   = _ServerError;
  const factory ApiException.unknown(String message) = _Unknown;
}
```

### Repository Contract
- Every feature has an **abstract repository** in `domain/` — this is the contract.
- The **concrete implementation** in `data/` uses DioClient and converts exceptions to Failure.
- Repositories **always** return `Either<Failure, T>` — never throw up to the UI layer.

```dart
// domain/auth_repository.dart — the contract
abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login({required String email, required String password});
  Future<Either<Failure, void>> logout();
}

// data/auth_repository_impl.dart — the implementation
class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  AuthRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, UserModel>> login({required String email, required String password}) async {
    try {
      final response = await _dio.post('/auth/login', data: {'email': email, 'password': password});
      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    }
  }
}
```

---

## 9. Local Storage Strategy

| Data Type | Storage | Example |
|---|---|---|
| Auth tokens | `HiveService` (encrypted box) | Access/refresh tokens |
| User preferences | `PrefsService` (SharedPreferences) | Theme mode, language |
| Structured offline data | `HiveService` (typed box) | Cached listings |
| Sensitive secrets | `flutter_secure_storage` | API keys, passwords |

### Rules
- Never access Hive boxes directly in widgets or controllers — always go through `HiveService`.
- Box names are constants in `app_constants.dart`, never inline strings.
- Tokens are **never** stored in plain SharedPreferences.

---

## 10. Authentication Flow

```
App Launch
    |
    v
SplashScreen
    |
    v
HiveService.getToken()
    |-- Token valid -----------------------> Home (GoRouter redirect)
    |-- No token / expired
            |
            v
        Login Screen
            |
            v
        AuthController.login()
            |
            |-- Success --> Store token in HiveService --> GoRouter redirects to Home
            |-- Failure --> AppSnackBar.show(error message)

Logout:
    AuthController.logout()
        |-- Clear HiveService token box
        |-- Clear Dio auth header
        |-- Set state = unauthenticated --> GoRouter redirects to Login
```

---

## 11. Error Handling Strategy

### Sealed Failure Class — failure.dart

```dart
@freezed
class Failure with _$Failure {
  const factory Failure.network()                               = NetworkFailure;
  const factory Failure.unauthorized()                          = UnauthorizedFailure;
  const factory Failure.serverError({required String message})  = ServerFailure;
  const factory Failure.validation({required String message})   = ValidationFailure;
  const factory Failure.unknown({required String message})      = UnknownFailure;

  static Failure fromDioException(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout => const Failure.network(),
      DioExceptionType.receiveTimeout    => const Failure.network(),
      _                                  => Failure.unknown(message: e.message ?? 'Unknown error'),
    };
  }
}
```

### Error Handling by Layer

| Layer | Responsibility |
|---|---|
| Data (Repository) | Catch all exceptions, convert to `Left(Failure)` — never rethrow |
| Controller (Notifier) | Map `Failure` to a UI error state with a user-friendly message |
| UI (Screen/Widget) | Read error state, show `AppSnackBar` or `AppDialog` |
| Global | `FlutterError.onError` + `PlatformDispatcher.onError` → log to Crashlytics |

### Rules
- **Never** `try/catch` in a widget.
- **Never** show raw exception messages to users — map them to `AppStrings.*` messages.
- All async notifier methods **must** handle failures — no unhandled provider error states.

---

## 12. Custom Component Library

All components live in `lib/components/`. Rules:
- Consume design tokens from the design system — no inline styles.
- Support light and dark theme automatically via `Theme.of(context)`.
- Use **named parameters only** — no positional parameters.
- **Never** use `ListTile`, `Text`, `TextField`, `ElevatedButton` directly in screen files.

| Component | Key Props / Variants |
|---|---|
| `AppButton` | variants: `primary`, `secondary`, `outline`, `ghost`, `danger`; props: `label`, `onPressed`, `isLoading`, `isDisabled`, `icon`, `width` |
| `AppTextField` | states: `default`, `focused`, `error`, `success`, `disabled`; props: `label`, `hint`, `controller`, `validator`, `obscureText`, `leadingIcon`, `trailingIcon` |
| `AppHeading` | props: `text`, `level` (h1-h6), `color`, `textAlign` — renders `AppTypography.hX` automatically |
| `AppAvatar` | props: `imageUrl`, `initials`, `size`, `showBadge`, `badgeColor`, `onTap`; fallback to initials if image fails |
| `AppListTile` | props: `leading`, `title`, `subtitle`, `trailing`, `onTap`, `showDivider` |
| `AppHeader` | props: `title`, `subtitle`, `showBackButton`, `leadingAction`, `trailingActions`, `showThemeToggle` |
| `AppBottomNav` | props: `items`, `currentIndex`, `onTap`; driven by Riverpod — never uses `setState` |
| `AppLoader` | props: `isLoading`, `child`; overlay loading — never use raw `CircularProgressIndicator` in screens |
| `AppSnackBar` | `AppSnackBar.show(context, message, type: success/error/info/warning)` — static method |
| `AppDialog` | `AppDialog.show(context, title, message, actions)` — for confirmations and alerts |
| `AppEmptyState` | props: `icon`, `title`, `subtitle`, `action`; always use when a list has no data |
| `AppThemeSwitch` | reads/writes `themeModeNotifierProvider` — no additional props needed |

---

## 13. Code Generation Setup

### Required packages

```yaml
dependencies:
  flutter_riverpod: ^2.x.x
  riverpod_annotation: ^2.x.x
  freezed_annotation: ^2.x.x
  json_annotation: ^4.x.x

dev_dependencies:
  build_runner: ^2.x.x
  riverpod_generator: ^2.x.x
  freezed: ^2.x.x
  json_serializable: ^6.x.x
  custom_lint: ^0.x.x
  riverpod_lint: ^2.x.x
```

### Commands

```bash
# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (during active development)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Rules
- Every `@riverpod` file needs `part 'filename.g.dart';`
- Every `@freezed` model needs `part 'filename.freezed.dart';` AND `part 'filename.g.dart';`
- **Never manually edit** `.g.dart` or `.freezed.dart` files — they are auto-generated
- Team decision: either commit generated files or add to `.gitignore` — be consistent

---

## 14. Environment & Config Management

### Build-time injection via --dart-define

```bash
# Dev
flutter run --dart-define=FLAVOR=dev --dart-define=BASE_URL=https://dev-api.example.com

# Staging
flutter run --dart-define=FLAVOR=staging --dart-define=BASE_URL=https://staging-api.example.com

# Production
flutter build apk --dart-define=FLAVOR=prod --dart-define=BASE_URL=https://api.example.com
```

### app_config.dart

```dart
abstract class AppConfig {
  static const String flavor  = String.fromEnvironment('FLAVOR',   defaultValue: 'dev');
  static const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'https://dev-api.example.com');

  static bool get isProduction => flavor == 'prod';
  static bool get isDev        => flavor == 'dev';
}
```

### Rules
- **Never** hardcode API URLs or secret keys in source code.
- **Never** commit real secrets.
- Use **separate Firebase projects** for dev and prod.

---

## 15. Testing Strategy

### Folder Structure

```
test/
├── unit/
│   ├── repositories/        # Test with mocked Dio
│   └── controllers/         # Test notifiers with ProviderContainer
│
├── widget/
│   ├── components/          # Test every App* component in isolation
│   └── screens/             # Test screens with overridden providers
│
└── integration/
    └── flows/               # Full user flows (login to home, etc.)
```

### Rules
- Every **repository** must have unit tests.
- Every **controller** must have unit tests via `ProviderContainer`.
- Every `App*` **component** must have a widget test covering all variants/states.
- Use `mocktail` for mocking — not `mockito`.
- Target **>80% coverage** on `core/` and `domain/` layers.

### Controller Test Pattern

```dart
void main() {
  test('AuthController emits authenticated on successful login', () async {
    final mockRepo = MockAuthRepository();
    final container = ProviderContainer(overrides: [
      authRepositoryProvider.overrideWithValue(mockRepo),
    ]);

    when(() => mockRepo.login(email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Right(fakeUser));

    await container.read(authControllerProvider.notifier).login(email: 'a@b.com', password: '123');

    expect(container.read(authControllerProvider), isA<_Authenticated>());
  });
}
```

---

## 16. pubspec.yaml Starter Template

```yaml
name: app_name
description: App description
publish_to: none
version: 1.0.0+1

environment:
  sdk: '>=3.3.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

  # State & DI
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

  # Navigation
  go_router: ^14.2.7

  # Network
  dio: ^5.4.3+1

  # Serialization
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

  # Storage
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.3
  flutter_secure_storage: ^9.0.0

  # Firebase (add only what the project needs)
  firebase_core: ^3.7.0
  cloud_firestore: ^5.4.5
  firebase_auth: ^5.3.1
  firebase_messaging: ^15.1.4

  # UI
  flutter_screenutil: ^5.9.3
  flutter_svg: ^2.0.10+1
  flutter_spinkit: ^5.2.1

  # Utils
  intl: ^0.19.0
  package_info_plus: ^8.1.1
  url_launcher: ^6.3.0
  image_picker: ^1.1.2
  path_provider: ^2.1.4
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  build_runner: ^2.4.12
  riverpod_generator: ^2.4.3
  freezed: ^2.5.7
  json_serializable: ^6.8.0
  custom_lint: ^0.6.7
  riverpod_lint: ^2.3.13
  mocktail: ^1.0.4
  flutter_launcher_icons: ^0.14.1

flutter_launcher_icons:
  android: true
  ios: true
  remove_alpha_ios: true
  image_path: "assets/icons/app_icon.png"

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/
    - assets/svg/
  fonts:
    - family: 'ProductSans'
      fonts:
        - asset: assets/fonts/ProductSans-Regular.ttf
        - asset: assets/fonts/ProductSans-Bold.ttf
          weight: 700
        - asset: assets/fonts/ProductSans-BoldItalic.ttf
          weight: 700
          style: italic
```

---

> **Remember:** This document defines the *how*. The feature you build defines the *what*. Never let feature pressure compromise the *how*.
