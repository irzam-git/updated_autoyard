# 🚀 Project Startup & Onboarding Guide

Welcome to your new project! This guide walks you step-by-step through setting up, configuring, and adding new features to this boilerplate.

---

## 📋 Quick Setup Checklist for a New App

Follow these steps every time you spin up a new application from this boilerplate:

### 1. Rename the Project
Run the automated renaming script from the project root:
```bash
./scripts/rename_project.sh <new_project_name> <new_bundle_id>
```
**Example:**
```bash
./scripts/rename_project.sh fitness_tracker com.company.fitnesstracker
```
*This updates `pubspec.yaml`, all Dart `package:` imports, bundle identifiers, and re-runs code generation.*

---

### 2. Configure Brand & Design Tokens (5 minutes)
Customize your visual identity in `lib/core/design/`:

- **Colors** ([app_colors.dart](file:///Users/pixelz360/Desktop/boilerplate/start/lib/core/design/app_colors.dart)): Update `primary`, `primaryLight`, `primaryDark`, and background tokens.
- **Typography** ([app_typography.dart](file:///Users/pixelz360/Desktop/boilerplate/start/lib/core/design/app_typography.dart)): Set `fontFamily` (e.g. `'Poppins'`, `'Inter'`, or `'ProductSans'`).
- **Strings & App Title** ([app_strings.dart](file:///Users/pixelz360/Desktop/boilerplate/start/lib/core/constants/app_strings.dart)): Update `appName` and common text.

---

### 3. Replace Assets & App Icons
- **App Icons**: Replace `assets/icons/app_icon.png` (1024x1024 px) and run:
  ```bash
  flutter pub run flutter_launcher_icons
  ```
- **Images/SVGs**: Place graphics in `assets/images/` or `assets/svg/` and declare them in [app_assets.dart](file:///Users/pixelz360/Desktop/boilerplate/start/lib/core/constants/app_assets.dart).

---

### 4. Configure Backend URLs & Flavors
Set up your environment endpoints in [app_config.dart](file:///Users/pixelz360/Desktop/boilerplate/start/lib/core/config/app_config.dart).

To run with environment variables:
```bash
# Development
flutter run --dart-define=FLAVOR=dev --dart-define=BASE_URL=https://dev-api.example.com

# Production
flutter run --dart-define=FLAVOR=prod --dart-define=BASE_URL=https://api.example.com
```

---

## 🛠️ How to Add a New Feature (Recipe)

Every new feature lives in `lib/features/<feature_name>/` and follows this exact 3-layer architecture:

```
lib/features/<feature_name>/
├── data/
│   ├── <feature>_remote_datasource.dart   # Raw HTTP/Firebase calls via Dio
│   └── <feature>_repository_impl.dart      # Implements domain contract, handles errors
├── domain/
│   ├── models/
│   │   └── <entity>_model.dart             # Freezed immutable data model
│   └── <feature>_repository.dart           # Abstract repository interface
└── presentation/
    ├── controllers/
    │   └── <feature>_controller.dart       # Riverpod StateNotifier / Notifier
    └── screens/
        ├── <feature>_screen.dart           # Screen UI (using App* components)
        └── widgets/                        # Screen-specific sub-widgets
```

---

### Step-by-Step Feature Implementation:

#### Step 1: Create the Domain Model (`domain/models/product_model.dart`)
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String title,
    required double price,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
```

#### Step 2: Define Repository Contract (`domain/product_repository.dart`)
```dart
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import 'models/product_model.dart';

part 'product_repository.g.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}

@riverpod
ProductRepository productRepository(Ref ref) {
  throw UnimplementedError();
}
```

#### Step 3: Implement Data Layer (`data/product_repository_impl.dart`)
```dart
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/dio_client.dart';
import '../domain/models/product_model.dart';
import '../domain/product_repository.dart';

part 'product_repository_impl.g.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio _dio;
  ProductRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final res = await _dio.get('/products');
      final list = (res.data as List).map((e) => ProductModel.fromJson(e)).toList();
      return Right(list);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}

@riverpod
ProductRepository productRepositoryImpl(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return ProductRepositoryImpl(dio);
}
```

#### Step 4: Create Riverpod Controller (`presentation/controllers/product_controller.dart`)
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/product_repository_impl.dart';
import '../../domain/models/product_model.dart';

part 'product_controller.g.dart';

@riverpod
class ProductListController extends _$ProductListController {
  @override
  FutureOr<List<ProductModel>> build() async {
    return _fetch();
  }

  Future<List<ProductModel>> _fetch() async {
    final repo = ref.read(productRepositoryImplProvider);
    final result = await repo.getProducts();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (products) => products,
    );
  }
}
```

#### Step 5: Build UI Screen (`presentation/screens/products_screen.dart`)
> ⚠️ **Rule:** Never use raw `Text`, `ElevatedButton`, or `TextField`. Always use `App*` components.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../components/app_header.dart';
import '../../../../components/app_list_tile.dart';
import '../../../../components/app_empty_state.dart';
import '../controllers/product_controller.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productListControllerProvider);

    return Scaffold(
      appBar: const AppHeader(title: 'Products'),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => AppEmptyState(
          title: 'Error loading products',
          subtitle: err.toString(),
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(productListControllerProvider),
        ),
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, i) => AppListTile(
            title: products[i].title,
            subtitle: '\$${products[i].price.toStringAsFixed(2)}',
            showDivider: true,
          ),
        ),
      ),
    );
  }
}
```

#### Step 6: Register Route in GoRouter
1. Add constant to [app_routes.dart](file:///Users/pixelz360/Desktop/boilerplate/start/lib/core/router/app_routes.dart):
   ```dart
   static const String products = '/products';
   ```
2. Add `GoRoute` in [app_router.dart](file:///Users/pixelz360/Desktop/boilerplate/start/lib/core/router/app_router.dart).

---

## ⚡ Useful Development Commands

| Command | Description |
|---|---|
| `dart run build_runner watch` | Continuously generate `.g.dart` & `.freezed.dart` during dev |
| `dart run build_runner build --delete-conflicting-outputs` | Force one-time rebuild of all generated files |
| `flutter analyze` | Run static analysis & lint checks |
| `flutter test` | Run automated test suite |
| `./scripts/rename_project.sh <name>` | Rename the entire project package name |
