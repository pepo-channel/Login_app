abstract class EndPoints {
  static const BasicUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const SignIn = 'user/signin';
  static const SignUp = 'user/signup';
  static const Logout = 'user/logout';
  static const Deleteacount = 'user/delete';
  static String IdEndPoint(id){
    return 'user/get-user/$id';
  } 
}

abstract class ApiKeys {
  static const email = 'email';
  static const password = 'password';
  static const message = 'message';
  static const token = 'token';
  static const id = 'id';
  static const name = 'name';
  static const phone = 'phone';
  static const confirmPassword = 'confirmPassword';
  static const location = 'location';
  static const profilePic = 'profilePic';
  static const status = 'status';
  static const ErrorMessage = 'ErrorMessage';
  static const user = 'user';
}