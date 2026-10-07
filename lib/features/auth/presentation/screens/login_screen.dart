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
import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.1, 0.8, curve: Curves.easeOut),
      ),
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.18),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.1, 0.9, curve: Curves.easeOutCubic),
      ),
    );

    _scaleAnim = Tween<double>(begin: 0.94, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.1, 0.9, curve: Curves.easeOutCubic),
      ),
    );

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.hideKeyboard();
      ref.read(authControllerProvider.notifier).login(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
    }
  }

  void _fillTestCredentials() {
    _emailController.text = 'fawaz.pixelz360@gmail.com';
    _passwordController.text = 'password';
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState is AuthStateLoading;

    ref.listen<AuthState>(authControllerProvider, (previous, next) {
      if (next is AuthStateError) {
        AppSnackBar.show(
          context,
          message: next.message,
          type: SnackBarType.error,
        );
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF1B88F0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ==========================================
          // 1. TRUCK PICTURE BACKGROUND (BRIGHT & CLEAR)
          // ==========================================
          Image.asset(
            AppAssets.truckPicture,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) => Container(
              color: const Color(0xFF1B88F0),
            ),
          ),

          // ==========================================
          // 2. ANIMATED LOGIN FORM & CONTROLS
          // ==========================================
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.md,
                ),
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: ScaleTransition(
                      scale: _scaleAnim,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: AppSpacing.xs),

                            // --- APP HEADER ---
                            Text(
                              'Auto Yard',
                              textAlign: TextAlign.center,
                              style: AppTypography.h1.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.6,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.35),
                                    blurRadius: 12,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              AppStrings.loginSubtitle,
                              textAlign: TextAlign.center,
                              style: AppTypography.bodySm.copyWith(
                                color: Colors.white.withValues(alpha: 0.92),
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSpacing.lg),

                            // --- WHITE / GLASS LOGIN CARD ---
                            ClipRRect(
                              borderRadius: AppRadius.cardLg,
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.lg,
                                    vertical: AppSpacing.xl,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.94),
                                    borderRadius: AppRadius.cardLg,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF023E8A).withValues(alpha: 0.25),
                                        blurRadius: 28,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        AppStrings.login,
                                        style: AppTypography.h2.copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: const Color(0xFF0F172A),
                                        ),
                                      ),
                                      const SizedBox(height: AppSpacing.md),
                                      AppTextField(
                                        label: AppStrings.email,
                                        hint: 'driver@mail.com',
                                        controller: _emailController,
                                        keyboardType: TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        leadingIcon: const Icon(Icons.email_outlined, size: 20),
                                        validator: AppValidators.email,
                                      ),
                                      const SizedBox(height: AppSpacing.md),
                                      AppTextField(
                                        label: AppStrings.password,
                                        hint: '••••••••',
                                        controller: _passwordController,
                                        obscureText: true,
                                        textInputAction: TextInputAction.done,
                                        leadingIcon: const Icon(Icons.lock_outline_rounded, size: 20),
                                        validator: AppValidators.password,
                                        onFieldSubmitted: (_) => _onLogin(),
                                      ),
                                      const SizedBox(height: 4),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () => context.push(AppRoutes.forgotPassword),
                                          child: Text(
                                            AppStrings.forgotPassword,
                                            style: AppTypography.caption.copyWith(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: AppSpacing.sm),
                                      AppButton(
                                        label: AppStrings.login,
                                        fullWidth: true,
                                        isLoading: isLoading,
                                        onPressed: _onLogin,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: AppSpacing.md),

                            // --- QUICK DEMO AUTOFILL ---
                            Center(
                              child: AppBounce(
                                onTap: _fillTestCredentials,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.22),
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      color: Colors.white.withValues(alpha: 0.6),
                                      width: 1.2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.flash_on_rounded,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Autofill Demo Driver Account',
                                        style: AppTypography.caption.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: AppSpacing.md),

                            // --- SIGN UP LINK ---
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.dontHaveAccount,
                                  style: AppTypography.bodySm.copyWith(
                                    color: Colors.white.withValues(alpha: 0.95),
                                    fontWeight: FontWeight.w500,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withValues(alpha: 0.3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 4),
                                AppBounce(
                                  onTap: () => context.push(AppRoutes.register),
                                  child: Text(
                                    AppStrings.signUpWithKey,
                                    style: AppTypography.bodySm.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withValues(alpha: 0.35),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
