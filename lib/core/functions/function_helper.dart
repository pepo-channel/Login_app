import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signin_app/core/widgets/snackbar.dart';
import 'package:signin_app/cunits/user%20cubit/user_state.dart';

Future UploadXFileToApi(XFile image) async{
  return MultipartFile.fromFile(
    image.path,
    filename: image.path.split('/').last,
  );
}

  void GetCustomSnackBar({
    required BuildContext context, 
    required UserState state, 
    required String messsage, 
    required bool undo, 
    required void Function()? onaction,
    }) {
    ScaffoldMessenger.of(context).showSnackBar(CustomSnakBar(message: messsage, undo: undo, onaction: onaction,));
  }