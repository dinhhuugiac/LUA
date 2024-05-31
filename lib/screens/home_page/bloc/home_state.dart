import 'package:equatable/equatable.dart';
import 'package:lua_v3/models/coach_detail.dart';
import 'package:lua_v3/models/user_detail.dart';

enum HomeStatus {
  init,
  loading,
  success,
  error,
  submit,
}

class HomeState extends Equatable {
  HomeStatus status;
  String? message;
  UserDetail? userDetail;
  // List<Topic>?
  List<CoachDetail>? coachDetail;
  HomeState({
    this.status = HomeStatus.init,
    this.message,
    this.userDetail,
    this.coachDetail,
  });

  @override
  List<Object?> get props => [status, message, userDetail, coachDetail];

  HomeState copyWith({
    HomeStatus? status,
    String? message,
    UserDetail? userDetail,
    List<CoachDetail>? coachDetail, // Update to accept a list of CoachDetail
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      userDetail: userDetail ?? this.userDetail,
      coachDetail: coachDetail ?? this.coachDetail,
    );
  }
}
