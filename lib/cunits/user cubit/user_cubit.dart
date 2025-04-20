import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signin_app/core/api/api_consumer.dart';
import 'package:signin_app/cunits/user%20cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserIntial());

  final ApiConsumer api;
  static get(context) => BlocProvider.of(context); // for access

  // login controller
  GlobalKey<FormState> login_form = GlobalKey();
  TextEditingController login_email = TextEditingController();
  TextEditingController login_passwrod = TextEditingController();

  // signup controller
  GlobalKey<FormState> signup_form = GlobalKey();
  XFile? profilepic;
  TextEditingController signup_name = TextEditingController();
  TextEditingController signup_email = TextEditingController();
  TextEditingController signup_phone = TextEditingController();
  TextEditingController signup_password = TextEditingController();
  TextEditingController signup_confirmpassword = TextEditingController();

}