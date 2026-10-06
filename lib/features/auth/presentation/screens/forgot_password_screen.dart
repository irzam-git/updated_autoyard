import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../components/app_bounce.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_snackbar.dart';
import '../../../../components/app_text_field.dart';
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
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Center(
          child: AppBounce(
            onTap: () => context.pop(),
            child: Container(
              width: 38,
              height: 38,
              margin: const EdgeInsets.only(left: AppSpacing.sm),
              decoration: BoxDecoration(
                color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
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
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
          child: _emailSent ? _buildSuccessView(isDark) : _buildFormView(isDark, isLoading),
        ),
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
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
              ),
              child: const Icon(
                Icons.lock_reset_rounded,
                color: AppColors.primary,
                size: 38,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            AppStrings.forgotPassword,
            textAlign: TextAlign.center,
            style: AppTypography.h2.copyWith(
              fontWeight: FontWeight.w800,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Enter your registered email address to receive password reset instructions.',
            textAlign: TextAlign.center,
            style: AppTypography.bodySm.copyWith(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
              borderRadius: AppRadius.cardLg,
              border: Border.all(
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
              ),
              boxShadow: isDark ? AppShadows.darkCard : AppShadows.card,
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

          const SizedBox(height: AppSpacing.xl),
          Center(
            child: AppBounce(
              onTap: () => context.pop(),
              child: Text(
                'Back to Log In',
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.primary,
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
