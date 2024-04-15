import 'package:dio/dio.dart';

class FosInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    int code = err.response?.statusCode ?? 0;
    switch (code) {
      case 401 || 403:
        break;
    }
    super.onError(err, handler);
  }
}
