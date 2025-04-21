import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:signin_app/cache/cache_helper.dart';
import 'package:signin_app/core/api/api_consumer.dart';
import 'package:signin_app/core/api/api_helper.dart';
import 'package:signin_app/core/errors/server_exception.dart';
import 'package:signin_app/models/login_model.dart';
import 'package:signin_app/models/signup_model.dart';
import 'package:signin_app/models/user_model.dart';

class UserRepo {
  final ApiConsumer api;

  UserRepo({required this.api});
  Future<Either<String, LoginModel>> Signin({
    required String email,
    required String passwrod,
  }) async{
    try {
      final Response = await api.post(
        EndPoints.SignIn,
        data: {
          ApiKeys.email : email,
          ApiKeys.password : passwrod,
        }
      );
      final loginuser = LoginModel.fromJson(Response);
      final decodedToken = JwtDecoder.decode(loginuser.token); // decode token to get id
      CacheHelper().saveData(key: ApiKeys.token, value: loginuser.token); // save token in local storage
      CacheHelper().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]); // save id in local storage
      return right(loginuser);
    } on ServerException catch (e) {
      return left(e.errorModel.errormsg);
    }
  }

  Future<Either<String, SignupModel>> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmpassword,
    required String location,
    required XFile profilepic,
  }) async{
    try {
      final Response = await api.post(
        EndPoints.SignUp,
        isformdata: true,
        data: {
          ApiKeys.name : name,
          ApiKeys.phone : phone,
          ApiKeys.email : email,
          ApiKeys.password : password,
          ApiKeys.confirmPassword : confirmpassword,
          // ApiKeys.location : '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKeys.location : location,
          ApiKeys.profilePic : profilepic,
        },
      );
      final signupuser = SignupModel.fromJson(Response);
      return right(signupuser);
    }on ServerException catch (e) {
      return left(e.errorModel.errormsg);
    }
  }

  Future<Either<String, UserModel>> GetUserData() async{
    try {
      final Response = await api.get(
        EndPoints.IdEndPoint(CacheHelper().getData(key: ApiKeys.id)),
      );
      final UserModel user = UserModel.fromJson(Response);
      return right(user);
    }on ServerException catch (e) {
      return left(e.errorModel.errormsg);
    }
  }

}