import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../components/app_bounce.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_snackbar.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_shadows.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../auth/domain/models/user_model.dart';
import '../controllers/profile_controller.dart';

class EditProfileDialog extends ConsumerStatefulWidget {
  final UserModel user;

  const EditProfileDialog({super.key, required this.user});

  static Future<void> show(BuildContext context, UserModel user) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditProfileDialog(user: user),
    );
  }

  @override
  ConsumerState<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends ConsumerState<EditProfileDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late String _sendDetailsTo;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.user.firstName ?? '');
    _lastNameController = TextEditingController(text: widget.user.lastName ?? '');
    _phoneController = TextEditingController(text: widget.user.phoneNumber ?? '');
    _sendDetailsTo = widget.user.driverDetails?.sendDetailsTo ?? 'email';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(profileControllerProvider.notifier).updateProfile(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      phoneNumber: _phoneController.text.trim(),
      sendDetailsTo: _sendDetailsTo,
    );

    if (success && mounted) {
      Navigator.of(context).pop();
      AppSnackBar.show(
        context,
        message: 'Profile updated successfully!',
        type: SnackBarType.success,
      );
    } else if (!success && mounted) {
      final error = ref.read(profileControllerProvider).errorMessage ?? 'Failed to update profile';
      AppSnackBar.show(
        context,
        message: error,
        type: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final state = ref.watch(profileControllerProvider);

    final bgColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
    final textPrimary = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textSecondary = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppRadius.sheet,
        boxShadow: isDark ? AppShadows.darkCard : AppShadows.modal,
      ),
      padding: EdgeInsets.only(
        top: AppSpacing.md,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                decoration: BoxDecoration(
                  color: textSecondary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: AppShadows.primaryGlow,
                  ),
                  child: const Icon(Icons.edit_rounded, color: AppColors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'Edit Profile',
                  style: AppTypography.h4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            if (state.errorMessage != null)
              Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, size: 18, color: AppColors.error),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        state.errorMessage!,
                        style: AppTypography.bodySm.copyWith(color: AppColors.error),
                      ),
                    ),
                  ],
                ),
              ),

            // First Name & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(borderRadius: AppRadius.input),
                      filled: true,
                      fillColor: isDark ? AppColors.cardDark : AppColors.backgroundLight,
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(borderRadius: AppRadius.input),
                      filled: true,
                      fillColor: isDark ? AppColors.cardDark : AppColors.backgroundLight,
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Phone Number
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(borderRadius: AppRadius.input),
                filled: true,
                fillColor: isDark ? AppColors.cardDark : AppColors.backgroundLight,
              ),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Phone number required' : null,
            ),
            const SizedBox(height: AppSpacing.md),

            // Dispatch Preference
            Text(
              'Dispatch Notifications Method',
              style: AppTypography.labelSm.copyWith(
                fontWeight: FontWeight.w600,
                color: textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: AppBounce(
                    onTap: () => setState(() => _sendDetailsTo = 'email'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: _sendDetailsTo == 'email' ? AppColors.primaryGradient : null,
                        color: _sendDetailsTo != 'email'
                            ? (isDark ? AppColors.cardDark : AppColors.backgroundLight)
                            : null,
                        borderRadius: AppRadius.button,
                        boxShadow: _sendDetailsTo == 'email' ? AppShadows.primaryGlow : null,
                        border: Border.all(
                          color: _sendDetailsTo == 'email' ? Colors.transparent : borderColor,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 18,
                            color: _sendDetailsTo == 'email' ? AppColors.white : textSecondary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Email',
                            style: AppTypography.bodyMd.copyWith(
                              fontWeight: FontWeight.w700,
                              color: _sendDetailsTo == 'email' ? AppColors.white : textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppBounce(
                    onTap: () => setState(() => _sendDetailsTo = 'sms'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: _sendDetailsTo == 'sms' ? AppColors.primaryGradient : null,
                        color: _sendDetailsTo != 'sms'
                            ? (isDark ? AppColors.cardDark : AppColors.backgroundLight)
                            : null,
                        borderRadius: AppRadius.button,
                        boxShadow: _sendDetailsTo == 'sms' ? AppShadows.primaryGlow : null,
                        border: Border.all(
                          color: _sendDetailsTo == 'sms' ? Colors.transparent : borderColor,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sms_outlined,
                            size: 18,
                            color: _sendDetailsTo == 'sms' ? AppColors.white : textSecondary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'SMS',
                            style: AppTypography.bodyMd.copyWith(
                              fontWeight: FontWeight.w700,
                              color: _sendDetailsTo == 'sms' ? AppColors.white : textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.xl),

            AppButton(
              label: 'Save Changes',
              isLoading: state.isUpdating,
              variant: ButtonVariant.primary,
              icon: const Icon(Icons.check_rounded, size: 18, color: Colors.white),
              onPressed: state.isUpdating ? null : _submit,
            ),
          ],
        ),
      ),
      ),
    );
  }
}

