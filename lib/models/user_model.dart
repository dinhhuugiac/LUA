import 'package:lua_v3/models/user_data.dart';

class UserModel {
  final int? statusCode;
  final String message;
  final UserData? userData;

  UserModel({required this.statusCode, required this.message, this.userData});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      statusCode: json['status_code'],
      message: json['message'],
      userData: UserData.fromJson(json['data']),
    );
  }
}
