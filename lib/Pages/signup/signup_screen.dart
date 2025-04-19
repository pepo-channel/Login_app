import 'package:flutter/material.dart';
import 'package:signin_app/Pages/signup/widgets/signup_form.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/core/widgets/blur_container.dart';
import 'package:signin_app/core/widgets/light_point.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
            // signup light
            Image.asset(
              AssetsData.SignupLightLogo,
              width: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width),
              height: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height, present: 393),
            ),
            // signup
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                AssetsData.SignupLogo, height: 240,
              ),
            ),
            BlurContainer(child_widget: SignupForm()),
          ],
        ),
      ),
    );
  }
}