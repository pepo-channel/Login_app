import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_app/core/utils/helper.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.text, this.ontap});
  final String text;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width, present: 315),
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
            SvgPicture.asset(AssetsData.AloginIcon),
          ],
        ),
      ),
    );
  }
}