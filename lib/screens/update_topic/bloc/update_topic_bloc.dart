import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lua_v3/screens/login_pages/api.dart';

import 'package:lua_v3/screens/update_topic/bloc/update_topic_event.dart';
import 'package:lua_v3/screens/update_topic/bloc/update_topic_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateTopicBloc extends Bloc<UpdateTopicEvent, UpdateTopicState> {
  UpdateTopicBloc() : super(UpdateTopicState()) {
    on<InitUpdateTopicEvent>(_initUpdateTopicEvent);
    on<ChosseUpdateTopicEvent>(_chosseUpdateTopicEvent);
    on<SubmitUpdateTopicEvent>(_submitUpdateTopicEvent);
  }

  FutureOr<void> _initUpdateTopicEvent(
      InitUpdateTopicEvent event, Emitter<UpdateTopicState> emit) async {
    List<String> selectedTitles = event.selectTopic ?? [];

    emit(state.copyWith(
        status: UpdateTopicStatus.loading, selectedTitles: selectedTitles));
    final getTopic = RestClient(Dio());
    try {
      await getTopic.getTopic().then((value) async {
        if (value.statusCode == 200) {
          emit(state.copyWith(
              status: UpdateTopicStatus.success, listData: value.data));
        } else {
          emit(state.copyWith(
              status: UpdateTopicStatus.error, message: value.message));
        }
      });
    } catch (e) {
      emit(state.copyWith(
          status: UpdateTopicStatus.error, message: e.toString()));
    }
  }

  FutureOr<void> _chosseUpdateTopicEvent(
      ChosseUpdateTopicEvent event, Emitter<UpdateTopicState> emit) async {
    try {
      List<String> selectedTopic = List.from(state.selectedTitles ?? []);
      if (selectedTopic.contains(event.selectedData)) {
        selectedTopic.remove(event.selectedData);
      } else {
        selectedTopic.add(event.selectedData);
      }
      emit(
          state.copyWith(selectedTitles: selectedTopic.map((e) => e).toList()));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _submitUpdateTopicEvent(
      SubmitUpdateTopicEvent event, Emitter<UpdateTopicState> emit) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var accessToken = sharedPreferences.getString('accessToken');
    final updateTopic = RestClient(
        Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken '})));
      
    try {
      await updateTopic.updateTopicList(
          {"favorite_content": state.selectedTitles}).then((value) async {
        if (value.status_code == 200) {
          emit(state.copyWith(
            status: UpdateTopicStatus.submitSuccess,
          ));
        } else {
          emit(state.copyWith(
              status: UpdateTopicStatus.error, message: value.message));
        }
      });
    } catch (e) {
      emit(state.copyWith(
          status: UpdateTopicStatus.error, message: e.toString()));
    }
  }
}
