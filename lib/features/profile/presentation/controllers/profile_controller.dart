import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/data/auth_repository_impl.dart';
import '../../../auth/domain/models/user_model.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

part 'profile_controller.freezed.dart';
part 'profile_controller.g.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    UserModel? user,
    String? errorMessage,
    String? successMessage,
  }) = _ProfileState;
}

@riverpod
class ProfileController extends _$ProfileController {
  @override
  ProfileState build() {
    final authState = ref.watch(authControllerProvider);
    final user = authState is AuthStateAuthenticated ? authState.user : null;
    return ProfileState(user: user);
  }

  Future<void> refreshProfile() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final repo = ref.read(authRepositoryImplProvider);
    final result = await repo.getCurrentUser();

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
      (user) {
        if (user != null) {
          // Update global auth state cache as well
          ref.read(authControllerProvider.notifier).setUser(user);
        }
        state = state.copyWith(
          isLoading: false,
          user: user,
          errorMessage: null,
        );
      },
    );
  }

  Future<bool> updateProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String sendDetailsTo,
    String? profileImagePath,
  }) async {
    state = state.copyWith(isUpdating: true, errorMessage: null, successMessage: null);

    final repo = ref.read(authRepositoryImplProvider);
    final result = await repo.updateAccountSettings(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      sendDetailsTo: sendDetailsTo,
      profileImagePath: profileImagePath,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          isUpdating: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (updatedUser) {
        ref.read(authControllerProvider.notifier).setUser(updatedUser);
        state = state.copyWith(
          isUpdating: false,
          user: updatedUser,
          successMessage: 'Profile updated successfully',
        );
        return true;
      },
    );
  }

  Future<void> updateDispatchPreference(String preference) async {
    final currentUser = state.user;
    if (currentUser == null) return;

    await updateProfile(
      firstName: currentUser.firstName ?? '',
      lastName: currentUser.lastName ?? '',
      phoneNumber: currentUser.phoneNumber ?? '',
      sendDetailsTo: preference,
    );
  }

  Future<void> pickAndUploadAvatar(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (picked != null) {
        final currentUser = state.user;
        if (currentUser == null) return;

        await updateProfile(
          firstName: currentUser.firstName ?? '',
          lastName: currentUser.lastName ?? '',
          phoneNumber: currentUser.phoneNumber ?? '',
          sendDetailsTo: currentUser.driverDetails?.sendDetailsTo ?? 'email',
          profileImagePath: picked.path,
        );
      }
    } catch (e) {
      state = state.copyWith(errorMessage: 'Could not pick image: $e');
    }
  }
}
