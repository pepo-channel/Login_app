import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_app/core/utils/helper.dart';

class CustomSnakBar extends SnackBar{
  CustomSnakBar({super.key, 
    required String message,
    required bool undo,
    required VoidCallback? onaction,
  }) : super(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 90, right: 100, left: 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      backgroundColor: ColorsData.Purplecolor,
      content: Text(
        message,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 17, color: Colors.white),
        textAlign: !undo ? TextAlign.center : null,
      ),
      duration: Duration(seconds: 2),
      action: undo ?  SnackBarAction(
        label: 'Undo',
        textColor: Colors.white,
        onPressed: onaction!,
      ) : null ,
    );
}