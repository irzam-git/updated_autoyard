import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../components/app_bounce.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_snackbar.dart';
import '../../../../components/app_text_field.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_shadows.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators.dart';
import '../controllers/auth_controller.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) return;
    context.hideKeyboard();

    final success = await ref
        .read(authControllerProvider.notifier)
        .forgotPassword(email: _emailController.text.trim());

    if (!mounted) return;

    if (success) {
      setState(() {
        _emailSent = true;
      });
      AppSnackBar.show(
        context,
        message: 'Password reset link sent to ${_emailController.text.trim()}',
        type: SnackBarType.success,
      );
    } else {
      final state = ref.read(authControllerProvider);
      if (state is AuthStateError) {
        AppSnackBar.show(
          context,
          message: state.message,
          type: SnackBarType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState is AuthStateLoading;

    return Scaffold(
      backgroundColor: const Color(0xFF1B88F0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Truck Backdrop
          Image.asset(
            AppAssets.truckPicture,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) => Container(
              color: const Color(0xFF1B88F0),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
                    child: AppBounce(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
                      child: _emailSent ? _buildSuccessView(isDark) : _buildFormView(isDark, isLoading),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormView(bool isDark, bool isLoading) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.md),
          Center(
            child: Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.5), width: 1.5),
                boxShadow: AppShadows.primaryGlow,
              ),
              child: const Icon(
                Icons.lock_reset_rounded,
                color: AppColors.primaryLight,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            AppStrings.forgotPassword,
            textAlign: TextAlign.center,
            style: AppTypography.h2.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Enter your registered email address to receive password reset instructions.',
            textAlign: TextAlign.center,
            style: AppTypography.bodySm.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          ClipRRect(
            borderRadius: AppRadius.cardLg,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF141A26).withValues(alpha: 0.82)
                      : Colors.white.withValues(alpha: 0.94),
                  borderRadius: AppRadius.cardLg,
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.12)
                        : Colors.white.withValues(alpha: 0.8),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextField(
                      label: AppStrings.email,
                      hint: 'driver@mail.com',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      leadingIcon: const Icon(Icons.email_outlined, size: 20),
                      validator: AppValidators.email,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _handleResetPassword(),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AppButton(
                      label: 'Send Reset Link',
                      fullWidth: true,
                      isLoading: isLoading,
                      onPressed: _handleResetPassword,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),
          Center(
            child: AppBounce(
              onTap: () => context.pop(),
              child: Text(
                'Back to Log In',
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView(bool isDark) {
    return Column(
      children: [
        const SizedBox(height: AppSpacing.xxl),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.12),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
          ),
          child: const Icon(
            Icons.check_circle_outline_rounded,
            color: AppColors.success,
            size: 44,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Check Your Inbox',
          textAlign: TextAlign.center,
          style: AppTypography.h2.copyWith(
            fontWeight: FontWeight.w800,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'We have sent password reset instructions to ${_emailController.text.trim()}. Please check your email.',
          textAlign: TextAlign.center,
          style: AppTypography.bodyMd.copyWith(
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
        AppButton(
          label: 'Back to Log In',
          fullWidth: true,
          onPressed: () => context.pop(),
        ),
        const SizedBox(height: AppSpacing.md),
        TextButton(
          onPressed: () {
            setState(() {
              _emailSent = false;
            });
          },
          child: Text(
            'Did not receive email? Try again',
            style: AppTypography.bodySm.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
