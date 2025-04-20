import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_app/Pages/profile/widgets/custom_bottun.dart';
import 'package:signin_app/Pages/profile/widgets/custom_field.dart';
import 'package:signin_app/core/functions/function_helper.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/core/widgets/picture_box.dart';
import 'package:signin_app/cunits/user%20cubit/user_cubit.dart';
import 'package:signin_app/cunits/user%20cubit/user_state.dart';
import 'package:signin_app/models/user_model.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isloading = false;
    UserModel? user;
    String errormsg = '';
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if(state is GetUserLoadingState){
          isloading = true;
        }
        if(state is GetUserSuccessState){
          isloading = false;
          user = state.user;
        }
        if(state is GetUserFailedState){
          isloading = false;
          errormsg = state.errormsg;
        }
        if(state is LogoutLoadingState){
          isloading = true;
        }
        if(state is LogoutSuccessState){
          isloading = false;
          // comment because error in api
          // GetCustomSnackBar(context: context, state: state, messsage: state.successmsg, undo: false, onaction: null);
          Navigator.pushReplacementNamed(
            context,
            PageNameData.LogInScreen,
          );
        }
        if(state is LogoutFailedState){
          isloading = false;
          GetCustomSnackBar(context: context, state: state, messsage: errormsg, undo: false, onaction: null);
        }
        if(state is DeleteacountLoadingState){
          isloading = true;
        }
        if(state is DeleteacountSuccessState){
          isloading = false;
          // comment because error in api
          // GetCustomSnackBar(context: context, state: state, messsage: state.successmsg, undo: false, onaction: null);
          GetCustomSnackBar(context: context, state: state, messsage: errormsg, undo: false, onaction: null);
          Navigator.pushReplacementNamed(
            context,
            PageNameData.SignUpScreen,
          );
        }
        if(state is DeleteacountFailedState){
          isloading = false;
          errormsg = state.errormsg;
        }
      },
      builder: (context, state) {
        return isloading?
         CircularProgressIndicator() :
          errormsg.isNotEmpty?
           Center(child: Text(errormsg, style: TextStyleData.Semibold,),) :
            ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  PictureBox(),
                  SizedBox(height: 40),
                  // User name
                  CustomField(text: user!.name),
                  SizedBox(height: 20),
                  // Email
                  CustomField(text: user!.email),
                  SizedBox(height: 20),
                  // phone number
                  CustomField(text: user!.phone),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: 'Logout',
                        ontap:
                            () =>context.read<UserCubit>().Logout(),
                        icon: AssetsData.AlogoutIcon,
                      ),
                      CustomButton(
                        text: 'Delete acount!',
                        ontap:
                            () => context.read<UserCubit>().DeleteAcoutn(),
                        icon: AssetsData.AdeleteIcon,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    // onTap: () => Navigator.pushReplacementNamed(context, PageNameData.SignUpScreen),
                    child: Text(
                      'Change password',
                      style: TextStyleData.Medium.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }


}
