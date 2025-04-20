
import 'package:signin_app/core/api/api_helper.dart';

class SigninModel {
  final String message;
  final String token;

  SigninModel({required this.message, required this.token});

  factory SigninModel.fromJson(Map<String, dynamic> json){
    return SigninModel(
      message: json[ApiKeys.message],
      token: json[ApiKeys.token],
    );
  }
}