import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_app/core/utils/helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.ontap, required this.text, required this.icon});
  
  final void Function()? ontap;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ColorsData.Purplecolor,
              ColorsData.Pinkcolor,
            ]
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyleData.Semibold.copyWith(fontSize: 20),
            ),
            SvgPicture.asset(icon),
          ],
        ),
      ),
    );
  }
}