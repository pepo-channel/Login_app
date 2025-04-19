
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_app/core/utils/helper.dart';

class PictureBox extends StatelessWidget {
  const PictureBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: ColorsData.Greycolor,
        shape: BoxShape.circle,
      ),
      child: Stack(children: [
        Positioned(
          top: 10,
          right: 10,
          child: SvgPicture.asset(AssetsData.AprofileIcon, width: 80,),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle
            ),
            child: Center(child: Icon(Icons.add),),
          ),
        ),
      ],),
    );
  }
}
