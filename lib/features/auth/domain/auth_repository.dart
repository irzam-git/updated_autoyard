import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import 'models/user_model.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signupDriver({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String activationKey,
    String sendDetailsTo = 'email',
  });

  Future<Either<Failure, String>> forgotPassword({
    required String email,
  });

  Future<Either<Failure, String>> resendVerificationEmail({
    required String email,
  });

  Future<Either<Failure, UserModel?>> getCurrentUser();

  Future<Either<Failure, UserModel>> updateAccountSettings({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String sendDetailsTo,
    String? profileImagePath,
  });

  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });

  Future<Either<Failure, void>> logout();
}

@riverpod
AuthRepository authRepository(Ref ref) {
  throw UnimplementedError('authRepositoryProvider must be implemented in data layer');
}
