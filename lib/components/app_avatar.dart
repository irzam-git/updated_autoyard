import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/design/app_colors.dart';
import '../core/design/app_typography.dart';
import '../core/utils/extensions.dart';
import 'app_bounce.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final bool showBadge;
  final Color? badgeColor;
  final VoidCallback? onTap;
  final bool withGradientBorder;

  const AppAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 44.0,
    this.showBadge = false,
    this.badgeColor,
    this.onTap,
    this.withGradientBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    Widget avatarContent;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatarContent = ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          placeholder: (context, url) => _buildFallback(isDark),
          errorWidget: (context, url, error) => _buildFallback(isDark),
        ),
      );
    } else {
      avatarContent = _buildFallback(isDark);
    }

    if (withGradientBorder) {
      avatarContent = Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.primaryGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          ),
          child: ClipOval(child: avatarContent),
        ),
      );
    }

    Widget avatarWidget = Stack(
      children: [
        avatarContent,
        if (showBadge)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.28,
              height: size * 0.28,
              decoration: BoxDecoration(
                color: badgeColor ?? AppColors.success,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                  width: 2.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (badgeColor ?? AppColors.success).withValues(alpha: 0.4),
                    blurRadius: 6,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
      ],
    );

    if (onTap != null) {
      return AppBounce(
        onTap: onTap,
        child: avatarWidget,
      );
    }

    return avatarWidget;
  }

  Widget _buildFallback(bool isDark) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
      ),
      child: Center(
        child: Text(
          (initials ?? 'U').toUpperCase(),
          style: AppTypography.labelLg.copyWith(
            fontSize: size * 0.38,
            fontWeight: FontWeight.w800,
            color: AppColors.white,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
