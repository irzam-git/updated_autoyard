// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_pickups_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AssignedPickupsController)
final assignedPickupsControllerProvider = AssignedPickupsControllerProvider._();

final class AssignedPickupsControllerProvider
    extends $NotifierProvider<AssignedPickupsController, AssignedPickupsState> {
  AssignedPickupsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assignedPickupsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assignedPickupsControllerHash();

  @$internal
  @override
  AssignedPickupsController create() => AssignedPickupsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AssignedPickupsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AssignedPickupsState>(value),
    );
  }
}

String _$assignedPickupsControllerHash() =>
    r'd0bd6a4aab01556dd8f26acf2b538ccd1d5c3e74';

abstract class _$AssignedPickupsController
    extends $Notifier<AssignedPickupsState> {
  AssignedPickupsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AssignedPickupsState, AssignedPickupsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AssignedPickupsState, AssignedPickupsState>,
              AssignedPickupsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
