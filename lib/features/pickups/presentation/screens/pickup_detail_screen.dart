import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
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
import '../../domain/models/assigned_pickup_model.dart';
import '../controllers/pickup_detail_controller.dart';
import '../widgets/pickup_status_badge.dart';

class PickupDetailScreen extends ConsumerStatefulWidget {
  final int pickupId;

  const PickupDetailScreen({super.key, required this.pickupId});

  @override
  ConsumerState<PickupDetailScreen> createState() => _PickupDetailScreenState();
}

class _PickupDetailScreenState extends ConsumerState<PickupDetailScreen> {
  Future<void> _makeCall(String phone) async {
    final clean = phone.replaceAll(RegExp(r'\s+'), '');
    final uri = Uri.parse('tel:$clean');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (mounted) {
        AppSnackBar.show(context, message: 'Could not launch dialer for $phone', type: SnackBarType.error);
      }
    }
  }

  Future<void> _sendSms(String phone) async {
    final clean = phone.replaceAll(RegExp(r'\s+'), '');
    final uri = Uri.parse('sms:$clean');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (mounted) {
        AppSnackBar.show(context, message: 'Could not launch SMS app for $phone', type: SnackBarType.error);
      }
    }
  }

  Future<void> _openMaps(String address) async {
    final encoded = Uri.encodeComponent(address);
    final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encoded');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri);
      }
    } catch (_) {
      try {
        await launchUrl(uri);
      } catch (e) {
        if (mounted) {
          AppSnackBar.show(context, message: 'Could not open maps', type: SnackBarType.error);
        }
      }
    }
  }

  void _showStatusConfirmationDialog({
    required String targetStatus,
    required String title,
    required String message,
    bool isDestructive = false,
  }) {
    final noteController = TextEditingController();

    showDialog<bool>(
      context: context,
      builder: (ctx) {
        final isDark = ctx.isDarkMode;
        return AlertDialog(
          backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.cardLg),
          title: Text(
            title,
            style: AppTypography.h4.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                label: 'Driver Note (Optional)',
                hint: 'e.g. Arrived on site, keys collected',
                controller: noteController,
                maxLines: 2,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDestructive ? AppColors.error : AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
              ),
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(isDestructive ? 'Confirm' : 'Proceed', style: const TextStyle(fontWeight: FontWeight.w700)),
            ),
          ],
        );
      },
    ).then((confirmed) async {
      if (confirmed == true && mounted) {
        final success = await ref
            .read(pickupDetailControllerProvider(widget.pickupId).notifier)
            .updateStatus(
              targetStatus,
              driverNote: noteController.text.trim().isNotEmpty ? noteController.text.trim() : null,
            );

        if (!mounted) return;

        if (success) {
          AppSnackBar.show(
            context,
            message: 'Trip status updated to ${targetStatus.toUpperCase()}',
            type: SnackBarType.success,
          );
        } else {
          final state = ref.read(pickupDetailControllerProvider(widget.pickupId));
          if (state.errorMessage != null) {
            AppSnackBar.show(
              context,
              message: state.errorMessage!,
              type: SnackBarType.error,
            );
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final state = ref.watch(pickupDetailControllerProvider(widget.pickupId));

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppHeader(
        title: 'Assignment #${widget.pickupId}',
        subtitle: state.pickup?.vehicleTitle ?? 'Pickup Details',
        showBackButton: true,
      ),
      body: _buildBody(state, isDark),
      bottomNavigationBar: state.pickup != null
          ? _buildBottomActionBar(state.pickup!, state.isUpdatingStatus, isDark)
          : null,
    );
  }

  Widget _buildBody(PickupDetailState state, bool isDark) {
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
            Text('Loading pickup details...', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      );
    }

    if (state.errorMessage != null && state.pickup == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Pickup Not Found',
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
                variant: ButtonVariant.secondary,
                onPressed: () => ref
                    .read(pickupDetailControllerProvider(widget.pickupId).notifier)
                    .fetchDetail(widget.pickupId),
              ),
            ],
          ),
        ),
      );
    }

    final pickup = state.pickup!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Vehicle Hero Card
          _buildHeroCard(pickup, isDark),
          const SizedBox(height: AppSpacing.md),

          // 2. Customer & Quick Actions Card
          _buildCustomerCard(pickup, isDark),
          const SizedBox(height: AppSpacing.md),

          // 3. Location & Navigation Card
          _buildLocationCard(pickup, isDark),
          const SizedBox(height: AppSpacing.md),

          // 4. Financials & Payment Card
          _buildFinancialsCard(pickup, isDark),
          const SizedBox(height: AppSpacing.md),

          // 5. Driver Note Card
          if (pickup.note != null && pickup.note!.isNotEmpty) ...[
            _buildNoteCard(pickup, isDark),
            const SizedBox(height: AppSpacing.md),
          ],

          const SizedBox(height: 80), // Padding for sticky bottom bar
        ],
      ),
    );
  }

  Widget _buildHeroCard(AssignedPickupModel pickup, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
        boxShadow: isDark ? AppShadows.darkCard : AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'VEHICLE DETAILS',
                  style: AppTypography.caption.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              PickupStatusBadge(status: pickup.status),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            pickup.vehicleTitle,
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.w800,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Scheduled: ${pickup.pickupDate ?? 'Not scheduled'}  ${pickup.pickupTime ?? ''}'.trim(),
                  style: AppTypography.bodySm.copyWith(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerCard(AssignedPickupModel pickup, bool isDark) {
    final phone = pickup.effectivePhoneNumber;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
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
                'Customer Information',
                style: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            pickup.effectiveCustomerName,
            style: AppTypography.h4.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          if (phone.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              phone,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: AppBounce(
                    onTap: () => _makeCall(phone),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        gradient: AppColors.emeraldGradient,
                        borderRadius: AppRadius.button,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.success.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone_rounded, size: 18, color: AppColors.white),
                          SizedBox(width: 6),
                          Text('Call Seller', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppBounce(
                    onTap: () => _sendSms(phone),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
                        borderRadius: AppRadius.button,
                        border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sms_rounded, size: 18, color: AppColors.primary),
                          SizedBox(width: 6),
                          Text('Send SMS', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLocationCard(AssignedPickupModel pickup, bool isDark) {
    final address = pickup.address ?? 'No address provided';

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
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
                  color: AppColors.error.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.location_on_rounded, color: AppColors.error, size: 16),
              ),
              const SizedBox(width: 8),
              Text(
                'Pickup Location',
                style: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            address,
            style: AppTypography.bodyMd.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Open in Google Maps / GPS',
            variant: ButtonVariant.primary,
            icon: const Icon(Icons.navigation_rounded, size: 18, color: AppColors.white),
            onPressed: () => _openMaps(address),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialsCard(AssignedPickupModel pickup, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
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
                child: const Icon(Icons.account_balance_wallet_rounded, color: AppColors.success, size: 16),
              ),
              const SizedBox(width: 8),
              Text(
                'Payment & Settlement',
                style: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Agreed Amount',
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  pickup.formattedPrice,
                  style: AppTypography.h4.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Method',
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                pickup.paymentMethod ?? 'Cash',
                style: AppTypography.bodySm.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNoteCard(AssignedPickupModel pickup, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.08),
        borderRadius: AppRadius.cardLg,
        border: Border.all(
          color: AppColors.warning.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.sticky_note_2_rounded, color: AppColors.warning, size: 20),
              const SizedBox(width: 8),
              Text(
                'Dispatch Notes',
                style: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.warning,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            pickup.note!,
            style: AppTypography.bodySm.copyWith(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar(AssignedPickupModel pickup, bool isUpdating, bool isDark) {
    final status = pickup.status.toLowerCase();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: isUpdating
            ? const Center(
                heightFactor: 1,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.5, color: AppColors.primary),
                ),
              )
            : _buildStatusActionButtons(status),
      ),
    );
  }

  Widget _buildStatusActionButtons(String status) {
    if (status == 'pending') {
      return Row(
        children: [
          Expanded(
            child: AppButton(
              label: 'Decline',
              variant: ButtonVariant.danger,
              onPressed: () => _showStatusConfirmationDialog(
                targetStatus: 'cancelled',
                title: 'Decline Pickup',
                message: 'Are you sure you want to decline/cancel this pickup assignment?',
                isDestructive: true,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            flex: 2,
            child: AppButton(
              label: 'Accept Pickup',
              variant: ButtonVariant.primary,
              icon: const Icon(Icons.check_circle_rounded, size: 18, color: Colors.white),
              onPressed: () => _showStatusConfirmationDialog(
                targetStatus: 'accepted',
                title: 'Accept Pickup',
                message: 'Accept this vehicle pickup assignment and confirm to dispatch?',
              ),
            ),
          ),
        ],
      );
    } else if (status == 'accepted') {
      return AppButton(
        label: 'Start Trip (In Transit)',
        variant: ButtonVariant.primary,
        icon: const Icon(Icons.play_arrow_rounded, color: AppColors.white),
        onPressed: () => _showStatusConfirmationDialog(
          targetStatus: 'in transit',
          title: 'Start Trip',
          message: 'Mark vehicle pickup as In Transit? Dispatch and customer will be notified.',
        ),
      );
    } else if (status == 'in transit' || status == 'in_transit') {
      return Row(
        children: [
          Expanded(
            child: AppButton(
              label: 'Cancel Trip',
              variant: ButtonVariant.danger,
              onPressed: () => _showStatusConfirmationDialog(
                targetStatus: 'cancelled',
                title: 'Cancel Trip',
                message: 'Are you sure you want to cancel this trip?',
                isDestructive: true,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            flex: 2,
            child: AppButton(
              label: 'Complete Pickup',
              variant: ButtonVariant.primary,
              icon: const Icon(Icons.check_circle_rounded, color: AppColors.white),
              onPressed: () => _showStatusConfirmationDialog(
                targetStatus: 'completed',
                title: 'Complete Pickup',
                message: 'Mark vehicle collection as Completed? Ensure keys and documentation are secured.',
              ),
            ),
          ),
        ],
      );
    } else if (status == 'completed') {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.success.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_rounded, color: AppColors.success, size: 20),
            SizedBox(width: 8),
            Text(
              'Pickup Assignment Completed',
              style: TextStyle(
                color: AppColors.success,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cancel_rounded, color: AppColors.error, size: 20),
            SizedBox(width: 8),
            Text(
              'Pickup Cancelled',
              style: TextStyle(
                color: AppColors.error,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    }
  }
}

