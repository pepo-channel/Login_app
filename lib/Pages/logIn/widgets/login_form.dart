import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_app/core/functions/function_helper.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/core/widgets/submit_button.dart';
import 'package:signin_app/core/widgets/text_form_field.dart';
import 'package:signin_app/cunits/user%20cubit/user_cubit.dart';
import 'package:signin_app/cunits/user%20cubit/user_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
  bool isloading = false;
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if(state is LoginLoadingState){
          isloading = true;
        } if(state is LoginSuccessState){
          isloading = false;
          GetCustomSnackBar(context: context, state: state, messsage: state.successmsg, undo: false, onaction: null);
          context.read<UserCubit>().GetUserData();
          Navigator.pushReplacementNamed(context, PageNameData.ProfileScreen);          
        } if(state is LoginFailedState){
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
                key: context.read<UserCubit>().login_form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text('Welcome Back!', style: TextStyleData.Semibold),
                    Text(
                      'welcome back we missed you',
                      style: TextStyleData.Medium,
                    ),
                    SizedBox(height: 20),
                    // email
                    GlobalTextFormField(
                      label: 'Email',
                      hinttext: 'Email',
                      preffixicon: AssetsData.ApersonIcon,
                      textInputType: TextInputType.emailAddress,
                      textEditingController:
                          context.read<UserCubit>().login_email,
                    ),
                    SizedBox(height: 20),
                    GlobalTextFormField(
                      label: 'password',
                      hinttext: 'password',
                      preffixicon: AssetsData.AkeyIcon,
                      textInputType: TextInputType.visiblePassword,
                      textEditingController:
                          context.read<UserCubit>().login_passwrod,
                    ),
                    SizedBox(height: 30),
                    isloading? CircularProgressIndicator() : SubmitButton(
                      text: 'Login ',
                      ontap: () {
                        if (context
                            .read<UserCubit>()
                            .login_form
                            .currentState!
                            .validate()) {
                          context.read<UserCubit>().Signin();
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap:
                          () => Navigator.pushReplacementNamed(
                            context,
                            PageNameData.SignUpScreen,
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
