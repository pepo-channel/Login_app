import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:signin_app/cache/cache_helper.dart';
import 'package:signin_app/core/api/api_consumer.dart';
import 'package:signin_app/core/api/api_helper.dart';
import 'package:signin_app/core/errors/server_exception.dart';
import 'package:signin_app/cunits/user%20cubit/user_state.dart';
import 'package:signin_app/models/signin_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserIntial());

  final ApiConsumer api;
  // static get(context) => BlocProvider.of(context); // for access but not use because api final variable

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


  SigninModel? signinuser; 
  Signin() async{
    try {
      emit(SigninLoadingState());
      final Response = await api.post(
        EndPoints.SignIn,
        data: {
          ApiKeys.email : login_email.text,
          ApiKeys.password : login_passwrod.text,
        }
      );
      signinuser = SigninModel.fromJson(Response);
      final decoded_token = JwtDecoder.decode(signinuser!.token); // decode token to get id
      CacheHelper().saveData(key: ApiKeys.token, value: signinuser!.token); // save token in local storage
      CacheHelper().saveData(key: ApiKeys.id, value: decoded_token[ApiKeys.id]); // save id in local storage
      emit(SigninSuccessState(successmsg: signinuser!.message));
    } on ServerException catch (e) {
      emit(SigninFailedState(errormsg: e.errorModel.errormsg));
    }
  }
}