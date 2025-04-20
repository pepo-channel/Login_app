import 'package:dio/dio.dart';
import 'package:signin_app/cache/cache_helper.dart';
import 'package:signin_app/core/api/api_helper.dart';

class ApiInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] = CacheHelper().getData(key: ApiKeys.token) != null? 'FOODAPI ${CacheHelper().getData(key: ApiKeys.token)}' : null; // here you sent the headers its api asked for
    super.onRequest(options, handler);
  }
}