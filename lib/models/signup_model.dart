import 'package:signin_app/core/api/api_helper.dart';

class SignupModel {
  final String message;

  SignupModel({required this.message});

  factory SignupModel.fromJson(Map<String, dynamic> json){
    return SignupModel(message: json[ApiKeys.message]);
  }
}