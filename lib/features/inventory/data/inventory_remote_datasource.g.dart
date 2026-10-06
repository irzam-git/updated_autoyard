// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inventoryRemoteDataSource)
final inventoryRemoteDataSourceProvider = InventoryRemoteDataSourceProvider._();

final class InventoryRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          InventoryRemoteDataSource,
          InventoryRemoteDataSource,
          InventoryRemoteDataSource
        >
    with $Provider<InventoryRemoteDataSource> {
  InventoryRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<InventoryRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InventoryRemoteDataSource create(Ref ref) {
    return inventoryRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryRemoteDataSource>(value),
    );
  }
}

String _$inventoryRemoteDataSourceHash() =>
    r'1f1a06168ae26630b7908f4a298d3862d438cf4a';
