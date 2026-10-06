// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipt_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PurchaseReceiptController)
final purchaseReceiptControllerProvider = PurchaseReceiptControllerFamily._();

final class PurchaseReceiptControllerProvider
    extends $NotifierProvider<PurchaseReceiptController, PurchaseReceiptState> {
  PurchaseReceiptControllerProvider._({
    required PurchaseReceiptControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'purchaseReceiptControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$purchaseReceiptControllerHash();

  @override
  String toString() {
    return r'purchaseReceiptControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PurchaseReceiptController create() => PurchaseReceiptController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PurchaseReceiptState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PurchaseReceiptState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PurchaseReceiptControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$purchaseReceiptControllerHash() =>
    r'198a854a9564d6bbd2f99a1e1d61e70bab78b1a4';

final class PurchaseReceiptControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PurchaseReceiptController,
          PurchaseReceiptState,
          PurchaseReceiptState,
          PurchaseReceiptState,
          int
        > {
  PurchaseReceiptControllerFamily._()
    : super(
        retry: null,
        name: r'purchaseReceiptControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PurchaseReceiptControllerProvider call(int vehicleId) =>
      PurchaseReceiptControllerProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'purchaseReceiptControllerProvider';
}

abstract class _$PurchaseReceiptController
    extends $Notifier<PurchaseReceiptState> {
  late final _$args = ref.$arg as int;
  int get vehicleId => _$args;

  PurchaseReceiptState build(int vehicleId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PurchaseReceiptState, PurchaseReceiptState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PurchaseReceiptState, PurchaseReceiptState>,
              PurchaseReceiptState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
