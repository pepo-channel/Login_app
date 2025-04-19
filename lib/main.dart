import 'package:flutter/material.dart';
import 'package:signin_app/Pages/logIn/login_screen.dart';
import 'package:signin_app/Pages/profile/profile_screen.dart';
import 'package:signin_app/Pages/signup/signup_screen.dart';
import 'package:signin_app/Pages/spalsh/splash_screen.dart';
import 'package:signin_app/core/utils/helper.dart';

void main() {
  runApp(const LogInApp());
}

class LogInApp extends StatelessWidget {
  const LogInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        PageNameData.SplashScreen : (context) => SplashScreen(),
        PageNameData.LogInScreen : (context) => Loginscreen(),
        PageNameData.SignUpScreen : (context) => SignupScreen(),
        PageNameData.ProfileScreen : (context) => ProfileScreen(),
      },
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: ColorsData.Blackcolor),
      home: SplashScreen(),
    );
  }

}