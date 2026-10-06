import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/dio_client.dart';
import '../domain/models/auth_response_model.dart';
import '../domain/models/user_model.dart';

part 'auth_remote_datasource.g.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<String> signupDriver({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String activationKey,
    String sendDetailsTo = 'email',
  });
  Future<String> forgotPassword({required String email});
  Future<String> resendVerificationEmail({required String email});
  Future<UserModel> getCurrentUser();
  Future<UserModel> updateAccountSettings({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String sendDetailsTo,
    String? profileImagePath,
  });
  Future<String> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final formData = FormData.fromMap({
      'email': email.trim(),
      'password': password,
    });

    final response = await _dio.post(
      '/auth/authenticate',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final authResponse = AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
    final user = authResponse.data?.user;
    final token = authResponse.data?.authorisation?.token;

    if (user == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: authResponse.message ?? 'Login failed to return user data',
      );
    }

    return user.copyWith(token: token);
  }

  @override
  Future<String> signupDriver({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String activationKey,
    String sendDetailsTo = 'email',
  }) async {
    final formData = FormData.fromMap({
      'first_name': firstName.trim(),
      'last_name': lastName.trim(),
      'phone_number': phoneNumber.trim(),
      'email': email.trim(),
      'password': password,
      'password_confirmation': passwordConfirmation,
      'send_details_to': sendDetailsTo,
      'activation_key': activationKey.trim(),
    });

    final response = await _dio.post(
      '/auth/signup_driver',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    return (data['message'] as String?) ?? 'Registration submitted successfully';
  }

  @override
  Future<String> forgotPassword({required String email}) async {
    final formData = FormData.fromMap({
      'email': email.trim(),
    });

    final response = await _dio.post(
      '/auth/forgot-password',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    return (data['message'] as String?) ?? 'Password reset link sent to your email';
  }

  @override
  Future<String> resendVerificationEmail({required String email}) async {
    final formData = FormData.fromMap({
      'email': email.trim(),
    });

    final response = await _dio.post(
      '/auth/resend-verification-email',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    return (data['message'] as String?) ?? 'Verification email sent';
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await _dio.get(
      '/auth/get-user',
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    final userData = data['data']?['user'] as Map<String, dynamic>?;
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'Failed to retrieve current user',
    );
  }

  @override
  Future<UserModel> updateAccountSettings({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String sendDetailsTo,
    String? profileImagePath,
  }) async {
    final map = <String, dynamic>{
      'first_name': firstName.trim(),
      'last_name': lastName.trim(),
      'phone_number': phoneNumber.trim(),
      'send_details_to': sendDetailsTo,
    };

    if (profileImagePath != null && profileImagePath.isNotEmpty) {
      map['profile_image'] = await MultipartFile.fromFile(profileImagePath);
    }

    final formData = FormData.fromMap(map);

    final response = await _dio.post(
      '/auth/account-settings',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    final userData = data['data']?['user'] as Map<String, dynamic>?;
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'Failed to update profile settings',
    );
  }

  @override
  Future<String> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final formData = FormData.fromMap({
      'current_password': currentPassword,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
      'password_confirmation': confirmPassword,
    });

    final response = await _dio.post(
      '/auth/change-password',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    return (data['message'] as String?) ?? 'Password updated successfully';
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post(
        '/auth/logout',
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );
    } catch (_) {}
  }
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return AuthRemoteDataSourceImpl(dio);
}
