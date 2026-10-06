import 'package:flutter/material.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_typography.dart';

class PickupStatusBadge extends StatelessWidget {
  final String status;

  const PickupStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color border;
    Color text;
    String label = status.toUpperCase();

    switch (status.toLowerCase()) {
      case 'accepted':
        bg = AppColors.info.withValues(alpha: 0.12);
        border = AppColors.info.withValues(alpha: 0.35);
        text = AppColors.info;
        label = 'ACCEPTED';
        break;
      case 'in transit':
      case 'in_transit':
        bg = AppColors.primary.withValues(alpha: 0.12);
        border = AppColors.primary.withValues(alpha: 0.35);
        text = AppColors.primary;
        label = 'IN TRANSIT';
        break;
      case 'completed':
        bg = AppColors.success.withValues(alpha: 0.12);
        border = AppColors.success.withValues(alpha: 0.35);
        text = AppColors.success;
        label = 'COMPLETED';
        break;
      case 'cancelled':
        bg = AppColors.error.withValues(alpha: 0.12);
        border = AppColors.error.withValues(alpha: 0.35);
        text = AppColors.error;
        label = 'CANCELLED';
        break;
      case 'pending':
      default:
        bg = AppColors.warning.withValues(alpha: 0.12);
        border = AppColors.warning.withValues(alpha: 0.35);
        text = AppColors.warning;
        label = 'PENDING';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: text,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: text,
              fontWeight: FontWeight.w700,
              fontSize: 10.5,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
