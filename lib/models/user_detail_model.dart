
import 'package:lua_v3/models/user_detail.dart';


class UserDetailModel{
  final int status_code;
  final String message;
  final UserDetail? userDetail;

  UserDetailModel({ this.status_code = 0, this.message = '', this.userDetail});

  factory UserDetailModel.fromJson(Map<String,dynamic> json){
    return UserDetailModel(
      status_code: json['status_code'] ?? 0,
      message: json['message'] ??'',
      userDetail: UserDetail.fromJson(json['data'])
    );
  }
}