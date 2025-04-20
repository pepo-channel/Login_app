import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_app/core/functions/function_helper.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/core/widgets/picture_box.dart';
import 'package:signin_app/core/widgets/snackbar.dart';
import 'package:signin_app/core/widgets/submit_button.dart';
import 'package:signin_app/core/widgets/text_form_field.dart';
import 'package:signin_app/cunits/user%20cubit/user_cubit.dart';
import 'package:signin_app/cunits/user%20cubit/user_state.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isloading = false;
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if(state is SignupLoadingState){
          isloading = true;
        } if(state is SignupSuccessState){
          isloading = false;
          GetCustomSnackBar(context: context, state: state, messsage: state.successmsg, undo: false, onaction: null);
          Navigator.pushReplacementNamed(context, PageNameData.LogInScreen);
        } if(state is SignupFailedState){
          isloading = false;
          GetCustomSnackBar(context: context, state: state, messsage: state.errormsg, undo: false, onaction: null);
        }
      },
      builder: (context, state) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: context.read<UserCubit>().signup_form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text('Get Started Free', style: TextStyleData.Semibold),
                    Text(
                      'Free Forever. No Credit Card Needed',
                      style: TextStyleData.Medium,
                    ),
                    SizedBox(height: 20),
                    PictureBox(),
                    // User name
                    GlobalTextFormField(
                      label: 'Username',
                      hinttext: 'Ibrahim....',
                      preffixicon: AssetsData.ApersonIcon,
                      textInputType: TextInputType.text,
                      textEditingController:
                          context.read<UserCubit>().signup_name,
                    ),
                    SizedBox(height: 20),
                    // Email
                    GlobalTextFormField(
                      label: 'Email',
                      hinttext: 'user@gmail.com',
                      preffixicon: AssetsData.AemailIcon,
                      textInputType: TextInputType.emailAddress,
                      textEditingController:
                          context.read<UserCubit>().signup_email,
                    ),
                    SizedBox(height: 20),
                    // phone number
                    GlobalTextFormField(
                      label: 'Phone number',
                      hinttext: '01xxxxxxxxx',
                      preffixicon: AssetsData.AnumberIcon,
                      textInputType: TextInputType.number,
                      textEditingController:
                          context.read<UserCubit>().signup_phone,
                    ),
                    SizedBox(height: 20),
                    // passwrod
                    GlobalTextFormField(
                      label: 'Password',
                      hinttext: 'Enter yourpassword',
                      preffixicon: AssetsData.AkeyIcon,
                      textInputType: TextInputType.visiblePassword,
                      textEditingController:
                          context.read<UserCubit>().signup_password,
                    ),
                    SizedBox(height: 20),
                    // confirm passwrod
                    GlobalTextFormField(
                      label: 'Confirm password',
                      hinttext: 'Confrim your password',
                      preffixicon: AssetsData.AkeyIcon,
                      textInputType: TextInputType.visiblePassword,
                      textEditingController:
                          context.read<UserCubit>().signup_confirmpassword,
                    ),
                    SizedBox(height: 30),
                    isloading? CircularProgressIndicator() : SubmitButton(
                      text: 'SignUp ',
                      ontap:
                          () =>context.read<UserCubit>().signup_form.currentState!.validate()? context.read<UserCubit>().signup() : null,
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap:
                          () => Navigator.pushReplacementNamed(
                            context,
                            PageNameData.LogInScreen,
                          ),
                      child: Text(
                        'Already have an acount!',
                        style: TextStyleData.Medium.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
