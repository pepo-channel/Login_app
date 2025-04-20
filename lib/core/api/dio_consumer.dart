import 'package:dio/dio.dart';
import 'package:signin_app/core/api/api_consumer.dart';
import 'package:signin_app/core/api/api_helper.dart';
import 'package:signin_app/core/api/api_interceptor.dart';
import 'package:signin_app/core/errors/server_exception.dart';

class DioConsumer extends ApiConsumer{
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.BasicUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future get(String path, {dynamic data, Map<String, dynamic>? queryparameters, bool isformdata = false}) async{
    try {
      final Response = await dio.get(
        path, 
        data: isformdata? FormData.fromMap(data) : data, 
        queryParameters: queryparameters
      );
      return Response.data;
    } on DioException catch (e) {
      ThroException(e);
    }
  }

  

  @override
  Future post(String path, {dynamic data, Map<String, dynamic>? queryparameters, bool isformdata = false}) async{
    try{
      final Response = await dio.post(
        path,
        data: isformdata? FormData.fromMap(data) : data,
        queryParameters: queryparameters,
      );
      return Response.data;
    } on DioException catch(e){
      ThroException(e);
    }
  }

  @override
  Future patch(String path, {dynamic data, Map<String, dynamic>? queryparameters, bool isformdata = false}) async{
    try{
      final Response = await dio.patch(
        path,
        data: isformdata? FormData.fromMap(data) : data,
        queryParameters: queryparameters,
      );
      return Response.data;
    } on DioException catch (e) {
      ThroException(e);
    }
  }

  @override
  Future delete(String path, {dynamic data, Map<String, dynamic>? queryparameters, bool isformdata = false}) async{
    try{
      final Response = await dio.delete(
        path,
        data: isformdata? FormData.fromMap(data) : data,
        queryParameters: queryparameters,
      );
      return Response.data;
    } on DioException catch(e) {
      ThroException(e);
    }
  }
  
}