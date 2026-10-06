import 'package:flutter/material.dart';
import '../core/design/app_colors.dart';
import '../core/design/app_spacing.dart';
import '../core/design/app_typography.dart';
import '../core/utils/extensions.dart';
import 'app_bounce.dart';
import 'app_theme_switch.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final Widget? leadingAction;
  final List<Widget>? trailingActions;
  final bool showThemeToggle;
  final VoidCallback? onBack;

  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = false,
    this.leadingAction,
    this.trailingActions,
    this.showThemeToggle = false,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64.0);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      centerTitle: false,
      leadingWidth: showBackButton || leadingAction != null ? 56 : 16,
      leading: showBackButton
          ? Center(
              child: AppBounce(
                onTap: onBack ?? () => Navigator.of(context).maybePop(),
                child: Container(
                  width: 38,
                  height: 38,
                  margin: const EdgeInsets.only(left: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isDark ? AppColors.borderDark : AppColors.borderLight,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
              ),
            )
          : leadingAction,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTypography.h4.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: AppTypography.caption.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ],
      ),
      actions: [
        if (showThemeToggle) const AppThemeSwitch(),
        ...?trailingActions,
        const SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}
