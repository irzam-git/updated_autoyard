import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../components/app_avatar.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_dialog.dart';
import '../../../../components/app_header.dart';
import '../../../../components/app_heading.dart';
import '../../../../components/app_list_tile.dart';
import '../../../../components/app_theme_switch.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_theme.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = context.isDarkMode;
    final authState = ref.watch(authControllerProvider);
    final user = authState is AuthStateAuthenticated ? authState.user : null;
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: const AppHeader(
        title: AppStrings.profile,
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screenPaddingAll,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  AppAvatar(
                    initials: user?.initials ?? 'D',
                    imageUrl: user?.profileImageUrl,
                    size: 80,
                    showBadge: true,
                    badgeColor: AppColors.success,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppHeading(
                    text: user?.displayName ?? 'AutoYard Driver',
                    level: HeadingLevel.h3,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user?.email ?? 'developer@example.com',
                    style: AppTypography.bodySm.copyWith(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Preferences Card
            Card(
              child: Column(
                children: [
                  AppListTile(
                    leading: const Icon(Icons.palette_outlined, color: AppColors.primary),
                    title: 'Appearance',
                    subtitle: 'Current mode: ${themeMode.name.capitalize()}',
                    trailing: const AppThemeSwitch(),
                    showDivider: true,
                  ),
                  AppListTile(
                    leading: const Icon(Icons.info_outline, color: AppColors.info),
                    title: 'Environment Flavor',
                    subtitle: 'Running: ${AppConfig.flavorName.toUpperCase()}',
                    showDivider: true,
                  ),
                  const AppListTile(
                    leading: Icon(Icons.security_outlined, color: AppColors.success),
                    title: 'Security & Token Storage',
                    subtitle: 'Hive AES Encrypted',
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Logout Button
            AppButton(
              label: AppStrings.logout,
              variant: ButtonVariant.danger,
              icon: const Icon(Icons.logout_rounded, size: 20, color: AppColors.white),
              onPressed: () {
                AppDialog.show(
                  context,
                  title: 'Log Out',
                  message: 'Are you sure you want to log out of your session?',
                  confirmLabel: 'Log Out',
                  cancelLabel: 'Cancel',
                  isDestructive: true,
                  onConfirm: () {
                    ref.read(authControllerProvider.notifier).logout();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
