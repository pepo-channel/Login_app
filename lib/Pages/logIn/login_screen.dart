import 'package:flutter/material.dart';
import 'package:signin_app/Pages/logIn/widgets/login_form.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/core/widgets/light_point.dart';

import '../../core/widgets/blur_container.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width),
        height: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height),
        child: Stack(
          children: [
            // top left point light
            Positioned(
              left: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width, present: 295),
              top: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height, present: 127),
              child: LightPoint(color: ColorsData.Purplecolor),
            ),
            // bottom left point light
            Positioned(
              left: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width, present: 295),
              top: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height, present: 745),
              child: LightPoint(color: ColorsData.Purplecolor),
            ),
            // bottom right point light
            Positioned(
              right: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width, present: 295),
              top: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height, present: 745),
              child: LightPoint(color: ColorsData.Pinkcolor),
            ),
            // logo image
            Container(
              width: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width),
              height: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height, present: 393),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsData.LoginLogo), fit: BoxFit.cover),
              ),
            ),
            // logo_light image
            Positioned(
              top: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height, present: 197),
              child: Image.asset(
                AssetsData.LoginLightLogo,
                width: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width),
              ),
            ),
            // form
            BlurContainer(child_widget: LoginForm(), hightpresent: 680,),
          ],
        ),
      ),
    );
  }
}

