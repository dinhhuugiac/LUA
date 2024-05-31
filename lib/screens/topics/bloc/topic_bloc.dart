import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lua_v3/models/topic_model.dart';
import 'package:lua_v3/screens/login_pages/api.dart';
import 'package:lua_v3/screens/topics/bloc/topic_event.dart';
import 'package:lua_v3/screens/topics/bloc/topic_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc() : super(TopicState()) {
    on<InitTopicEvent>(_initTopicEvent);
    on<ChosseTopicEvent>(_chosseTopicEvent);
    on<SubmitTopicEvent>(_submitTopicEvent);
  }

  FutureOr<void> _initTopicEvent(
      InitTopicEvent event, Emitter<TopicState> emit) async {
    emit(state.copyWith(status: TopicStatus.loading));
    final getTopic = RestClient(Dio());
    try {
      await getTopic.getTopic().then((value) async {
        if (value.statusCode == 200) {
          emit(state.copyWith(
              status: TopicStatus.success, listData: value.data));
        } else {
          emit(state.copyWith(
              status: TopicStatus.error, message: value.message));
        }
      });
    } catch (e) {
      emit(state.copyWith(status: TopicStatus.error, message: e.toString()));
    }
  }

 FutureOr<void> _chosseTopicEvent(
    ChosseTopicEvent event, Emitter<TopicState> emit) async {
  try {
    List<Topic> selectedTopic = List.from(state.selectedTitles ?? []);
    if (selectedTopic.contains(event.selectedData)) {
      selectedTopic.remove(event.selectedData);
    } else {
      selectedTopic.add(event.selectedData);
    }
    emit(state.copyWith(selectedTitles: selectedTopic));
  } catch (e) {
    print(e);
  }
}

  FutureOr<void> _submitTopicEvent(
      SubmitTopicEvent event, Emitter<TopicState> emit) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var accessToken = sharedPreferences.getString('accessToken');
    final updateTopic = RestClient(
        Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken '})));

    try {
      await updateTopic.updateTopicList({
        "favorite_content": state.selectedTitles!.map((e) => e.title).toList()
      }).then((value) async {
        if (value.status_code == 200) {
          emit(state.copyWith(
            status: TopicStatus.submitSuccess,
          ));
        } else {
          emit(state.copyWith(
              status: TopicStatus.error, message: value.message));
        }
      });
    } catch (e) {
      emit(state.copyWith(status: TopicStatus.error, message: e.toString()));
    }
  }
}
