// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PickupDetailController)
final pickupDetailControllerProvider = PickupDetailControllerFamily._();

final class PickupDetailControllerProvider
    extends $NotifierProvider<PickupDetailController, PickupDetailState> {
  PickupDetailControllerProvider._({
    required PickupDetailControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'pickupDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pickupDetailControllerHash();

  @override
  String toString() {
    return r'pickupDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PickupDetailController create() => PickupDetailController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PickupDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PickupDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PickupDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pickupDetailControllerHash() =>
    r'9662a7d2fc421a359b84485260503dc5ea539306';

final class PickupDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PickupDetailController,
          PickupDetailState,
          PickupDetailState,
          PickupDetailState,
          int
        > {
  PickupDetailControllerFamily._()
    : super(
        retry: null,
        name: r'pickupDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PickupDetailControllerProvider call(int pickupId) =>
      PickupDetailControllerProvider._(argument: pickupId, from: this);

  @override
  String toString() => r'pickupDetailControllerProvider';
}

abstract class _$PickupDetailController extends $Notifier<PickupDetailState> {
  late final _$args = ref.$arg as int;
  int get pickupId => _$args;

  PickupDetailState build(int pickupId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PickupDetailState, PickupDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PickupDetailState, PickupDetailState>,
              PickupDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
