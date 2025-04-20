import 'package:signin_app/models/user_model.dart';

class UserState {}
// initial state
final class UserIntial extends UserState{}

// proifle picture state
final class UserProfileState extends UserState{}

// login states
final class LoginLoadingState extends UserState{}

final class LoginSuccessState extends UserState{
  final String successmsg;

  LoginSuccessState({required this.successmsg});
}

final class LoginFailedState extends UserState{
  final String errormsg;

  LoginFailedState({required this.errormsg});
}

// signup states
final class SignupLoadingState extends UserState{}

final class SignupSuccessState extends UserState{
  final String successmsg;

  SignupSuccessState({required this.successmsg});
}

final class SignupFailedState extends UserState{
  final String errormsg;

  SignupFailedState({required this.errormsg});
}

// getuser states
final class GetUserLoadingState extends UserState{}

final class GetUserSuccessState extends UserState{
  final UserModel user;

  GetUserSuccessState({required this.user});
}

final class GetUserFailedState extends UserState{
  final String errormsg;

  GetUserFailedState({required this.errormsg});
}

// logout states
final class LogoutLoadingState extends UserState{}

final class LogoutSuccessState extends UserState{
  // become a comment because error in api
  // final String successmsg;

  // LogoutSuccessState({required this.successmsg});
}

final class LogoutFailedState extends UserState{
  final String errormsg;

  LogoutFailedState({required this.errormsg});
}

// delete acount states
final class DeleteacountLoadingState extends UserState{}

final class DeleteacountSuccessState extends UserState{
  // become a comment because error in api
  // final String successmsg;

  // DeleteacountSuccessState({required this.successmsg});
}

final class DeleteacountFailedState extends UserState{
  final String errormsg;

  DeleteacountFailedState({required this.errormsg});
}