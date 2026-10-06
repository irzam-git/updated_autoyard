import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../pickups/domain/models/brand_model.dart';
import '../../../pickups/domain/models/vehicle_model_option.dart';
import '../../data/inventory_repository_impl.dart';
import 'inventory_controller.dart';

part 'vehicle_wizard_controller.freezed.dart';
part 'vehicle_wizard_controller.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class VehicleWizardState with _$VehicleWizardState {
  const factory VehicleWizardState({
    @Default(0) int currentStep,
    @Default(false) bool isLoadingBrands,
    @Default(false) bool isLoadingModels,
    @Default(false) bool isLoadingLookup,
    @Default(false) bool isSubmitting,
    @Default(<BrandModel>[]) List<BrandModel> brands,
    @Default(<VehicleModelOption>[]) List<VehicleModelOption> models,

    // Step 1: Technical specs
    int? selectedBrandId,
    int? selectedModelId,
    @Default('') String registrationNumber,
    @Default('NSW') String registrationState,
    @Default('') String vinNumber,
    @Default('') String year,
    @Default('') String engineSize,
    @Default('') String engineNumber,
    @Default('Auto') String transmission,
    @Default('SEDAN') String bodyType,
    @Default('') String variant,
    @Default('') String built,
    @Default('') String odometer,

    // Step 2: Seller & Pickup
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phoneNumber,
    @Default('') String abnNumber,
    @Default('') String businessName,
    @Default('') String licenseNumber,
    @Default('') String pickupDate,
    @Default('') String dateOfBirth,
    @Default('') String pickupAddress,
    @Default('') String residentialAddress,
    @Default(true) bool samePickupAddress,

    // Step 3: Condition & Signatures
    @Default(true) bool isDrivable,
    @Default(false) bool isAccidental,
    @Default(false) bool isWovi,
    @Default(false) bool isUnderFinance,
    @Default('') String price,
    @Default('Cash') String paymentMethod,
    @Default('') String note,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
    @Default(true) bool termsAgreed,

    String? errorMessage,
    String? successMessage,
  }) = _VehicleWizardState;
}

@riverpod
class VehicleWizardController extends _$VehicleWizardController {
  @override
  VehicleWizardState build() {
    Future.microtask(() => loadBrands());
    return const VehicleWizardState();
  }

  Future<void> loadBrands() async {
    state = state.copyWith(isLoadingBrands: true);
    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.getBrands();

    state = result.fold(
      (failure) => state.copyWith(isLoadingBrands: false, errorMessage: failure.message),
      (brands) => state.copyWith(isLoadingBrands: false, brands: brands),
    );
  }

  Future<void> selectBrand(int brandId, {String? targetModelName, int? targetModelId}) async {
    state = state.copyWith(
      selectedBrandId: brandId,
      selectedModelId: null,
      isLoadingModels: true,
    );

    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.getModels(brandId);

    state = result.fold(
      (failure) => state.copyWith(isLoadingModels: false),
      (models) {
        int? matchedModelId = targetModelId;
        if (matchedModelId == null && targetModelName != null && targetModelName.trim().isNotEmpty) {
          final target = targetModelName.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
          final found = models.where((m) {
            final mName = m.name.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
            return mName == target || mName.contains(target) || target.contains(mName);
          });
          if (found.isNotEmpty) {
            matchedModelId = found.first.id;
          }
        }

        return state.copyWith(
          isLoadingModels: false,
          models: models,
          selectedModelId: matchedModelId,
        );
      },
    );
  }

  void selectModel(int modelId) {
    state = state.copyWith(selectedModelId: modelId);
  }

  Future<bool> lookupByRego(String rego, String regoState) async {
    if (rego.trim().isEmpty) return false;
    state = state.copyWith(isLoadingLookup: true, errorMessage: null);

    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.lookupVehicleByRego(
      regoNumber: rego.trim(),
      state: regoState,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoadingLookup: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (lookup) {
        int? matchedBrandId = lookup.brandId ?? state.selectedBrandId;
        if (matchedBrandId == null && lookup.make != null && lookup.make!.isNotEmpty) {
          final targetMake = lookup.make!.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
          final found = state.brands.where(
            (b) => b.name.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '') == targetMake,
          );
          if (found.isNotEmpty) {
            matchedBrandId = found.first.id;
          }
        }

        String? trans = lookup.transmission;
        if (trans != null && trans.isNotEmpty) {
          if (trans.toLowerCase().contains('manual')) {
            trans = 'Manual';
          } else if (trans.toLowerCase().contains('auto') || trans.toLowerCase().contains('cvt') || trans.toLowerCase().contains('reduction')) {
            trans = 'Auto';
          }
        }

        state = state.copyWith(
          isLoadingLookup: false,
          registrationNumber: lookup.registrationNumber ?? rego.trim().toUpperCase(),
          registrationState: lookup.registrationState ?? regoState,
          vinNumber: lookup.vin ?? state.vinNumber,
          year: (lookup.year != null && lookup.year!.isNotEmpty) ? lookup.year! : state.year,
          engineSize: (lookup.engineSize != null && lookup.engineSize!.isNotEmpty) ? lookup.engineSize! : state.engineSize,
          engineNumber: (lookup.engineNumber != null && lookup.engineNumber!.isNotEmpty) ? lookup.engineNumber! : state.engineNumber,
          variant: (lookup.variant != null && lookup.variant!.isNotEmpty) ? lookup.variant! : state.variant,
          transmission: (trans != null && trans.isNotEmpty) ? trans : state.transmission,
          bodyType: (lookup.bodyType != null && lookup.bodyType!.trim().isNotEmpty)
              ? lookup.bodyType!.trim().toUpperCase()
              : state.bodyType,
          selectedBrandId: matchedBrandId,
          successMessage: 'Vehicle details auto-filled for $rego',
        );

        if (matchedBrandId != null) {
          selectBrand(
            matchedBrandId,
            targetModelName: lookup.model,
            targetModelId: lookup.modelId,
          );
        }

        return true;
      },
    );
  }

  Future<bool> decodeVin(String vin) async {
    if (vin.trim().isEmpty) return false;
    state = state.copyWith(isLoadingLookup: true, errorMessage: null);

    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.decodeVin(vin.trim());

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoadingLookup: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (lookup) {
        int? matchedBrandId = lookup.brandId ?? state.selectedBrandId;
        if (matchedBrandId == null && lookup.make != null && lookup.make!.isNotEmpty) {
          final targetMake = lookup.make!.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
          final found = state.brands.where(
            (b) => b.name.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '') == targetMake,
          );
          if (found.isNotEmpty) {
            matchedBrandId = found.first.id;
          }
        }

        String? trans = lookup.transmission;
        if (trans != null && trans.isNotEmpty) {
          if (trans.toLowerCase().contains('manual')) {
            trans = 'Manual';
          } else if (trans.toLowerCase().contains('auto') || trans.toLowerCase().contains('cvt') || trans.toLowerCase().contains('reduction')) {
            trans = 'Auto';
          }
        }

        state = state.copyWith(
          isLoadingLookup: false,
          vinNumber: lookup.vin ?? vin.trim().toUpperCase(),
          year: (lookup.year != null && lookup.year!.isNotEmpty) ? lookup.year! : state.year,
          engineSize: (lookup.engineSize != null && lookup.engineSize!.isNotEmpty) ? lookup.engineSize! : state.engineSize,
          engineNumber: (lookup.engineNumber != null && lookup.engineNumber!.isNotEmpty) ? lookup.engineNumber! : state.engineNumber,
          variant: (lookup.variant != null && lookup.variant!.isNotEmpty) ? lookup.variant! : state.variant,
          transmission: (trans != null && trans.isNotEmpty) ? trans : state.transmission,
          bodyType: (lookup.bodyType != null && lookup.bodyType!.trim().isNotEmpty)
              ? lookup.bodyType!.trim().toUpperCase()
              : state.bodyType,
          selectedBrandId: matchedBrandId,
          successMessage: 'VIN successfully decoded!',
        );

        if (matchedBrandId != null) {
          selectBrand(
            matchedBrandId,
            targetModelName: lookup.model,
            targetModelId: lookup.modelId,
          );
        }

        return true;
      },
    );
  }

  void updateStep1({
    int? brandId,
    int? modelId,
    String? regoNumber,
    String? regoState,
    String? vinNumber,
    String? year,
    String? engineSize,
    String? engineNumber,
    String? transmission,
    String? bodyType,
    String? variant,
    String? built,
    String? odometer,
  }) {
    state = state.copyWith(
      selectedBrandId: brandId ?? state.selectedBrandId,
      selectedModelId: modelId ?? state.selectedModelId,
      registrationNumber: regoNumber ?? state.registrationNumber,
      registrationState: regoState ?? state.registrationState,
      vinNumber: vinNumber ?? state.vinNumber,
      year: year ?? state.year,
      engineSize: engineSize ?? state.engineSize,
      engineNumber: engineNumber ?? state.engineNumber,
      transmission: transmission ?? state.transmission,
      bodyType: bodyType ?? state.bodyType,
      variant: variant ?? state.variant,
      built: built ?? state.built,
      odometer: odometer ?? state.odometer,
    );
  }

  void updateStep2({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? abnNumber,
    String? businessName,
    String? licenseNumber,
    String? pickupDate,
    String? dateOfBirth,
    String? pickupAddress,
    String? residentialAddress,
    bool? samePickupAddress,
  }) {
    state = state.copyWith(
      firstName: firstName ?? state.firstName,
      lastName: lastName ?? state.lastName,
      phoneNumber: phoneNumber ?? state.phoneNumber,
      abnNumber: abnNumber ?? state.abnNumber,
      businessName: businessName ?? state.businessName,
      licenseNumber: licenseNumber ?? state.licenseNumber,
      pickupDate: pickupDate ?? state.pickupDate,
      dateOfBirth: dateOfBirth ?? state.dateOfBirth,
      pickupAddress: pickupAddress ?? state.pickupAddress,
      residentialAddress: residentialAddress ?? state.residentialAddress,
      samePickupAddress: samePickupAddress ?? state.samePickupAddress,
    );
  }

  void updateStep3({
    bool? isDrivable,
    bool? isAccidental,
    bool? isWovi,
    bool? isUnderFinance,
    String? price,
    String? paymentMethod,
    String? note,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
    bool? termsAgreed,
  }) {
    state = state.copyWith(
      isDrivable: isDrivable ?? state.isDrivable,
      isAccidental: isAccidental ?? state.isAccidental,
      isWovi: isWovi ?? state.isWovi,
      isUnderFinance: isUnderFinance ?? state.isUnderFinance,
      price: price ?? state.price,
      paymentMethod: paymentMethod ?? state.paymentMethod,
      note: note ?? state.note,
      ownerSignaturePath: ownerSignaturePath ?? state.ownerSignaturePath,
      buyerSignaturePath: buyerSignaturePath ?? state.buyerSignaturePath,
      termsAgreed: termsAgreed ?? state.termsAgreed,
    );
  }

  void setStep(int step) {
    if (step >= 0 && step <= 2) {
      state = state.copyWith(currentStep: step);
    }
  }

  void nextStep() {
    if (state.currentStep < 2) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void prevStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  Future<bool> submitVehicle() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null, successMessage: null);

    final conditionJson = jsonEncode({
      'drivable': state.isDrivable ? 'yes' : 'no',
      'accidental': state.isAccidental ? 'yes' : 'no',
      'wovi': state.isWovi ? 'yes' : 'no',
      'under_finance': state.isUnderFinance ? 'yes' : 'no',
    });

    final payload = <String, dynamic>{
      'step': '3',
      'brand': state.selectedBrandId?.toString() ?? '1',
      'model': state.selectedModelId?.toString() ?? '1',
      'year': state.year.isNotEmpty ? state.year : '2020',
      'registration_number': state.registrationNumber,
      'registration_date': state.pickupDate.isNotEmpty ? state.pickupDate : '2024-01-01',
      'registration_state': state.registrationState,
      'engine_size': state.engineSize.isNotEmpty ? state.engineSize : '2.0L',
      'engine_number': state.engineNumber.isNotEmpty ? state.engineNumber : 'ENG123456',
      'vin_number': state.vinNumber.isNotEmpty ? state.vinNumber : 'VIN12345678901234',
      'transmission': state.transmission,
      'body_type': state.bodyType,
      'variant': state.variant.isNotEmpty ? state.variant : 'Standard',
      'built': state.built.isNotEmpty ? state.built : '01/2024',
      'odometer': state.odometer.isNotEmpty ? state.odometer : '10000',
      'first_name': state.firstName.isNotEmpty ? state.firstName : 'Owner',
      'last_name': state.lastName.isNotEmpty ? state.lastName : 'Name',
      'abn_number': state.abnNumber,
      'business_name': state.businessName,
      'phone_number': state.phoneNumber.isNotEmpty ? state.phoneNumber : '0400000000',
      'license_number': state.licenseNumber.isNotEmpty ? state.licenseNumber : 'LIC12345',
      'pickup_date': state.pickupDate.isNotEmpty ? state.pickupDate : '2026-10-06',
      'date_of_birth': state.dateOfBirth.isNotEmpty ? state.dateOfBirth : '1990-01-01',
      'pickup_address': state.pickupAddress.isNotEmpty ? state.pickupAddress : '123 Main Street',
      'residential_address': state.residentialAddress.isNotEmpty ? state.residentialAddress : state.pickupAddress,
      'same_pickup_address': state.samePickupAddress ? '1' : '0',
      'vehicle_condition': conditionJson,
      'note': state.note,
      'price': state.price.isNotEmpty ? state.price : '1000',
      'payment_method': state.paymentMethod,
      'terms': state.termsAgreed ? 'true' : 'false',
    };

    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.createVehicle(
      data: payload,
      ownerSignaturePath: state.ownerSignaturePath,
      buyerSignaturePath: state.buyerSignaturePath,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          isSubmitting: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (msg) {
        state = state.copyWith(
          isSubmitting: false,
          successMessage: msg,
        );
        // Refresh inventory list
        ref.read(inventoryControllerProvider.notifier).fetchVehicles(refresh: true);
        return true;
      },
    );
  }
}
