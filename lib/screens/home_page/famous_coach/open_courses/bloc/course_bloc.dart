import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lua_v3/models/subscription_course.dart';
import 'package:lua_v3/screens/home_page/famous_coach/open_courses/bloc/course_event.dart';
import 'package:lua_v3/screens/home_page/famous_coach/open_courses/bloc/course_state.dart';
import 'package:lua_v3/screens/login_pages/api.dart';

class DescribeCourseBloc
    extends Bloc<DescribeCourseEvent, DescribeCourseState> {
  DescribeCourseBloc() : super(DescribeCourseState()) {
    on<InitDescribeCourseEvent>(_initDescribeCourseEvent);
  }

  FutureOr<void> _initDescribeCourseEvent(
      InitDescribeCourseEvent event, Emitter<DescribeCourseState> emit) async {
    final getDescribeCourse = RestClient(Dio());
    emit(state.copyWith(
      status: DescribeCourseStatus.loading,
    ));
    try {
      await getDescribeCourse.getDescribeCourse().then((value) async {
        if (value.statusCode == 200) {
          List<Course>? data = value.data;

          data?.removeWhere((item) => item.title == "7 Ngày");

          data?.sort((a, b) => b.days!.compareTo(a.days!));
          emit(state.copyWith(
            status: DescribeCourseStatus.success,
            listData: data,
          ));
        } else {
          emit(state.copyWith(
            status: DescribeCourseStatus.error,
            message: value.message,
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        status: DescribeCourseStatus.error,
        message: e.toString(),
      ));
    }
  }
}
