import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import '../../../../components/app_bounce.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_header.dart';
import '../../../../components/app_snackbar.dart';
import '../../../../components/app_text_field.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_shadows.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../controllers/vehicle_wizard_controller.dart';
import '../widgets/month_year_picker_sheet.dart';

class VehicleWizardScreen extends ConsumerStatefulWidget {
  const VehicleWizardScreen({super.key});

  @override
  ConsumerState<VehicleWizardScreen> createState() => _VehicleWizardScreenState();
}

class _VehicleWizardScreenState extends ConsumerState<VehicleWizardScreen> {
  // Step 1 Controllers
  final _regoController = TextEditingController();
  final _vinController = TextEditingController();
  final _yearController = TextEditingController();
  final _engineSizeController = TextEditingController();
  final _engineNumberController = TextEditingController();
  final _variantController = TextEditingController();
  final _builtController = TextEditingController();
  final _odometerController = TextEditingController();

  // Step 2 Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _abnController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _licenseController = TextEditingController();
  final _pickupDateController = TextEditingController();
  final _dobController = TextEditingController();
  final _pickupAddressController = TextEditingController();
  final _residentialAddressController = TextEditingController();

  // Step 3 Controllers
  final _priceController = TextEditingController();
  final _notesController = TextEditingController();

  // Signature Controllers
  late final SignatureController _sellerSignatureController;
  late final SignatureController _driverSignatureController;

  final List<String> _australianStates = ['NSW', 'VIC', 'QLD', 'SA', 'WA', 'TAS', 'NT', 'ACT'];
  final List<String> _bodyTypes = [
    'SEDAN',
    'HATCHBACK',
    'SUV',
    'WAGON',
    'COUPE',
    'UTE',
    'VAN',
    'CONVERTIBLE',
    'LIGHT TRUCK',
    'TRUCK',
    'CAB CHASSIS',
    'COMMERCIAL',
    'OTHER',
  ];

  @override
  void initState() {
    super.initState();
    _sellerSignatureController = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent,
    );
    _driverSignatureController = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent,
    );
  }

  @override
  void dispose() {
    _regoController.dispose();
    _vinController.dispose();
    _yearController.dispose();
    _engineSizeController.dispose();
    _engineNumberController.dispose();
    _variantController.dispose();
    _builtController.dispose();
    _odometerController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _abnController.dispose();
    _businessNameController.dispose();
    _licenseController.dispose();
    _pickupDateController.dispose();
    _dobController.dispose();
    _pickupAddressController.dispose();
    _residentialAddressController.dispose();
    _priceController.dispose();
    _notesController.dispose();
    _sellerSignatureController.dispose();
    _driverSignatureController.dispose();
    super.dispose();
  }

  void _populateControllersFromState(VehicleWizardState updated) {
    if (updated.registrationNumber.isNotEmpty) _regoController.text = updated.registrationNumber;
    if (updated.vinNumber.isNotEmpty) _vinController.text = updated.vinNumber;
    if (updated.year.isNotEmpty) _yearController.text = updated.year;
    if (updated.engineSize.isNotEmpty) _engineSizeController.text = updated.engineSize;
    if (updated.engineNumber.isNotEmpty) _engineNumberController.text = updated.engineNumber;
    if (updated.variant.isNotEmpty) _variantController.text = updated.variant;
    if (updated.built.isNotEmpty) _builtController.text = updated.built;
    if (updated.odometer.isNotEmpty) _odometerController.text = updated.odometer;
  }

  Future<void> _handleRegoLookup() async {
    final rego = _regoController.text.trim();
    if (rego.isEmpty) {
      AppSnackBar.show(context, message: 'Please enter a registration plate', type: SnackBarType.warning);
      return;
    }
    context.hideKeyboard();

    final state = ref.read(vehicleWizardControllerProvider);
    final success = await ref
        .read(vehicleWizardControllerProvider.notifier)
        .lookupByRego(rego, state.registrationState);

    if (!mounted) return;

    if (success) {
      final updated = ref.read(vehicleWizardControllerProvider);
      _populateControllersFromState(updated);
      AppSnackBar.show(context, message: 'Vehicle details auto-filled for $rego', type: SnackBarType.success);
    } else {
      final err = ref.read(vehicleWizardControllerProvider).errorMessage;
      AppSnackBar.show(context, message: err ?? 'Rego lookup failed', type: SnackBarType.error);
    }
  }

  Future<void> _handleVinDecoder() async {
    final vin = _vinController.text.trim();
    if (vin.isEmpty) {
      AppSnackBar.show(context, message: 'Please enter a VIN number', type: SnackBarType.warning);
      return;
    }
    context.hideKeyboard();

    final success = await ref.read(vehicleWizardControllerProvider.notifier).decodeVin(vin);
    if (!mounted) return;

    if (success) {
      final updated = ref.read(vehicleWizardControllerProvider);
      _populateControllersFromState(updated);
      AppSnackBar.show(context, message: 'VIN decoded successfully!', type: SnackBarType.success);
    } else {
      final err = ref.read(vehicleWizardControllerProvider).errorMessage;
      AppSnackBar.show(context, message: err ?? 'VIN decoder failed', type: SnackBarType.error);
    }
  }

  Future<void> _selectBuiltDate() async {
    context.hideKeyboard();
    final year = int.tryParse(_yearController.text.trim());

    await MonthYearPickerSheet.show(
      context: context,
      initialValue: _builtController.text.trim(),
      fallbackYear: year,
      onSelected: (val) {
        setState(() {
          _builtController.text = val;
        });
        ref.read(vehicleWizardControllerProvider.notifier).updateStep1(built: val);
      },
    );
  }

  Future<void> _selectPickupDate() async {
    context.hideKeyboard();
    DateTime initial = DateTime.now();
    if (_pickupDateController.text.trim().isNotEmpty) {
      final parsed = DateTime.tryParse(_pickupDateController.text.trim());
      if (parsed != null) initial = parsed;
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: 'SELECT PICKUP DATE',
    );

    if (picked != null) {
      final formatted = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      setState(() {
        _pickupDateController.text = formatted;
      });
      ref.read(vehicleWizardControllerProvider.notifier).updateStep2(pickupDate: formatted);
    }
  }

  Future<void> _handleSubmit() async {
    context.hideKeyboard();

    if (_sellerSignatureController.isEmpty || _driverSignatureController.isEmpty) {
      AppSnackBar.show(
        context,
        message: 'Please provide both Seller and Driver/Buyer signatures before submitting.',
        type: SnackBarType.warning,
      );
      return;
    }

    // Export signatures to temporary files
    String? sellerSigPath;
    String? buyerSigPath;

    if (_sellerSignatureController.isNotEmpty) {
      final bytes = await _sellerSignatureController.toPngBytes();
      if (bytes != null) {
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/seller_sig_${DateTime.now().millisecondsSinceEpoch}.png');
        await file.writeAsBytes(bytes);
        sellerSigPath = file.path;
      }
    }

    if (_driverSignatureController.isNotEmpty) {
      final bytes = await _driverSignatureController.toPngBytes();
      if (bytes != null) {
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/buyer_sig_${DateTime.now().millisecondsSinceEpoch}.png');
        await file.writeAsBytes(bytes);
        buyerSigPath = file.path;
      }
    }

    // Synchronize all controller text fields into state
    ref.read(vehicleWizardControllerProvider.notifier).updateStep1(
          regoNumber: _regoController.text.trim(),
          vinNumber: _vinController.text.trim(),
          year: _yearController.text.trim(),
          engineSize: _engineSizeController.text.trim(),
          engineNumber: _engineNumberController.text.trim(),
          variant: _variantController.text.trim(),
          built: _builtController.text.trim(),
          odometer: _odometerController.text.trim(),
        );

    ref.read(vehicleWizardControllerProvider.notifier).updateStep2(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          phoneNumber: _phoneController.text.trim(),
          abnNumber: _abnController.text.trim(),
          businessName: _businessNameController.text.trim(),
          licenseNumber: _licenseController.text.trim(),
          pickupDate: _pickupDateController.text.trim(),
          dateOfBirth: _dobController.text.trim(),
          pickupAddress: _pickupAddressController.text.trim(),
          residentialAddress: _residentialAddressController.text.trim(),
        );

    ref.read(vehicleWizardControllerProvider.notifier).updateStep3(
          price: _priceController.text.trim(),
          note: _notesController.text.trim(),
          ownerSignaturePath: sellerSigPath,
          buyerSignaturePath: buyerSigPath,
        );

    final success = await ref.read(vehicleWizardControllerProvider.notifier).submitVehicle();

    if (!mounted) return;

    if (success) {
      AppSnackBar.show(
        context,
        message: 'Vehicle purchased & added to inventory!',
        type: SnackBarType.success,
      );
      context.pop();
    } else {
      final err = ref.read(vehicleWizardControllerProvider).errorMessage;
      AppSnackBar.show(
        context,
        message: err ?? 'Failed to submit vehicle',
        type: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final state = ref.watch(vehicleWizardControllerProvider);
    final controller = ref.read(vehicleWizardControllerProvider.notifier);

    final stepLabels = ['Specs & Rego', 'Seller & Location', 'Valuation & Sign'];

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppHeader(
        title: 'Buy Vehicle',
        subtitle: 'Step ${state.currentStep + 1} of 3: ${stepLabels[state.currentStep]}',
        showBackButton: true,
        onBack: () {
          if (state.currentStep > 0) {
            controller.prevStep();
          } else {
            context.pop();
          }
        },
      ),
      body: Column(
        children: [
          // Step Progress Bar
          _buildStepHeader(state.currentStep, isDark),

          // Main Step Form Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
              child: _buildCurrentStepView(state, controller, isDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepHeader(int currentStep, bool isDark) {
    final stepTitles = ['Specs & Rego', 'Seller Info', 'Valuation & Sign'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 14),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: Border(
          bottom: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
        ),
      ),
      child: Row(
        children: List.generate(3, (index) {
          final isPassed = index < currentStep;
          final isCurrent = index == currentStep;

          return Expanded(
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: isCurrent || isPassed ? AppColors.primaryGradient : null,
                    color: !isCurrent && !isPassed
                        ? (isDark ? AppColors.cardDark : AppColors.backgroundLight)
                        : null,
                    shape: BoxShape.circle,
                    boxShadow: isCurrent ? AppShadows.primaryGlow : null,
                    border: Border.all(
                      color: isCurrent || isPassed
                          ? Colors.transparent
                          : (isDark ? AppColors.borderDark : AppColors.borderLight),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: isPassed
                        ? const Icon(Icons.check_rounded, size: 16, color: AppColors.white)
                        : Text(
                            '${index + 1}',
                            style: AppTypography.caption.copyWith(
                              fontWeight: FontWeight.w800,
                              color: isCurrent ? AppColors.white : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    stepTitles[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.caption.copyWith(
                      fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
                      color: isCurrent
                          ? AppColors.primary
                          : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                    ),
                  ),
                ),
                if (index < 2)
                  Container(
                    width: 16,
                    height: 2,
                    decoration: BoxDecoration(
                      color: isPassed ? AppColors.primary : (isDark ? AppColors.borderDark : AppColors.borderLight),
                      borderRadius: BorderRadius.circular(1),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCurrentStepView(
    VehicleWizardState state,
    VehicleWizardController controller,
    bool isDark,
  ) {
    switch (state.currentStep) {
      case 0:
        return _buildStep1Technical(state, controller, isDark);
      case 1:
        return _buildStep2Seller(state, controller, isDark);
      case 2:
      default:
        return _buildStep3Condition(state, controller, isDark);
    }
  }

  // --- STEP 1: TECHNICAL SPECS & LOOKUP ---
  Widget _buildStep1Technical(
    VehicleWizardState state,
    VehicleWizardController controller,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Instant Rego Lookup Box
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: AppRadius.cardLg,
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            boxShadow: isDark ? AppShadows.darkCard : AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: AppShadows.primaryGlow,
                    ),
                    child: const Icon(Icons.flash_on_rounded, color: AppColors.white, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Instant Rego Auto-Fill',
                    style: AppTypography.h5.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Fetch vehicle specs directly from Australian transport registry.',
                style: AppTypography.caption.copyWith(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppTextField(
                      label: 'Rego Plate',
                      hint: 'e.g. 4H5AN',
                      controller: _regoController,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State',
                          style: AppTypography.labelSm.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Builder(
                          builder: (context) {
                            final currentRegoState = state.registrationState.trim().toUpperCase();
                            final regoStates = <String>{
                              ..._australianStates,
                              if (currentRegoState.isNotEmpty) currentRegoState,
                            }.toList();
                            final selectedState = regoStates.contains(currentRegoState)
                                ? currentRegoState
                                : regoStates.first;

                            return Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
                                borderRadius: AppRadius.input,
                                border: Border.all(
                                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedState,
                                  isExpanded: true,
                                  dropdownColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                                  items: regoStates.map((s) {
                                    return DropdownMenuItem(value: s, child: Text(s, style: const TextStyle(fontWeight: FontWeight.w600)));
                                  }).toList(),
                                  onChanged: (val) {
                                    if (val != null) {
                                      controller.updateStep1(regoState: val);
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                label: state.isLoadingLookup ? 'Querying Registry...' : 'Auto-Fill Details',
                isLoading: state.isLoadingLookup,
                variant: ButtonVariant.primary,
                icon: const Icon(Icons.search_rounded, size: 18, color: Colors.white),
                onPressed: _handleRegoLookup,
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // VIN Number with Decoder
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: AppRadius.card,
            border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
            boxShadow: isDark ? AppShadows.darkCard : AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'VIN Number',
                      hint: '17-character VIN',
                      controller: _vinController,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  SizedBox(
                    height: 48,
                    child: AppBounce(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        onPressed: _handleVinDecoder,
                        icon: const Icon(Icons.qr_code_scanner_rounded, size: 16),
                        label: const Text('Decode', style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Cascading Brand & Model Dropdowns
              Text(
                'Make / Brand',
                style: AppTypography.labelSm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Builder(
                builder: (context) {
                  final isValidBrand = state.selectedBrandId != null &&
                      state.brands.any((b) => b.id == state.selectedBrandId);
                  return Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
                      borderRadius: AppRadius.input,
                      border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: isValidBrand ? state.selectedBrandId : null,
                        hint: const Text('Select Brand / Make'),
                        isExpanded: true,
                        dropdownColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                        items: state.brands.map((b) {
                          return DropdownMenuItem(value: b.id, child: Text(b.name, style: const TextStyle(fontWeight: FontWeight.w600)));
                        }).toList(),
                        onChanged: (brandId) {
                          if (brandId != null) {
                            controller.selectBrand(brandId);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.md),

              Text(
                'Model',
                style: AppTypography.labelSm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Builder(
                builder: (context) {
                  final isValidModel = state.selectedModelId != null &&
                      state.models.any((m) => m.id == state.selectedModelId);
                  return Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
                      borderRadius: AppRadius.input,
                      border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: isValidModel ? state.selectedModelId : null,
                        hint: Text(state.isLoadingModels ? 'Loading models...' : 'Select Model'),
                        isExpanded: true,
                        dropdownColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                        items: state.models.map((m) {
                          return DropdownMenuItem(value: m.id, child: Text(m.name, style: const TextStyle(fontWeight: FontWeight.w600)));
                        }).toList(),
                        onChanged: (modelId) {
                          if (modelId != null) {
                            controller.selectModel(modelId);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.md),

              // Specs Grid
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Year',
                      hint: '2022',
                      controller: _yearController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: AppTextField(
                      label: 'Odometer (km)',
                      hint: '45000',
                      controller: _odometerController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Engine Size',
                      hint: 'e.g. 2.0L Turbo',
                      controller: _engineSizeController,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: AppTextField(
                      label: 'Engine Number',
                      hint: 'e.g. 1GDA3309',
                      controller: _engineNumberController,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Variant & Series',
                      hint: 'e.g. DX, UN',
                      controller: _variantController,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: AppTextField(
                      label: 'Built (MM/YYYY)',
                      hint: 'MM/YYYY',
                      controller: _builtController,
                      readOnly: true,
                      onTap: _selectBuiltDate,
                      trailingIcon: const Icon(
                        Icons.calendar_month_rounded,
                        size: 20,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Body Type',
                          style: AppTypography.labelSm.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Builder(
                          builder: (context) {
                            final currentBody = state.bodyType.trim().toUpperCase();
                            final bodyOptions = <String>{
                              ..._bodyTypes,
                              if (currentBody.isNotEmpty) currentBody,
                            }.toList();
                            final selectedBody = bodyOptions.contains(currentBody)
                                ? currentBody
                                : bodyOptions.first;

                            return Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
                                borderRadius: AppRadius.input,
                                border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedBody,
                                  isExpanded: true,
                                  dropdownColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                                  items: bodyOptions.map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(fontWeight: FontWeight.w600)))).toList(),
                                  onChanged: (val) {
                                    if (val != null) controller.updateStep1(bodyType: val);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transmission',
                          style: AppTypography.labelSm.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Builder(
                          builder: (context) {
                            final currentTrans = state.transmission.trim();
                            final transOptions = <String>{
                              'Auto',
                              'Manual',
                              if (currentTrans.isNotEmpty) currentTrans,
                            }.toList();
                            final selectedTrans = transOptions.contains(currentTrans)
                                ? currentTrans
                                : transOptions.first;

                            return Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
                                borderRadius: AppRadius.input,
                                border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedTrans,
                                  isExpanded: true,
                                  dropdownColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                                  items: transOptions.map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(fontWeight: FontWeight.w600)))).toList(),
                                  onChanged: (val) {
                                    if (val != null) controller.updateStep1(transmission: val);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        AppButton(
          label: 'Next: Seller & Location',
          variant: ButtonVariant.primary,
          icon: const Icon(Icons.arrow_forward_rounded, size: 18, color: Colors.white),
          onPressed: () {
            controller.updateStep1(
              regoNumber: _regoController.text.trim(),
              vinNumber: _vinController.text.trim(),
              year: _yearController.text.trim(),
              engineSize: _engineSizeController.text.trim(),
              engineNumber: _engineNumberController.text.trim(),
              variant: _variantController.text.trim(),
              built: _builtController.text.trim(),
              odometer: _odometerController.text.trim(),
            );
            controller.nextStep();
          },
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }

  // --- STEP 2: SELLER & PICKUP LOCATION ---
  Widget _buildStep2Seller(
    VehicleWizardState state,
    VehicleWizardController controller,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: AppRadius.cardLg,
            border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
            boxShadow: isDark ? AppShadows.darkCard : AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: AppShadows.primaryGlow,
                    ),
                    child: const Icon(Icons.person_pin_rounded, color: AppColors.white, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Seller & Contact Details',
                    style: AppTypography.h5.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'First Name',
                      hint: 'John',
                      controller: _firstNameController,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: AppTextField(
                      label: 'Last Name',
                      hint: 'Doe',
                      controller: _lastNameController,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              AppTextField(
                label: 'Phone Number',
                hint: '+61 400 000 000',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'ABN Number (Optional)',
                      hint: 'e.g. 123456789',
                      controller: _abnController,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: AppTextField(
                      label: 'Business Name',
                      hint: 'Company Pty Ltd',
                      controller: _businessNameController,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Driver License No.',
                      hint: 'LIC98765',
                      controller: _licenseController,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: AppTextField(
                      label: 'Pickup Date',
                      hint: 'YYYY-MM-DD',
                      controller: _pickupDateController,
                      readOnly: true,
                      onTap: _selectPickupDate,
                      trailingIcon: const Icon(
                        Icons.calendar_today_rounded,
                        size: 20,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              AppTextField(
                label: 'Pickup Street Address',
                hint: '123 Main Street, Brisbane QLD',
                controller: _pickupAddressController,
                maxLines: 2,
              ),

              const SizedBox(height: AppSpacing.md),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
                  borderRadius: AppRadius.card,
                  border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
                child: Row(
                  children: [
                    Switch(
                      value: state.samePickupAddress,
                      activeThumbColor: AppColors.primary,
                      onChanged: (val) {
                        controller.updateStep2(samePickupAddress: val);
                      },
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Residential address is same as pickup',
                        style: AppTypography.bodySm.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (!state.samePickupAddress) ...[
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  label: 'Residential Address',
                  hint: 'Residential Street, Suburb, State',
                  controller: _residentialAddressController,
                  maxLines: 2,
                ),
              ],
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'Back',
                variant: ButtonVariant.secondary,
                onPressed: () => controller.prevStep(),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              flex: 2,
              child: AppButton(
                label: 'Next: Valuation & Sign',
                variant: ButtonVariant.primary,
                icon: const Icon(Icons.arrow_forward_rounded, size: 18, color: Colors.white),
                onPressed: () {
                  controller.updateStep2(
                    firstName: _firstNameController.text.trim(),
                    lastName: _lastNameController.text.trim(),
                    phoneNumber: _phoneController.text.trim(),
                    abnNumber: _abnController.text.trim(),
                    businessName: _businessNameController.text.trim(),
                    licenseNumber: _licenseController.text.trim(),
                    pickupDate: _pickupDateController.text.trim(),
                    dateOfBirth: _dobController.text.trim(),
                    pickupAddress: _pickupAddressController.text.trim(),
                    residentialAddress: _residentialAddressController.text.trim(),
                  );
                  controller.nextStep();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }

  // --- STEP 3: CONDITION & SIGNATURES ---
  Widget _buildStep3Condition(
    VehicleWizardState state,
    VehicleWizardController controller,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Condition Assessment Box
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: AppRadius.cardLg,
            border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
            boxShadow: isDark ? AppShadows.darkCard : AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: AppShadows.primaryGlow,
                    ),
                    child: const Icon(Icons.fact_check_rounded, color: AppColors.white, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Condition Assessment',
                    style: AppTypography.h5.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              _buildConditionTile('Drivable Vehicle', state.isDrivable, Icons.directions_car_rounded, (v) => controller.updateStep3(isDrivable: v), isDark),
              _buildConditionTile('Accidental Damage', state.isAccidental, Icons.warning_amber_rounded, (v) => controller.updateStep3(isAccidental: v), isDark),
              _buildConditionTile('WOVI (Written-Off Vehicle)', state.isWovi, Icons.car_crash_rounded, (v) => controller.updateStep3(isWovi: v), isDark),
              _buildConditionTile('Under Finance / PPSR', state.isUnderFinance, Icons.attach_money_rounded, (v) => controller.updateStep3(isUnderFinance: v), isDark),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Valuation & Notes
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: AppRadius.cardLg,
            border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
            boxShadow: isDark ? AppShadows.darkCard : AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.payments_rounded, color: AppColors.success, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Valuation & Payment',
                    style: AppTypography.h5.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Agreed Price (\$)',
                      hint: '5000',
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Method',
                          style: AppTypography.labelSm.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Builder(
                          builder: (context) {
                            final currentPayment = state.paymentMethod.trim();
                            final paymentOptions = <String>{
                              'Cash',
                              'Bank Transfer',
                              if (currentPayment.isNotEmpty) currentPayment,
                            }.toList();
                            final selectedPayment = paymentOptions.contains(currentPayment)
                                ? currentPayment
                                : paymentOptions.first;

                            return Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
                                borderRadius: AppRadius.input,
                                border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedPayment,
                                  isExpanded: true,
                                  dropdownColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                                  items: paymentOptions.map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(fontWeight: FontWeight.w600)))).toList(),
                                  onChanged: (val) {
                                    if (val != null) controller.updateStep3(paymentMethod: val);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              AppTextField(
                label: 'Driver Inspection Notes',
                hint: 'Any scratches, missing spare tire, condition notes...',
                controller: _notesController,
                maxLines: 2,
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Digital Signatures
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: AppRadius.cardLg,
            border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
            boxShadow: isDark ? AppShadows.darkCard : AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: AppShadows.primaryGlow,
                    ),
                    child: const Icon(Icons.draw_rounded, color: AppColors.white, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Digital Signatures',
                    style: AppTypography.h5.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              // 1. Seller Signature
              _buildSignaturePad(
                title: 'Seller / Owner Signature',
                signatureController: _sellerSignatureController,
                isDark: isDark,
              ),

              const SizedBox(height: AppSpacing.md),

              // 2. Driver Signature
              _buildSignaturePad(
                title: 'Buyer / Driver Signature',
                signatureController: _driverSignatureController,
                isDark: isDark,
              ),

              const SizedBox(height: AppSpacing.md),

              // Terms Checkbox
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
                  borderRadius: AppRadius.card,
                  border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: state.termsAgreed,
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      onChanged: (val) => controller.updateStep3(termsAgreed: val ?? false),
                    ),
                    Expanded(
                      child: Text(
                        'I confirm the vehicle condition and legal transfer of ownership.',
                        style: AppTypography.caption.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'Back',
                variant: ButtonVariant.secondary,
                onPressed: () => controller.prevStep(),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              flex: 2,
              child: AppButton(
                label: state.isSubmitting ? 'Submitting...' : 'Complete & Generate Receipt',
                isLoading: state.isSubmitting,
                variant: ButtonVariant.primary,
                icon: const Icon(Icons.check_circle_outline_rounded, size: 18, color: Colors.white),
                onPressed: _handleSubmit,
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }

  Widget _buildConditionTile(String title, bool value, IconData icon, ValueChanged<bool> onChanged, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
        borderRadius: AppRadius.card,
        border: Border.all(
          color: value ? AppColors.primary.withValues(alpha: 0.3) : (isDark ? AppColors.borderDark : AppColors.borderLight),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: value ? AppColors.primary : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTypography.bodyMd.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          Switch(
            value: value,
            activeThumbColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildSignaturePad({
    required String title,
    required SignatureController signatureController,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
        borderRadius: AppRadius.card,
        border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.labelSm.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              AppBounce(
                child: TextButton.icon(
                  style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                  icon: const Icon(Icons.clear_rounded, size: 16, color: AppColors.error),
                  label: Text(
                    'Clear',
                    style: AppTypography.caption.copyWith(color: AppColors.error, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () => signatureController.clear(),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.borderLight),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Signature(
                controller: signatureController,
                backgroundColor: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
