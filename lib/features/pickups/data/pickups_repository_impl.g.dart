// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickups_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pickupsRepositoryImpl)
final pickupsRepositoryImplProvider = PickupsRepositoryImplProvider._();

final class PickupsRepositoryImplProvider
    extends
        $FunctionalProvider<
          PickupsRepositoryImpl,
          PickupsRepositoryImpl,
          PickupsRepositoryImpl
        >
    with $Provider<PickupsRepositoryImpl> {
  PickupsRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pickupsRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pickupsRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<PickupsRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PickupsRepositoryImpl create(Ref ref) {
    return pickupsRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PickupsRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PickupsRepositoryImpl>(value),
    );
  }
}

String _$pickupsRepositoryImplHash() =>
    r'9f8cc21da37edaeb8cb0ec5303f78a2af8935727';
