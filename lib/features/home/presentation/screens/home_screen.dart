import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../components/app_avatar.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_dialog.dart';
import '../../../../components/app_header.dart';
import '../../../../components/app_heading.dart';
import '../../../../components/app_list_tile.dart';
import '../../../../components/app_snackbar.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final user = authState is AuthStateAuthenticated ? authState.user : null;

    return Scaffold(
      appBar: AppHeader(
        title: AppStrings.home,
        subtitle: 'Architecture Template Showcase',
        trailingActions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {
              AppSnackBar.show(
                context,
                message: 'No new notifications',
                type: SnackBarType.info,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screenPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Container(
              padding: AppSpacing.cardPadding,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: AppRadius.card,
              ),
              child: Row(
                children: [
                  AppAvatar(
                    initials: user?.initials ?? 'D',
                    imageUrl: user?.profileImageUrl,
                    size: 52,
                    showBadge: true,
                    badgeColor: AppColors.success,
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${user?.displayName ?? 'Driver'}!',
                          style: AppTypography.h4.copyWith(color: AppColors.white),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user?.email ?? 'Clean Architecture Ready',
                          style: AppTypography.bodySm.copyWith(
                            color: AppColors.white.withValues(alpha: 0.85),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Section 1: Architecture Highlights
            const AppHeading(
              text: 'Architecture Highlights',
              level: HeadingLevel.h4,
            ),
            const SizedBox(height: AppSpacing.sm),
            Card(
              child: Column(
                children: [
                  const AppListTile(
                    leading: Icon(Icons.layers_outlined, color: AppColors.primary),
                    title: '3-Layer Clean Architecture',
                    subtitle: 'Presentation → Domain → Data unidirectional flow',
                    showDivider: true,
                  ),
                  const AppListTile(
                    leading: Icon(Icons.bolt_outlined, color: AppColors.warning),
                    title: 'Riverpod 3.x + Codegen',
                    subtitle: 'Type-safe reactive state management',
                    showDivider: true,
                  ),
                  const AppListTile(
                    leading: Icon(Icons.shield_outlined, color: AppColors.success),
                    title: 'Dio + Hive Secure Storage',
                    subtitle: 'JWT token interceptor with auto-refresh',
                    showDivider: true,
                  ),
                  AppListTile(
                    leading: const Icon(Icons.widgets_outlined, color: AppColors.info),
                    title: '12+ Wrapped App* UI Components',
                    subtitle: 'Zero raw unstyled Flutter widgets',
                    onTap: () {
                      AppSnackBar.show(
                        context,
                        message: 'All App* widgets are strictly token-driven!',
                        type: SnackBarType.success,
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Section 2: Interactive Verification
            const AppHeading(
              text: 'Interactive Controls',
              level: HeadingLevel.h4,
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Show Modal Dialog',
                    variant: ButtonVariant.secondary,
                    onPressed: () {
                      AppDialog.show(
                        context,
                        title: 'Architecture Blueprint',
                        message: 'Every new feature follows the same exact Clean Architecture layout.',
                        confirmLabel: 'Got It',
                      );
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppButton(
                    label: 'Test Toast',
                    variant: ButtonVariant.outline,
                    onPressed: () {
                      AppSnackBar.show(
                        context,
                        message: 'Design token feedback verified!',
                        type: SnackBarType.info,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
