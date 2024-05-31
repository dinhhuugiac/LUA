import 'package:lua_v3/models/user_detail.dart';

class RegisterEvent {}

class SubmitRegisterEvent extends RegisterEvent {
  UserDetail? userDetail;
  SubmitRegisterEvent({
    required this.userDetail,
  });
}
