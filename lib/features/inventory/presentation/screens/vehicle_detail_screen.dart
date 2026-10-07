import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../components/app_bounce.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_dialog.dart';
import '../../../../components/app_header.dart';
import '../../../../components/app_snackbar.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_shadows.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/extensions.dart';
import '../controllers/vehicle_detail_controller.dart';
import '../../domain/models/vehicle_model.dart';

class VehicleDetailScreen extends ConsumerWidget {
  final int vehicleId;

  const VehicleDetailScreen({super.key, required this.vehicleId});

  Future<void> _makeCall(BuildContext context, String phone) async {
    final clean = phone.replaceAll(RegExp(r'\s+'), '');
    final uri = Uri.parse('tel:$clean');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = context.isDarkMode;
    final state = ref.watch(vehicleDetailControllerProvider(vehicleId));
    final controller = ref.read(vehicleDetailControllerProvider(vehicleId).notifier);
    final vehicle = state.vehicle;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppHeader(
        title: vehicle?.regoBadge ?? 'Vehicle #$vehicleId',
        subtitle: vehicle?.vehicleTitle ?? 'Purchased Inventory Details',
        showBackButton: true,
        onBack: () => context.pop(),
      ),
      body: _buildBody(context, state, controller, isDark),
      bottomNavigationBar: vehicle != null
          ? _buildBottomBar(context, vehicle, controller, isDark)
          : null,
    );
  }

  Widget _buildBody(
    BuildContext context,
    VehicleDetailState state,
    VehicleDetailController controller,
    bool isDark,
  ) {
    if (state.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(strokeWidth: 3, color: AppColors.primary),
            ),
            SizedBox(height: AppSpacing.md),
            Text('Loading vehicle details...'),
          ],
        ),
      );
    }

    if (state.errorMessage != null && state.vehicle == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Vehicle Not Found',
                style: AppTypography.h4.copyWith(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                state.errorMessage!,
                textAlign: TextAlign.center,
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: 'Retry',
                onPressed: () => controller.fetchDetail(vehicleId),
              ),
            ],
          ),
        ),
      );
    }

    final vehicle = state.vehicle!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Vehicle Hero & Financial Summary
          _buildHeroCard(vehicle, isDark),
          const SizedBox(height: AppSpacing.md),

          // 2. Specifications Grid
          _buildSpecCard(vehicle, isDark),
          const SizedBox(height: AppSpacing.md),

          // 3. Condition Assessment Card
          _buildConditionCard(vehicle, isDark),
          const SizedBox(height: AppSpacing.md),

          // 4. Seller & Location Card
          _buildSellerCard(context, vehicle, isDark),
          const SizedBox(height: AppSpacing.md),

          // 5. Signatures Preview
          if (vehicle.ownerSignatureUrl != null || vehicle.buyerSignatureUrl != null) ...[
            _buildSignaturesCard(vehicle, isDark),
            const SizedBox(height: AppSpacing.md),
          ],

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildHeroCard(VehicleModel vehicle, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.2,
        ),
        boxShadow: isDark ? AppShadows.darkCard : AppShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.only(right: 6),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      vehicle.regoBadge,
                      style: AppTypography.caption.copyWith(
                        fontWeight: FontWeight.w800,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
                ),
                child: Text(
                  vehicle.formattedPrice,
                  style: AppTypography.labelLg.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            vehicle.vehicleTitle,
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Payment: ${vehicle.paymentMethod ?? 'Cash'}',
                  style: AppTypography.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  (vehicle.status ?? 'in-stock').toUpperCase(),
                  style: AppTypography.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpecCard(VehicleModel vehicle, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.2,
        ),
        boxShadow: isDark ? AppShadows.darkCard : AppShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.settings_suggest_rounded, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Technical Specifications',
                style: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _buildSpecRow('VIN Number', vehicle.vinNumber ?? 'N/A', isDark),
          _buildSpecRow('Engine Number', vehicle.engineNumber ?? 'N/A', isDark),
          _buildSpecRow('Engine Size', vehicle.engineSize ?? 'N/A', isDark),
          _buildSpecRow('Transmission', vehicle.transmission ?? 'N/A', isDark),
          _buildSpecRow('Body Type', vehicle.bodyType ?? 'N/A', isDark),
          _buildSpecRow('Odometer', '${vehicle.odometer ?? '0'} km', isDark),
          _buildSpecRow('Built Date', vehicle.built ?? 'N/A', isDark),
          _buildSpecRow('Variant', vehicle.variant ?? 'Standard', isDark),
        ],
      ),
    );
  }

  Widget _buildSpecRow(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTypography.bodySm.copyWith(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppTypography.bodySm.copyWith(
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConditionCard(VehicleModel vehicle, bool isDark) {
    final cond = vehicle.vehicleCondition;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.2,
        ),
        boxShadow: isDark ? AppShadows.darkCard : AppShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.verified_outlined, color: AppColors.success, size: 20),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Condition Assessment',
                style: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(child: _buildBadgePill('Drivable', cond?.isDrivable == true, isDark)),
              const SizedBox(width: 8),
              Expanded(child: _buildBadgePill('Accidental', cond?.isAccidental == true, isDark)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildBadgePill('WOVI Written-Off', cond?.isWovi == true, isDark)),
              const SizedBox(width: 8),
              Expanded(child: _buildBadgePill('Under Finance', cond?.isUnderFinance == true, isDark)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadgePill(String label, bool isYes, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isYes
            ? AppColors.primary.withValues(alpha: 0.1)
            : (isDark ? AppColors.backgroundDark : AppColors.backgroundLight),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isYes
              ? AppColors.primary.withValues(alpha: 0.25)
              : (isDark ? AppColors.borderDark : AppColors.borderLight),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          Icon(
            isYes ? Icons.check_circle_rounded : Icons.cancel_rounded,
            size: 16,
            color: isYes ? AppColors.success : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerCard(BuildContext context, VehicleModel vehicle, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.2,
        ),
        boxShadow: isDark ? AppShadows.darkCard : AppShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.person_pin_rounded, color: Color(0xFF8B5CF6), size: 20),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Seller & Pickup Location',
                style: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildSpecRow('Seller Name', vehicle.sellerFullName, isDark),
          if (vehicle.phoneNumber != null && vehicle.phoneNumber!.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Phone Number', style: AppTypography.bodySm.copyWith(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
                  const SizedBox(width: AppSpacing.md),
                  AppBounce(
                    onTap: () => _makeCall(context, vehicle.phoneNumber!),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.phone_rounded, size: 14, color: AppColors.primary),
                          const SizedBox(width: 4),
                          Text(
                            vehicle.phoneNumber!,
                            style: AppTypography.bodySm.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (vehicle.pickupAddress != null && vehicle.pickupAddress!.isNotEmpty)
            _buildSpecRow('Pickup Address', vehicle.pickupAddress!, isDark),
        ],
      ),
    );
  }

  Widget _buildSignaturesCard(VehicleModel vehicle, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.2,
        ),
        boxShadow: isDark ? AppShadows.darkCard : AppShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.draw_rounded, color: AppColors.warning, size: 20),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Captured Digital Signatures',
                style: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              if (vehicle.ownerSignatureUrl != null)
                Expanded(
                  child: Column(
                    children: [
                      Text('Owner Signature', style: AppTypography.caption.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: vehicle.ownerSignatureUrl!,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.draw_outlined, size: 18, color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
                                const SizedBox(width: 4),
                                Text(
                                  'Signature on file',
                                  style: AppTypography.caption.copyWith(
                                    color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (vehicle.ownerSignatureUrl != null && vehicle.buyerSignatureUrl != null)
                const SizedBox(width: 12),
              if (vehicle.buyerSignatureUrl != null)
                Expanded(
                  child: Column(
                    children: [
                      Text('Buyer Signature', style: AppTypography.caption.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: vehicle.buyerSignatureUrl!,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.draw_outlined, size: 18, color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
                                const SizedBox(width: 4),
                                Text(
                                  'Signature on file',
                                  style: AppTypography.caption.copyWith(
                                    color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(
    BuildContext context,
    VehicleModel vehicle,
    VehicleDetailController controller,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: Border(top: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight)),
        boxShadow: isDark ? null : [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            AppBounce(
              onTap: () {
                AppDialog.show(
                  context,
                  title: 'Delete Vehicle',
                  message: 'Are you sure you want to delete Vehicle #${vehicle.id} from inventory?',
                  confirmLabel: 'Delete',
                  isDestructive: true,
                  onConfirm: () async {
                    final success = await controller.deleteVehicle();
                    if (context.mounted && success) {
                      AppSnackBar.show(context, message: 'Vehicle deleted', type: SnackBarType.success);
                      context.pop();
                    }
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.25)),
                ),
                child: const Icon(Icons.delete_outline_rounded, color: AppColors.error, size: 22),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppButton(
                label: 'View Purchase Receipt PDF',
                variant: ButtonVariant.primary,
                icon: const Icon(Icons.picture_as_pdf_outlined, size: 18, color: Colors.white),
                onPressed: () {
                  context.push('${AppRoutes.inventory}/${vehicle.id}/receipt');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
