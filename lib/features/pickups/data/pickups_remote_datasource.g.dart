// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickups_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pickupsRemoteDataSource)
final pickupsRemoteDataSourceProvider = PickupsRemoteDataSourceProvider._();

final class PickupsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          PickupsRemoteDataSource,
          PickupsRemoteDataSource,
          PickupsRemoteDataSource
        >
    with $Provider<PickupsRemoteDataSource> {
  PickupsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pickupsRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pickupsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<PickupsRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PickupsRemoteDataSource create(Ref ref) {
    return pickupsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PickupsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PickupsRemoteDataSource>(value),
    );
  }
}

String _$pickupsRemoteDataSourceHash() =>
    r'122f2aec963a1ba0bb271afc0a33b5ab8a5fd1e0';
