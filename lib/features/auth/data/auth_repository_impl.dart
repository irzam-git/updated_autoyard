import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import '../../../core/storage/hive_service.dart';
import '../domain/auth_repository.dart';
import '../domain/models/user_model.dart';
import 'auth_remote_datasource.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      if (user.token != null && user.token!.isNotEmpty) {
        await HiveService.saveTokens(token: user.token!);
      }
      await HiveService.saveUserData(user.toJson());

      return Right(user);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signupDriver({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String activationKey,
    String sendDetailsTo = 'email',
  }) async {
    try {
      final message = await _remoteDataSource.signupDriver(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        activationKey: activationKey,
        sendDetailsTo: sendDetailsTo,
      );
      return Right(message);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword({
    required String email,
  }) async {
    try {
      final message = await _remoteDataSource.forgotPassword(email: email);
      return Right(message);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resendVerificationEmail({
    required String email,
  }) async {
    try {
      final message = await _remoteDataSource.resendVerificationEmail(email: email);
      return Right(message);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> getCurrentUser() async {
    try {
      final token = HiveService.getAuthToken();
      if (token == null || token.isEmpty) {
        return const Right(null);
      }

      // Try fetching fresh user data from API
      try {
        final remoteUser = await _remoteDataSource.getCurrentUser();
        final updatedUser = remoteUser.copyWith(token: token);
        await HiveService.saveUserData(updatedUser.toJson());
        return Right(updatedUser);
      } on DioException {
        // Fallback to cached user if offline
        final cached = HiveService.getUserData();
        if (cached != null) {
          final cachedUser = UserModel.fromJson(cached);
          return Right(cachedUser.copyWith(token: token));
        }
        rethrow;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await HiveService.clearAuthData();
        return const Right(null);
      }
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateAccountSettings({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String sendDetailsTo,
    String? profileImagePath,
  }) async {
    try {
      final user = await _remoteDataSource.updateAccountSettings(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        sendDetailsTo: sendDetailsTo,
        profileImagePath: profileImagePath,
      );

      final token = HiveService.getAuthToken();
      final updated = user.copyWith(token: token);
      await HiveService.saveUserData(updated.toJson());

      return Right(updated);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final message = await _remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      return Right(message);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remoteDataSource.logout();
      await HiveService.clearAuthData();
      return const Right(null);
    } catch (_) {
      await HiveService.clearAuthData();
      return const Right(null);
    }
  }
}

@riverpod
AuthRepositoryImpl authRepositoryImpl(Ref ref) {
  final remote = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remote);
}
