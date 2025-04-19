import 'package:flutter/material.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/core/widgets/submit_button.dart';
import 'package:signin_app/core/widgets/text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            // key: ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text('Welcome Back!', style: TextStyleData.Semibold,),
                Text('welcome back we missed you', style: TextStyleData.Medium,),
                SizedBox(height: 20,),
                // email
                GlobalTextFormField(
                  label: 'Email',
                  hinttext: 'Email',
                  preffixicon: AssetsData.ApersonIcon,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20,),
                GlobalTextFormField(
                  label: 'password',
                  hinttext: 'password',
                  preffixicon: AssetsData.AkeyIcon,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 30,),
                SubmitButton(
                  text: 'Login ',
                  // ontap: () =>,
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, PageNameData.SignUpScreen),
                  child: Text('Already have an acount!', style: TextStyleData.Medium.copyWith(color: Colors.blue),),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}