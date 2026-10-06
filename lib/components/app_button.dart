import 'package:flutter/material.dart';
import '../core/constants/app_enums.dart';
import '../core/design/app_colors.dart';
import '../core/design/app_radius.dart';
import '../core/design/app_shadows.dart';
import '../core/design/app_spacing.dart';
import '../core/design/app_typography.dart';
import '../core/utils/extensions.dart';
import 'app_bounce.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final bool isDisabled;
  final Widget? icon;
  final double? width;
  final double height;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.width,
    this.height = 50.0,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final isInteractive = !isDisabled && !isLoading && onPressed != null;

    Color? backgroundColor;
    Gradient? gradient;
    Color foregroundColor;
    BorderSide borderSide = BorderSide.none;
    List<BoxShadow> shadows = const [];

    switch (variant) {
      case ButtonVariant.primary:
        if (isInteractive) {
          gradient = AppColors.primaryGradient;
          foregroundColor = AppColors.white;
          shadows = AppShadows.primaryGlow;
        } else {
          backgroundColor = isDark ? AppColors.disabledDark : AppColors.disabledLight;
          foregroundColor = isDark ? AppColors.textTertiaryDark : AppColors.white;
        }
        break;
      case ButtonVariant.secondary:
        backgroundColor = isInteractive
            ? (isDark ? AppColors.cardDark : AppColors.surfaceLight)
            : (isDark ? AppColors.disabledDark : AppColors.disabledLight);
        foregroundColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
        borderSide = BorderSide(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.2,
        );
        if (isInteractive) {
          shadows = AppShadows.sm;
        }
        break;
      case ButtonVariant.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = isInteractive
            ? (isDark ? AppColors.primaryLight : AppColors.primary)
            : (isDark ? AppColors.disabledDark : AppColors.disabledLight);
        borderSide = BorderSide(
          color: isInteractive
              ? (isDark ? AppColors.primaryLight.withValues(alpha: 0.6) : AppColors.primary)
              : (isDark ? AppColors.disabledDark : AppColors.disabledLight),
          width: 1.5,
        );
        break;
      case ButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = isInteractive
            ? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight)
            : (isDark ? AppColors.disabledDark : AppColors.disabledLight);
        break;
      case ButtonVariant.danger:
        backgroundColor = isInteractive ? AppColors.error : (isDark ? AppColors.disabledDark : AppColors.disabledLight);
        foregroundColor = AppColors.white;
        if (isInteractive) {
          shadows = [
            BoxShadow(
              color: AppColors.error.withValues(alpha: 0.3),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ];
        }
        break;
    }

    final buttonContent = Container(
      width: fullWidth ? double.infinity : width,
      height: height,
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
        borderRadius: AppRadius.button,
        border: Border.fromBorderSide(borderSide),
        boxShadow: shadows,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Center(
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: foregroundColor,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: AppSpacing.xs),
                  ],
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.button.copyWith(
                        color: foregroundColor,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );

    if (isInteractive) {
      return AppBounce(
        onTap: onPressed,
        child: buttonContent,
      );
    }

    return buttonContent;
  }
}
