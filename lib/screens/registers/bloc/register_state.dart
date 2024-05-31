import 'package:lua_v3/models/user_detail.dart';


class RegisterState {

}

class RegistelStatelLoading extends RegisterState {}

class RegistelStatelSuccess extends RegisterState {
  
  UserDetail? userDetail;
  String ? messager;
  
  RegistelStatelSuccess({required this.messager,this.userDetail,});
}

class RegistelStateFail extends RegisterState {
  String? messager;
  RegistelStateFail({required this.messager});
}
