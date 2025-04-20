import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['accept-language'] = 'ar'; // here you sent the headers its api asked for
    super.onRequest(options, handler);
  }
}