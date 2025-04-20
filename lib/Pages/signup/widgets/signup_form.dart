import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/core/widgets/picture_box.dart';
import 'package:signin_app/core/widgets/submit_button.dart';
import 'package:signin_app/core/widgets/text_form_field.dart';
import 'package:signin_app/cunits/user%20cubit/user_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: context.read<UserCubit>().signup_form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text('Get Started Free', style: TextStyleData.Semibold,),
                Text('Free Forever. No Credit Card Needed', style: TextStyleData.Medium,),
                SizedBox(height: 20,),
                PictureBox(),
                // User name
                GlobalTextFormField(
                  label: 'Username',
                  hinttext: 'Ibrahim....',
                  preffixicon: AssetsData.ApersonIcon,
                  textInputType: TextInputType.text,
                  textEditingController: context.read<UserCubit>().signup_name,
                ),
                SizedBox(height: 20,),
                // Email
                GlobalTextFormField(
                  label: 'Email',
                  hinttext: 'user@gmail.com',
                  preffixicon: AssetsData.AemailIcon,
                  textInputType: TextInputType.emailAddress,
                  textEditingController: context.read<UserCubit>().signup_email,
                ),
                SizedBox(height: 20,),
                // phone number
                GlobalTextFormField(
                  label: 'Phone number',
                  hinttext: '01xxxxxxxxx',
                  preffixicon: AssetsData.AnumberIcon,
                  textInputType: TextInputType.number,
                  textEditingController: context.read<UserCubit>().signup_phone,
                ),
                SizedBox(height: 20,),
                // passwrod
                GlobalTextFormField(
                  label: 'Password',
                  hinttext: 'Enter yourpassword',
                  preffixicon: AssetsData.AkeyIcon,
                  textInputType: TextInputType.visiblePassword,
                  textEditingController: context.read<UserCubit>().signup_password,
                ),
                SizedBox(height: 20,),
                // confirm passwrod
                GlobalTextFormField(
                  label: 'Confirm password',
                  hinttext: 'Confrim your password',
                  preffixicon: AssetsData.AkeyIcon,
                  textInputType: TextInputType.visiblePassword,
                  textEditingController: context.read<UserCubit>().signup_confirmpassword,
                ),
                SizedBox(height: 30,),
                SubmitButton(
                  text: 'SignUp ',
                  ontap: () => Navigator.pushNamed(context, PageNameData.ProfileScreen),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, PageNameData.LogInScreen),
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
