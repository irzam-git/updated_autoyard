import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:start/core/error/failure.dart';

void main() {
  group('Failure.fromDioException mapping tests', () {
    test('maps 401 response to UnauthorizedFailure with custom message', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 401,
          data: {'message': 'Invalid credentials provided'},
        ),
      );

      final failure = Failure.fromDioException(dioException);

      expect(failure, isA<UnauthorizedFailure>());
      expect(failure.message, 'Invalid credentials provided');
    });

    test('maps 422 validation response with field errors array into combined message', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/vehicle/create'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/vehicle/create'),
          statusCode: 422,
          data: {
            'message': 'Validation failed',
            'errors': {
              'registration_number': ['The registration number field is required.'],
              'price': ['The price must be a number.'],
            },
          },
        ),
      );

      final failure = Failure.fromDioException(dioException);

      expect(failure, isA<ValidationFailure>());
      expect(failure.message.contains('The registration number field is required.'), true);
      expect(failure.message.contains('The price must be a number.'), true);
    });

    test('maps connection timeout to TimeoutFailure', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/timeout'),
        type: DioExceptionType.connectionTimeout,
      );

      final failure = Failure.fromDioException(dioException);

      expect(failure, isA<TimeoutFailure>());
    });
  });
}
