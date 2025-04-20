import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors data
abstract class ColorsData {
  static const Blackcolor = Color(0xff151316);
  static const whitecolor = Color(0xffEFEFEF);
  static const Greycolor = Color(0xffA4A4A4);
  static const Pinkcolor = Color(0xffC45647);
  static const Purplecolor = Color(0xffB379DF);
}

// assets data
abstract class AssetsData {
  // pngs
  static const Logo = 'assets/Logo.png';
  static const LoginLogo = 'assets/login.png';
  static const LoginLightLogo = 'assets/login_lights.png';
  static const SignupLogo = 'assets/SignUp.png';
  static const SignupLightLogo = 'assets/Signup_lights.png';
  static const AvatarImage = 'assets/avatar.jpg';
  // svgs
  static const ApersonIcon = 'assets/person.svg';
  static const AkeyIcon = 'assets/key.svg';
  static const AeyeIcon = 'assets/eye.svg';
  static const AhiddenIcon = 'assets/eye_hidden.svg';
  static const AloginIcon = 'assets/login.svg';
  static const AemailIcon = 'assets/email.svg';
  static const AnumberIcon = 'assets/number.svg';
  static const AprofileIcon = 'assets/profile_pic.svg';
  static const AlogoutIcon = 'assets/logout.svg';
  static const AdeleteIcon = 'assets/delete.svg';
  static const AeditIcon = 'assets/edit.svg';
}

// textstyle data
abstract class TextStyleData {
  static TextStyle Semibold = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 40,
    color: ColorsData.whitecolor,
  );
  static TextStyle Medium = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: ColorsData.Greycolor,
  );
}

// pagename data
abstract class PageNameData {
  static const SplashScreen = 'SplashScreen';
  static const LogInScreen = 'LogInScreen';
  static const SignUpScreen = 'SignUpScreen';
  static const ProfileScreen = 'ProfileScreen';
}

// specialwords data
abstract class SpecialWordsData {
  static const Height = 'height';
  static const Width = 'width';
}

// constants data
abstract class constantsData {
  static const ScreenHeight = 932; // screen height form design
  static const ScreenWidht = 430; // screen width form design
}

// functions data
class FunctionsData {

  // mediaquery function 
  static double MediaQueryData({required BuildContext context, required String axis, double? present}) {

    if(axis == SpecialWordsData.Width){
      if(present != null){
        // Divide the width by the screen width and get the ratio
        double ratio = present / constantsData.ScreenWidht;
        return MediaQuery.of(context).size.width * ratio;
      }
      return MediaQuery.of(context).size.width;
    }
    else {
      if(present != null){
        // Divide the height by the screen height and get the ratio.
        double ratio = present / constantsData.ScreenHeight;
        return MediaQuery.of(context).size.height * ratio;
      }
      return MediaQuery.of(context).size.height;
    }
  }

}

