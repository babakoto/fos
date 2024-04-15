import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class AppInterceptors extends Interceptor {
  final bool isDebug;

  AppInterceptors({this.isDebug = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final dateFormat = DateFormat('HH:mm:ss');
    final String uri = "${options.uri}";
    log("🛜${options.method} ${options.uri} ${dateFormat.format(DateTime.now())} ${options.headers}", name: "Request");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final dateFormat = DateFormat('HH:mm:ss');
    return handler.next(response);
  }
}
