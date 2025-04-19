import 'package:flutter/material.dart';
import 'package:signin_app/Pages/profile/widgets/custom_bottun.dart';
import 'package:signin_app/Pages/profile/widgets/custom_field.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/core/widgets/picture_box.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              PictureBox(),
              SizedBox(height: 40,),
              // User name
              CustomField(text: 'Ibrahim'),
              SizedBox(height: 20,),
              // Email
              CustomField(text: 'user@gmail.com'),
              SizedBox(height: 20,),
              // phone number
              CustomField(text: '01xxxxxxxxx'),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'Logout',
                    ontap: () => Navigator.pushReplacementNamed(context, PageNameData.LogInScreen),
                    icon: AssetsData.AlogoutIcon,
                  ),
                  CustomButton(
                    text: 'Delete acount!',
                    ontap: () => Navigator.pushReplacementNamed(context, PageNameData.SignUpScreen),
                    icon: AssetsData.AdeleteIcon,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              InkWell(
                // onTap: () => Navigator.pushReplacementNamed(context, PageNameData.SignUpScreen),
                child: Text('Change password', style: TextStyleData.Medium.copyWith(color: Colors.blue),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}