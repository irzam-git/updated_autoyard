import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../components/app_bounce.dart';
import '../../../../components/app_button.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_shadows.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../auth/domain/models/user_model.dart';

class CompanyInfoDialog extends StatelessWidget {
  final UserModel user;

  const CompanyInfoDialog({super.key, required this.user});

  static void show(BuildContext context, UserModel user) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CompanyInfoDialog(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final parent = user.driverParent;
    final details = user.driverParentDetails;

    final companyName = details?.companyName ?? parent?.displayName ?? 'AutoYard Dealership';
    final businessName = details?.businessName ?? details?.companyName ?? '';
    final abn = details?.abnNumber ?? 'N/A';
    final email = details?.businessEmail ?? parent?.email ?? 'N/A';
    final address = details?.businessAddress ?? 'N/A';
    final website = details?.website ?? '';
    final vehiclesCount = parent?.other?.vehiclesCount ?? 0;
    final driversCount = parent?.other?.driversCount ?? 0;
    final isSubscriptionActive = parent?.other?.isSubscriptionActive ?? true;

    final bgColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
    final textPrimary = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textSecondary = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppRadius.sheet,
        boxShadow: isDark ? AppShadows.darkCard : AppShadows.modal,
      ),
      padding: EdgeInsets.only(
        top: AppSpacing.md,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              decoration: BoxDecoration(
                color: textSecondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: AppRadius.card,
                  boxShadow: AppShadows.primaryGlow,
                ),
                child: const Icon(
                  Icons.business_rounded,
                  color: AppColors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName,
                      style: AppTypography.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    if (businessName.isNotEmpty && businessName != companyName)
                      Text(
                        businessName,
                        style: AppTypography.bodySm.copyWith(
                          color: textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: isSubscriptionActive
                      ? AppColors.success.withValues(alpha: 0.15)
                      : AppColors.warning.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSubscriptionActive
                        ? AppColors.success.withValues(alpha: 0.3)
                        : AppColors.warning.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSubscriptionActive ? AppColors.success : AppColors.warning,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isSubscriptionActive ? 'ACTIVE' : 'INACTIVE',
                      style: AppTypography.caption.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: isSubscriptionActive ? AppColors.success : AppColors.warning,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // Quota Summary Cards
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
                    borderRadius: AppRadius.card,
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$vehiclesCount',
                        style: AppTypography.h3.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Total Vehicles',
                        style: AppTypography.caption.copyWith(
                          color: textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
                    borderRadius: AppRadius.card,
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$driversCount',
                        style: AppTypography.h3.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.secondary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Active Drivers',
                        style: AppTypography.caption.copyWith(
                          color: textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // Detail rows in container
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
              borderRadius: AppRadius.card,
              border: Border.all(color: borderColor),
            ),
            child: Column(
              children: [
                _buildInfoRow(
                  icon: Icons.badge_outlined,
                  title: 'ABN Number',
                  value: abn,
                  isDark: isDark,
                ),
                const Divider(height: AppSpacing.md),
                _buildInfoRow(
                  icon: Icons.email_outlined,
                  title: 'Business Email',
                  value: email,
                  isDark: isDark,
                ),
                const Divider(height: AppSpacing.md),
                _buildInfoRow(
                  icon: Icons.location_on_outlined,
                  title: 'Business Address',
                  value: address,
                  isDark: isDark,
                ),
                if (website.isNotEmpty) ...[
                  const Divider(height: AppSpacing.md),
                  _buildInfoRow(
                    icon: Icons.language_outlined,
                    title: 'Website',
                    value: website,
                    isDark: isDark,
                    isLink: true,
                    onTap: () async {
                      final uri = Uri.tryParse(website);
                      if (uri != null && await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          AppButton(
            label: 'Close',
            variant: ButtonVariant.secondary,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
    required bool isDark,
    bool isLink = false,
    VoidCallback? onTap,
  }) {
    final textPrimary = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textSecondary = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return AppBounce(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 18, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.caption.copyWith(
                    color: textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTypography.bodyMd.copyWith(
                    color: isLink ? AppColors.primary : textPrimary,
                    fontWeight: FontWeight.w600,
                    decoration: isLink ? TextDecoration.underline : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

