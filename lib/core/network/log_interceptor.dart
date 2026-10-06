import 'package:dio/dio.dart';
import '../utils/logger.dart';

class AppLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.debug('🌐 [DIO REQ] [${options.method}] ${options.baseUrl}${options.path} | Data: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.debug('✅ [DIO RES] [${response.statusCode}] ${response.requestOptions.path} | Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.error('❌ [DIO ERR] [${err.response?.statusCode}] ${err.requestOptions.path} | ${err.message}', err);
    handler.next(err);
  }
}
