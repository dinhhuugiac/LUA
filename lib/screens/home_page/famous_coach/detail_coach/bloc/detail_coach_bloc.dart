// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:lua_v3/screens/home_page/famous_coach/detail_coach/bloc/detail_coach_event.dart';
// import 'package:lua_v3/screens/home_page/famous_coach/detail_coach/bloc/detail_coach_state.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../login_pages/api.dart';

// class CoachBloc extends Bloc<CoachEvent, CoachtState> {
//   CoachBloc() : super(CoachtState()) {
//     on<ChosseCoachEvent>(_chosseCoachEvent);
//   }

//   FutureOr<void> _chosseCoachEvent(
//       ChosseCoachEvent event, Emitter<CoachtState> emit) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     var accessToken = sharedPreferences.getString('accessToken');
//     final inforCoach = RestClient(Dio(BaseOptions(
//         contentType: 'multipart/form-data',
//         headers: {'Authorization': 'Bearer $accessToken '})));

//     emit(state.copyWith(status: CoachStatus.loading));

//     try {
//       await inforCoach.getInfoCoach().then((value) => {
//             if (value.status_code == 200)
//               {
//                 emit(state.copyWith(
//                   status: CoachStatus.success,
//                   message: value.message,
//                 ))
//               }
//             else
//               {
//                 emit(state.copyWith(
//                     status: CoachStatus.error, message: value.message))
//               }
//           });
//     } catch (e) {
//       emit(state.copyWith(status: CoachStatus.error, message: e.toString()));
//     }
//   }
// }
