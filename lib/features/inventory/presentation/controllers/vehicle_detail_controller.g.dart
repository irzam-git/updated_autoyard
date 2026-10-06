// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VehicleDetailController)
final vehicleDetailControllerProvider = VehicleDetailControllerFamily._();

final class VehicleDetailControllerProvider
    extends $NotifierProvider<VehicleDetailController, VehicleDetailState> {
  VehicleDetailControllerProvider._({
    required VehicleDetailControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'vehicleDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vehicleDetailControllerHash();

  @override
  String toString() {
    return r'vehicleDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  VehicleDetailController create() => VehicleDetailController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VehicleDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VehicleDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VehicleDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vehicleDetailControllerHash() =>
    r'6650e75c680ef1d066f57ed523eccdf7827dda33';

final class VehicleDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          VehicleDetailController,
          VehicleDetailState,
          VehicleDetailState,
          VehicleDetailState,
          int
        > {
  VehicleDetailControllerFamily._()
    : super(
        retry: null,
        name: r'vehicleDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VehicleDetailControllerProvider call(int vehicleId) =>
      VehicleDetailControllerProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'vehicleDetailControllerProvider';
}

abstract class _$VehicleDetailController extends $Notifier<VehicleDetailState> {
  late final _$args = ref.$arg as int;
  int get vehicleId => _$args;

  VehicleDetailState build(int vehicleId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<VehicleDetailState, VehicleDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VehicleDetailState, VehicleDetailState>,
              VehicleDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
