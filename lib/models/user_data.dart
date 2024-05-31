// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:lua_v3/models/user_detail.dart';

class UserData {
  String? token;
  UserDetail info;
  UserData({
    required this.token,
    required this.info,
  });

  UserData copyWith({
    String? token,
    UserDetail? info,
  }) {
    return UserData(
      token: token ?? this.token,
      info: info ?? this.info,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
      'info': info.toJson(),
    };
  }

  factory UserData.fromJson(Map<String, dynamic> map) {
    return UserData(
      token: map['token'] as String,
      info: UserDetail.fromJson(map['info']!! as Map<String, dynamic>),
    );
  }

  @override
  String toString() => 'UserData(token: $token, info: $info)';

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.token == token && other.info == info;
  }

  @override
  int get hashCode => token.hashCode ^ info.hashCode;
}
