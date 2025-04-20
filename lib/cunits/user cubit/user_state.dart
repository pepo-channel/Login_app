class UserState {}

final class UserIntial extends UserState{}

final class LoginSuccess extends UserState{}

final class LoginLoading extends UserState{}

final class LoginFailed extends UserState{
  final String errormsg;

  LoginFailed({required this.errormsg});
}