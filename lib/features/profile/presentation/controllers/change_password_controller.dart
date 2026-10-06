import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/data/auth_repository_impl.dart';

part 'change_password_controller.freezed.dart';
part 'change_password_controller.g.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
    String? successMessage,
  }) = _ChangePasswordState;
}

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  @override
  ChangePasswordState build() {
    return const ChangePasswordState();
  }

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (currentPassword.isEmpty) {
      state = state.copyWith(errorMessage: 'Current password is required');
      return false;
    }
    if (newPassword.length < 8) {
      state = state.copyWith(errorMessage: 'New password must be at least 8 characters');
      return false;
    }
    if (newPassword != confirmPassword) {
      state = state.copyWith(errorMessage: 'New passwords do not match');
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null, isSuccess: false);

    final repo = ref.read(authRepositoryImplProvider);
    final result = await repo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (message) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          successMessage: message,
        );
        return true;
      },
    );
  }

  void reset() {
    state = const ChangePasswordState();
  }
}
