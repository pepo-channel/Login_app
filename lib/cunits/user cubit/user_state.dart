class UserState {}

final class UserIntial extends UserState{}

final class SigninLoadingState extends UserState{}

final class SigninSuccessState extends UserState{
  final String successmsg;

  SigninSuccessState({required this.successmsg});
}

final class SigninFailedState extends UserState{
  final String errormsg;

  SigninFailedState({required this.errormsg});
}