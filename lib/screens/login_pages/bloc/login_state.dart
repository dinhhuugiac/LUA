import 'package:lua_v3/models/user_detail.dart';

class LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  UserDetail? userDetail;
  String? messager;
  String? email;
  LoginSuccessState(
      {required this.messager, required this.email, this.userDetail});
}

class LoginFailState extends LoginState {
  String messager;
  LoginFailState({required this.messager});
}
 class LoginErrorState extends LoginState {
  String? errorMessage ;
  LoginErrorState({this.errorMessage});
 }