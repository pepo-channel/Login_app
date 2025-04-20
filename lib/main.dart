import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_app/Pages/logIn/login_screen.dart';
import 'package:signin_app/Pages/profile/profile_screen.dart';
import 'package:signin_app/Pages/signup/signup_screen.dart';
import 'package:signin_app/Pages/spalsh/splash_screen.dart';
import 'package:signin_app/cache/cache_helper.dart';
import 'package:signin_app/core/api/dio_consumer.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/cunits/user%20cubit/user_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const LogInApp());
}

class LogInApp extends StatelessWidget {
  const LogInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          PageNameData.SplashScreen: (context) => SplashScreen(),
          PageNameData.LogInScreen: (context) => Loginscreen(),
          PageNameData.SignUpScreen: (context) => SignupScreen(),
          PageNameData.ProfileScreen: (context) => ProfileScreen(),
        },
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorsData.Blackcolor,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
