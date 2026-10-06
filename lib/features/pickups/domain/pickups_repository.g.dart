// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickups_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pickupsRepository)
final pickupsRepositoryProvider = PickupsRepositoryProvider._();

final class PickupsRepositoryProvider
    extends
        $FunctionalProvider<
          PickupsRepository,
          PickupsRepository,
          PickupsRepository
        >
    with $Provider<PickupsRepository> {
  PickupsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pickupsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pickupsRepositoryHash();

  @$internal
  @override
  $ProviderElement<PickupsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PickupsRepository create(Ref ref) {
    return pickupsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PickupsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PickupsRepository>(value),
    );
  }
}

String _$pickupsRepositoryHash() => r'4b55b4dff39d302aa39d13e88e3801283b8de54a';
