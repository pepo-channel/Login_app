import 'package:signin_app/core/api/api_helper.dart';

class UserModel {
  final String profilepic;
  final String name;
  final String email;
  final String phone;
  final String password;

  UserModel({required this.profilepic, required this.name, required this.email, required this.phone, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      profilepic: json[ApiKeys.user][ApiKeys.profilePic], 
      name: json[ApiKeys.user][ApiKeys.name], 
      email: json[ApiKeys.user][ApiKeys.email],
      phone: json[ApiKeys.user][ApiKeys.phone],
      password: json[ApiKeys.user][ApiKeys.password],
      );
  }
}