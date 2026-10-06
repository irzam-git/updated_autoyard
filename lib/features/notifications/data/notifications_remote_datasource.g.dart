// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationsRemoteDataSource)
final notificationsRemoteDataSourceProvider =
    NotificationsRemoteDataSourceProvider._();

final class NotificationsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          NotificationsRemoteDataSource,
          NotificationsRemoteDataSource,
          NotificationsRemoteDataSource
        >
    with $Provider<NotificationsRemoteDataSource> {
  NotificationsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<NotificationsRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationsRemoteDataSource create(Ref ref) {
    return notificationsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationsRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$notificationsRemoteDataSourceHash() =>
    r'd493e8bf49659409c0711aba121b0f9df384a9a2';
