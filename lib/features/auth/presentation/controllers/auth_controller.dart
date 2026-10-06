import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/auth_repository_impl.dart';
import '../../domain/models/user_model.dart';

part 'auth_controller.freezed.dart';
part 'auth_controller.g.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated(UserModel user) = AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.error(String message) = AuthStateError;
  const factory AuthState.success(String message) = AuthStateSuccess;
}

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => const AuthState.initial();

  void setUser(UserModel user) {
    state = AuthState.authenticated(user);
  }

  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();
    final repo = ref.read(authRepositoryImplProvider);
    final result = await repo.getCurrentUser();
    state = result.fold(
      (failure) => const AuthState.unauthenticated(),
      (user) => user != null ? AuthState.authenticated(user) : const AuthState.unauthenticated(),
    );
  }

  Future<bool> login({required String email, required String password}) async {
    state = const AuthState.loading();
    final repo = ref.read(authRepositoryImplProvider);
    final result = await repo.login(email: email, password: password);
    return result.fold(
      (failure) {
        state = AuthState.error(failure.message);
        return false;
      },
      (user) {
        state = AuthState.authenticated(user);
        return true;
      },
    );
  }

  Future<bool> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String activationKey,
    String sendDetailsTo = 'email',
  }) async {
    state = const AuthState.loading();
    final repo = ref.read(authRepositoryImplProvider);
    final result = await repo.signupDriver(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      activationKey: activationKey,
      sendDetailsTo: sendDetailsTo,
    );
    return result.fold(
      (failure) {
        state = AuthState.error(failure.message);
        return false;
      },
      (message) {
        state = AuthState.success(message);
        return true;
      },
    );
  }

  Future<bool> forgotPassword({required String email}) async {
    state = const AuthState.loading();
    final repo = ref.read(authRepositoryImplProvider);
    final result = await repo.forgotPassword(email: email);
    return result.fold(
      (failure) {
        state = AuthState.error(failure.message);
        return false;
      },
      (message) {
        state = AuthState.success(message);
        return true;
      },
    );
  }

  Future<bool> updateAccountSettings({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String sendDetailsTo,
    String? profileImagePath,
  }) async {
    state = const AuthState.loading();
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
        state = AuthState.error(failure.message);
        return false;
      },
      (user) {
        state = AuthState.authenticated(user);
        return true;
      },
    );
  }

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    state = const AuthState.loading();
    final repo = ref.read(authRepositoryImplProvider);
    final result = await repo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    return result.fold(
      (failure) {
        state = AuthState.error(failure.message);
        return false;
      },
      (message) {
        state = AuthState.success(message);
        return true;
      },
    );
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryImplProvider);
    await repo.logout();
    state = const AuthState.unauthenticated();
  }
}
