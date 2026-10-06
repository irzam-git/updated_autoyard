import 'package:flutter/material.dart';
import '../../../../components/app_bounce.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_shadows.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/models/notification_model.dart';

class NotificationItemCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;
  final VoidCallback? onMarkRead;

  const NotificationItemCard({
    super.key,
    required this.notification,
    required this.onTap,
    this.onMarkRead,
  });

  (IconData, Color) _getNotificationVisuals() {
    final title = notification.displayTitle.toLowerCase();
    final type = notification.type?.toLowerCase() ?? '';

    if (title.contains('pickup') || type.contains('assigned')) {
      return (Icons.local_shipping_rounded, AppColors.primary);
    }
    if (title.contains('vehicle') || title.contains('car') || type.contains('vehicle')) {
      return (Icons.directions_car_rounded, AppColors.success);
    }
    if (title.contains('status') || title.contains('update')) {
      return (Icons.update_rounded, AppColors.warning);
    }
    return (Icons.notifications_rounded, const Color(0xFF8B5CF6));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final isUnread = !notification.isRead;
    final (icon, iconColor) = _getNotificationVisuals();

    final cardBg = isUnread
        ? (isDark
            ? AppColors.primary.withValues(alpha: 0.08)
            : AppColors.primary.withValues(alpha: 0.04))
        : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight);

    final borderColor = isUnread
        ? AppColors.primary.withValues(alpha: 0.35)
        : (isDark ? AppColors.borderDark : AppColors.borderLight);

    return AppBounce(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: AppRadius.cardLg,
          border: Border.all(color: borderColor, width: isUnread ? 1.4 : 1.0),
          boxShadow: isUnread
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : (isDark ? AppShadows.darkCard : AppShadows.sm),
        ),
        child: ClipRRect(
          borderRadius: AppRadius.cardLg,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Avatar
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: isDark ? 0.18 : 0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: iconColor.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),

                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.displayTitle,
                              style: AppTypography.h6.copyWith(
                                fontWeight: isUnread ? FontWeight.w700 : FontWeight.w600,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight,
                              ),
                            ),
                          ),
                          if (isUnread)
                            Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.only(left: 6),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary,
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification.displayMessage,
                        style: AppTypography.bodySm.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 13,
                            color: isDark
                                ? AppColors.textTertiaryDark
                                : AppColors.textTertiaryLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            notification.timeAgo,
                            style: AppTypography.caption.copyWith(
                              color: isDark
                                  ? AppColors.textTertiaryDark
                                  : AppColors.textTertiaryLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          if (notification.pickupId != null || notification.vehicleId != null)
                            Row(
                              children: [
                                Text(
                                  'View Details',
                                  style: AppTypography.caption.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  size: 14,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
