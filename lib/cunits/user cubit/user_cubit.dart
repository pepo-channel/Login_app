import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:signin_app/cache/cache_helper.dart';
import 'package:signin_app/core/api/api_consumer.dart';
import 'package:signin_app/core/api/api_helper.dart';
import 'package:signin_app/core/errors/server_exception.dart';
import 'package:signin_app/core/functions/function_helper.dart';
import 'package:signin_app/cunits/user%20cubit/user_state.dart';
import 'package:signin_app/models/login_model.dart';
import 'package:signin_app/models/signup_model.dart';
import 'package:signin_app/models/user_model.dart';

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

  UploadProfilePic(XFile image){
    profilepic = image;
    emit(UserProfileState());
  }


  LoginModel? loginuser; 
  Signin() async{
    try {
      emit(LoginLoadingState());
      final Response = await api.post(
        EndPoints.SignIn,
        data: {
          ApiKeys.email : login_email.text,
          ApiKeys.password : login_passwrod.text,
        }
      );
      loginuser = LoginModel.fromJson(Response);
      final decodedToken = JwtDecoder.decode(loginuser!.token); // decode token to get id
      CacheHelper().saveData(key: ApiKeys.token, value: loginuser!.token); // save token in local storage
      CacheHelper().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]); // save id in local storage
      emit(LoginSuccessState(successmsg: loginuser!.message));
    } on ServerException catch (e) {
      emit(LoginFailedState(errormsg: e.errorModel.errormsg));
    }
  }

  SignupModel? signupuser;
  signup() async{
    try {
      emit(SignupLoadingState());
      final Response = await api.post(
        EndPoints.SignUp,
        isformdata: true,
        data: {
          ApiKeys.name : signup_name.text,
          ApiKeys.phone : signup_phone.text,
          ApiKeys.email : signup_email.text,
          ApiKeys.password : signup_password.text,
          ApiKeys.confirmPassword : signup_confirmpassword.text,
          ApiKeys.location : '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKeys.profilePic : await UploadXFileToApi(profilepic!),
        },
      );
      print(Response);
      signupuser = SignupModel.fromJson(Response);
      emit(SignupSuccessState(successmsg: loginuser!.message));
    }on ServerException catch (e) {
      emit(SignupFailedState(errormsg: e.errorModel.errormsg));
    }
  }

  GetUserData() async{
    try {
      emit(GetUserLoadingState());
      final Response = await api.get(
        EndPoints.IdEndPoint(CacheHelper().getData(key: ApiKeys.id)),
      );
      emit(GetUserSuccessState(user: UserModel.fromJson(Response)));
    }on ServerException catch (e) {
      emit(GetUserFailedState(errormsg: e.errorModel.errormsg));
    }
  }

  Logout() async{
    try {
      emit(LogoutLoadingState());
      final Response = await api.get(
        EndPoints.Logout,
      );
      emit(LogoutSuccessState());
    }on ServerException catch (e) {
      emit(LogoutFailedState(errormsg: e.errorModel.errormsg));
    }
  }

  DeleteAcoutn() async{
    try {
      emit(DeleteacountLoadingState());
      final Response = await api.delete(
        EndPoints.Deleteacount,
        queryparameters: {
          ApiKeys.id : CacheHelper().getData(key: ApiKeys.id),
        },
      );
      emit(DeleteacountSuccessState());
    }on ServerException catch (e) {
      emit(DeleteacountFailedState(errormsg: e.errorModel.errormsg));
    }
  }
  
}