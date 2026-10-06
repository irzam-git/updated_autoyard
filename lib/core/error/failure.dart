import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({@Default('Network connection failed. Please check your internet.') String message}) = NetworkFailure;
  const factory Failure.timeout({@Default('Request timed out. Please try again.') String message}) = TimeoutFailure;
  const factory Failure.unauthorized({@Default('Session expired. Please log in again.') String message}) = UnauthorizedFailure;
  const factory Failure.serverError({required String message, int? statusCode}) = ServerFailure;
  const factory Failure.validation({required String message}) = ValidationFailure;
  const factory Failure.cache({@Default('Cache error occurred.') String message}) = CacheFailure;
  const factory Failure.unknown({@Default('An unexpected error occurred.') String message}) = UnknownFailure;

  static Failure fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.timeout();
      case DioExceptionType.connectionError:
        return const Failure.network();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          final dynamic data = e.response?.data;
          String unauthMsg = 'Session expired or unauthorized. Please log in again.';
          if (data is Map<String, dynamic> && data['message'] != null) {
            unauthMsg = data['message'].toString();
          }
          return Failure.unauthorized(message: unauthMsg);
        }
        final dynamic data = e.response?.data;
        String message = 'Server error occurred.';
        if (data is Map<String, dynamic>) {
          final errorList = <String>[];

          // AutoYard returns validation error map in data['data'] or data['errors']
          dynamic errorsSource = data['errors'];
          if (errorsSource == null && data['data'] is Map<String, dynamic> && (data['error'] == 1 || statusCode == 422)) {
            errorsSource = data['data'];
          }

          if (errorsSource is Map) {
            errorsSource.forEach((key, val) {
              if (val is List) {
                errorList.addAll(val.map((v) => v.toString()));
              } else if (val != null) {
                errorList.add(val.toString());
              }
            });
          } else if (errorsSource is List) {
            errorList.addAll(errorsSource.map((v) => v.toString()));
          }

          if (errorList.isNotEmpty) {
            message = errorList.join('\n');
          } else if (data['message'] != null && data['message'].toString().trim().isNotEmpty) {
            message = data['message'].toString();
          } else if (data['error'] is String && data['error'].toString().trim().isNotEmpty) {
            message = data['error'].toString();
          }
        } else if (e.message != null) {
          message = e.message!;
        }
        if (statusCode == 422 || (data is Map && data['error'] == 1 && (data['message'] == 'Validation Errors Found!' || data['message']?.toString().toLowerCase().contains('validation') == true))) {
          return Failure.validation(message: message);
        }
        return Failure.serverError(message: message, statusCode: statusCode);
      case DioExceptionType.cancel:
        return const Failure.unknown(message: 'Request was cancelled.');
      default:
        return Failure.unknown(message: e.message ?? 'Unknown network error');
    }
  }
}
