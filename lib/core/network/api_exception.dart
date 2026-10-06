import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
sealed class ApiException with _$ApiException implements Exception {
  const factory ApiException.network({@Default('Network connection failed') String message}) = _Network;
  const factory ApiException.timeout({@Default('Connection timed out') String message}) = _Timeout;
  const factory ApiException.unauthorized({@Default('Unauthorized request') String message}) = _Unauthorized;
  const factory ApiException.serverError({required int? code, required String message}) = _ServerError;
  const factory ApiException.unknown({@Default('An unknown error occurred') String message}) = _Unknown;
}
