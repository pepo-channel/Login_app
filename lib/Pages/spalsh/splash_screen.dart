import 'dart:async';
import 'package:flutter/material.dart';
import 'package:signin_app/core/utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, PageNameData.SignUpScreen),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width),
        height: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsData.Blackcolor,
              ColorsData.Purplecolor
            ],
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsData.Logo, height: 100,),
              SizedBox(height: 10,),
              Text('Login App', style: TextStyleData.Semibold.copyWith(fontSize: 30),),
            ],
          ),
        ),
      ),
    );
  }
}