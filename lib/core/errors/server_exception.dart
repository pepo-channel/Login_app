import 'package:dio/dio.dart';
import 'package:signin_app/core/errors/error_model.dart';

class ServerException implements Exception{
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void ThroException(DioException e) {
  switch(e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch(e.response!.data){
        case 400: //Bad Request
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 401: // Unauthorized
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 403: // Forbidden
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 404: // Not Found
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 405: // Method Not Allowed
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 429: // Too Many Requests
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 500: // Internal Server Error
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 503: // Service Unavailable
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 504: // Gateway Timeout
        throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}