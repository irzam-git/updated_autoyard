// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inventoryRepositoryImpl)
final inventoryRepositoryImplProvider = InventoryRepositoryImplProvider._();

final class InventoryRepositoryImplProvider
    extends
        $FunctionalProvider<
          InventoryRepositoryImpl,
          InventoryRepositoryImpl,
          InventoryRepositoryImpl
        >
    with $Provider<InventoryRepositoryImpl> {
  InventoryRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<InventoryRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InventoryRepositoryImpl create(Ref ref) {
    return inventoryRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryRepositoryImpl>(value),
    );
  }
}

String _$inventoryRepositoryImplHash() =>
    r'7ae6f6459e2ce6915ccce3fe31658652deb00935';
