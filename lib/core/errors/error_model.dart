import 'package:signin_app/core/api/api_helper.dart';

class ErrorModel {
  int statuscode;
  String errormsg;

  ErrorModel({required this.statuscode, required this.errormsg});

  factory ErrorModel.fromJson(Map<String, dynamic> json){
    return ErrorModel(
      statuscode: json[ApiKeys.status],
      errormsg: json[ApiKeys.ErrorMessage],
    );
  }
}