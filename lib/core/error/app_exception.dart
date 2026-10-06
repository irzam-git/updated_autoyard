sealed class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;

  const AppException(this.message, {this.statusCode, this.originalError});

  @override
  String toString() => 'AppException: $message (code: $statusCode)';
}

class NetworkException extends AppException {
  const NetworkException({String message = 'Network connection failure', dynamic originalError})
      : super(message, originalError: originalError);
}

class TimeoutException extends AppException {
  const TimeoutException({String message = 'Connection timeout', dynamic originalError})
      : super(message, originalError: originalError);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({String message = 'Unauthorized', int? statusCode = 401})
      : super(message, statusCode: statusCode);
}

class ServerException extends AppException {
  const ServerException({String message = 'Server error occurred', int? statusCode = 500, dynamic originalError})
      : super(message, statusCode: statusCode, originalError: originalError);
}

class CacheException extends AppException {
  const CacheException({String message = 'Cache read/write failure', dynamic originalError})
      : super(message, originalError: originalError);
}

class ValidationException extends AppException {
  const ValidationException({required String message})
      : super(message);
}
