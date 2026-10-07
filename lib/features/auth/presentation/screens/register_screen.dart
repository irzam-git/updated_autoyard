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
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators.dart';
import '../controllers/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _activationKeyController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _sendDetailsTo = 'email';
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _activationKeyController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onRegister() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_agreedToTerms) {
      AppSnackBar.show(
        context,
        message: 'Please agree to the Terms and Conditions to proceed',
        type: SnackBarType.warning,
      );
      return;
    }

    context.hideKeyboard();

    final success = await ref.read(authControllerProvider.notifier).register(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          phoneNumber: _phoneController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          passwordConfirmation: _confirmPasswordController.text,
          activationKey: _activationKeyController.text.trim(),
          sendDetailsTo: _sendDetailsTo,
        );

    if (!mounted) return;

    if (success) {
      AppSnackBar.show(
        context,
        message: 'Account created successfully! Please log in.',
        type: SnackBarType.success,
      );
      context.pop();
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
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          AppStrings.driverSignup,
                          style: AppTypography.h2.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.6,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Join your fleet using your company activation key',
                          style: AppTypography.bodySm.copyWith(
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Company Activation Key Card
                        ClipRRect(
                          borderRadius: AppRadius.card,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                            child: Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF141A26).withValues(alpha: 0.82)
                                    : Colors.white.withValues(alpha: 0.92),
                                borderRadius: AppRadius.card,
                                border: Border.all(
                                  color: AppColors.primary.withValues(alpha: 0.4),
                                  width: 1.2,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withValues(alpha: 0.2),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.vpn_key_rounded, color: AppColors.primary, size: 16),
                                      ),
                                      const SizedBox(width: AppSpacing.sm),
                                      Text(
                                        AppStrings.activationKey,
                                        style: AppTypography.labelLg.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Provided by your employing dealership/company administrator.',
                                    style: AppTypography.caption.copyWith(
                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.sm),
                                  AppTextField(
                                    hint: 'e.g. 20250521045823ZNMN4B',
                                    controller: _activationKeyController,
                                    textInputAction: TextInputAction.next,
                                    validator: (v) => AppValidators.required(v, 'Activation key is required'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),

                        // Account Information Card
                        ClipRRect(
                          borderRadius: AppRadius.cardLg,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                            child: Container(
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF141A26).withValues(alpha: 0.82)
                                    : Colors.white.withValues(alpha: 0.94),
                                borderRadius: AppRadius.cardLg,
                                border: Border.all(
                                  color: isDark ? Colors.white.withValues(alpha: 0.12) : Colors.white.withValues(alpha: 0.8),
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
                                  // Name Row
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppTextField(
                                          label: AppStrings.firstName,
                                          hint: 'John',
                                          controller: _firstNameController,
                                          textInputAction: TextInputAction.next,
                                          leadingIcon: const Icon(Icons.person_outline, size: 18),
                                          validator: (v) => AppValidators.required(v, 'First name required'),
                                        ),
                                      ),
                                      const SizedBox(width: AppSpacing.sm),
                                      Expanded(
                                        child: AppTextField(
                                          label: AppStrings.lastName,
                                          hint: 'Doe',
                                          controller: _lastNameController,
                                          textInputAction: TextInputAction.next,
                                          validator: (v) => AppValidators.required(v, 'Last name required'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSpacing.md),

                                  // Email
                                  AppTextField(
                                    label: AppStrings.email,
                                    hint: 'driver@mail.com',
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    leadingIcon: const Icon(Icons.email_outlined, size: 18),
                                    validator: AppValidators.email,
                                  ),
                                  const SizedBox(height: AppSpacing.md),

                                  // Phone
                                  AppTextField(
                                    label: AppStrings.phoneNumber,
                                    hint: '+61 400 000 000',
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    leadingIcon: const Icon(Icons.phone_outlined, size: 18),
                                    validator: (v) => AppValidators.required(v, 'Phone number is required'),
                                  ),
                                  const SizedBox(height: AppSpacing.md),

                                  // Dispatch notification preference
                                  Text(
                                    'Receive Dispatch Details Via',
                                    style: AppTypography.labelLg.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textPrimaryLight,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppBounce(
                                          onTap: () => setState(() => _sendDetailsTo = 'email'),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                              color: _sendDetailsTo == 'email'
                                                  ? AppColors.primary
                                                  : (isDark ? AppColors.cardDark : AppColors.backgroundLight),
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                color: _sendDetailsTo == 'email'
                                                    ? AppColors.primary
                                                    : (isDark ? AppColors.borderDark : AppColors.borderLight),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.email_outlined,
                                                  size: 16,
                                                  color: _sendDetailsTo == 'email'
                                                      ? AppColors.white
                                                      : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  'Email',
                                                  style: AppTypography.caption.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color: _sendDetailsTo == 'email'
                                                        ? AppColors.white
                                                        : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: AppSpacing.sm),
                                      Expanded(
                                        child: AppBounce(
                                          onTap: () => setState(() => _sendDetailsTo = 'sms'),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                              color: _sendDetailsTo == 'sms'
                                                  ? AppColors.primary
                                                  : (isDark ? AppColors.cardDark : AppColors.backgroundLight),
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                color: _sendDetailsTo == 'sms'
                                                    ? AppColors.primary
                                                    : (isDark ? AppColors.borderDark : AppColors.borderLight),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.sms_outlined,
                                                  size: 16,
                                                  color: _sendDetailsTo == 'sms'
                                                      ? AppColors.white
                                                      : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  'SMS',
                                                  style: AppTypography.caption.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color: _sendDetailsTo == 'sms'
                                                        ? AppColors.white
                                                        : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSpacing.md),

                                  // Password
                                  AppTextField(
                                    label: AppStrings.password,
                                    hint: '••••••••',
                                    controller: _passwordController,
                                    obscureText: true,
                                    textInputAction: TextInputAction.next,
                                    leadingIcon: const Icon(Icons.lock_outline, size: 18),
                                    validator: AppValidators.password,
                                  ),
                                  const SizedBox(height: AppSpacing.md),

                                  // Confirm Password
                                  AppTextField(
                                    label: AppStrings.confirmPassword,
                                    hint: '••••••••',
                                    controller: _confirmPasswordController,
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    leadingIcon: const Icon(Icons.lock_reset_outlined, size: 18),
                                    validator: (v) => AppValidators.confirmPassword(v, _passwordController.text),
                                    onFieldSubmitted: (_) => _onRegister(),
                                  ),
                                  const SizedBox(height: AppSpacing.md),

                                  // Terms agreement checkbox
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        value: _agreedToTerms,
                                        activeColor: AppColors.primary,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                        onChanged: (val) => setState(() => _agreedToTerms = val ?? false),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'I agree to the AutoYard Driver Terms & Privacy Policy',
                                          style: AppTypography.caption.copyWith(
                                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSpacing.lg),

                                  // Submit Button
                                  AppButton(
                                    label: AppStrings.createAccount,
                                    fullWidth: true,
                                    isLoading: isLoading,
                                    onPressed: _onRegister,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.alreadyHaveAccount,
                              style: AppTypography.bodySm.copyWith(
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                            const SizedBox(width: 4),
                            AppBounce(
                              onTap: () => context.pop(),
                              child: Text(
                                AppStrings.login,
                                style: AppTypography.bodySm.copyWith(
                                  color: AppColors.primaryLight,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xl),
                      ],
                    ),
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
}
