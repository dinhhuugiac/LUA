// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';
// import 'package:lua_v3/models/user_detail.dart';

// class UpdateState {}

// class UpdateStatelLoading extends UpdateState {}

// class UpdateStatelSuccess extends UpdateState {
//   UserDetail? userDetail;
//   String? messager;

//   UpdateStatelSuccess({
//     required this.messager,
//     this.userDetail,
//   });
// }

// class UpdateStateFail extends UpdateState {
//   String? messager;
//   UpdateStateFail({required this.messager});
// }

import 'package:equatable/equatable.dart';
import 'package:lua_v3/models/user_detail.dart';

enum UpdateStatus {
  init,
  loading,
  success,
  error,
  submit,

}

class UpdateState extends Equatable {
  UpdateStatus? status;
  String? messager;
  UserDetail? userDetail;
  UpdateState({this.status = UpdateStatus.init, this.messager,this.userDetail});
   @override
  // TODO: implement props
  List<Object?> get props => [status, messager, userDetail];


  UpdateState copyWith({
    UpdateStatus? status,
    String? messager,
    UserDetail? userDetail,
  }) {
    return UpdateState(
      status: status ?? this.status,
      messager: messager ?? this.messager,
      userDetail: userDetail ?? this.userDetail,
    );
  }
}
