// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_wizard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VehicleWizardController)
final vehicleWizardControllerProvider = VehicleWizardControllerProvider._();

final class VehicleWizardControllerProvider
    extends $NotifierProvider<VehicleWizardController, VehicleWizardState> {
  VehicleWizardControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehicleWizardControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehicleWizardControllerHash();

  @$internal
  @override
  VehicleWizardController create() => VehicleWizardController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VehicleWizardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VehicleWizardState>(value),
    );
  }
}

String _$vehicleWizardControllerHash() =>
    r'7154ef0812152fa852d14ca6f7e254bfec92fc8a';

abstract class _$VehicleWizardController extends $Notifier<VehicleWizardState> {
  VehicleWizardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<VehicleWizardState, VehicleWizardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VehicleWizardState, VehicleWizardState>,
              VehicleWizardState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
