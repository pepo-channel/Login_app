import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_app/core/utils/helper.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.text, this.ontap});
  final String text;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text, style: TextStyleData.Medium.copyWith(fontSize: 16),),
              InkWell(
                onTap: ontap,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        ColorsData.Purplecolor,
                        ColorsData.Pinkcolor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: SvgPicture.asset(AssetsData.AeditIcon, height: 25, width: 25,),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Container(margin: EdgeInsets.symmetric(horizontal: 20), height: 2, color: ColorsData.Greycolor,),
      ],
    );
  }
}