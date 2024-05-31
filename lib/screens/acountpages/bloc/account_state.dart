import 'package:equatable/equatable.dart';
import 'package:lua_v3/models/user_detail.dart';

enum AccountStatus {
  init,
  loading,
  success,
  error,
  submit,
  logoutsuccsess,
}

class AccountState extends Equatable {
   AccountStatus status;
   String? message;
   UserDetail? userDetail;

  AccountState({
    this.status = AccountStatus.init,
    this.message,
    this.userDetail,
  });

  @override
  List<Object?> get props => [status, message, userDetail];

  AccountState copyWith({
    AccountStatus? status,
    String? message,
    UserDetail? userDetail,
  }) {
    return AccountState(
      status: status ?? this.status,
      message: message ?? this.message,
      userDetail: userDetail ?? this.userDetail,
    );
  }
}
