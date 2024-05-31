import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lua_v3/models/user_detail_model.dart';

import 'package:lua_v3/screens/home_page/bloc/home_event.dart';
import 'package:lua_v3/screens/home_page/bloc/home_state.dart';
import 'package:lua_v3/screens/home_page/famous_coach/detail_coach/bloc/detail_coach_state.dart';
import 'package:lua_v3/screens/login_pages/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<ChosseHomeEvent>(_chosseHomeEvent);
  }

  FutureOr<void> _chosseHomeEvent(
      ChosseHomeEvent event, Emitter<HomeState> emit) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var accessToken = sharedPreferences.getString('accessToken');
    final inforUser = RestClient(Dio(BaseOptions(
        contentType: 'multipart/form-data',
        headers: {'Authorization': 'Bearer $accessToken '})));
    final inforCoach = RestClient(Dio(BaseOptions(
        contentType: 'multipart/form-data',
        headers: {'Authorization': 'Bearer $accessToken '})));

    emit(state.copyWith(status: HomeStatus.loading));

    try {
      var userResponse = await inforUser.getInfoUser();
      var coachResponse = await inforCoach.getInfoCoach();

      if (userResponse.status_code == 200 && coachResponse.status_code == 200) {
        emit(state.copyWith(
            status: HomeStatus.success,
            message: 'Both user and coach information fetched successfully',
            userDetail: userResponse.userDetail,
            coachDetail: coachResponse.coachDetail));
      } else if (userResponse.status_code == 200) {
        emit(state.copyWith(
            status: HomeStatus.success,
            message: 'User information fetched successfully',
            userDetail: userResponse.userDetail));
      } else if (coachResponse.status_code == 200) {
        emit(state.copyWith(
            status: HomeStatus.success,
            message: 'Coach information fetched successfully',
            coachDetail: coachResponse.coachDetail));
      } else {
        emit(state.copyWith(
            status: HomeStatus.error, message: 'Failed to fetch information'));
      }
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, message: e.toString()));
    }
  }
}
