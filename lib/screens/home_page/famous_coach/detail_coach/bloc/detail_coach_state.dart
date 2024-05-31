// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

// import 'package:lua_v3/models/coach_detail.dart';
// import 'package:lua_v3/models/user_detail.dart';

// enum CoachStatus {
//   init,
//   loading,
//   success,
//   error,
//   submit,
 
// }

// class CoachtState extends Equatable {
//    CoachStatus status;
//    String? message;
//    CoachDetail? coachDetail;

//   CoachtState({
//     this.status = CoachStatus.init,
//     this.message,
//     this.coachDetail,
//   });

//   @override
//   List<Object?> get props => [status, message, coachDetail];

  
  

//   CoachtState copyWith({
//     CoachStatus? status,
//     String? message,
//     CoachDetail? coachDetail,
//   }) {
//     return CoachtState(
//       status: status ?? this.status,
//       message: message ?? this.message,
//       coachDetail: coachDetail ?? this.coachDetail,
//     );
//   }
// }
