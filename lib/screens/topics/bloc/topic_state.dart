// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:lua_v3/models/topic_model.dart';

enum TopicStatus {
  init,
  loading,
  success,
  error,
  submit,
  submitSuccess,
  submitError
}

class TopicState extends Equatable {
  TopicStatus? status;
  String? message;
  List<Topic>? listData;
  List<Topic>? selectedTitles;
  TopicState({
    this.status = TopicStatus.init,
    this.message,
    this.listData = const [],
    this.selectedTitles = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, listData, selectedTitles];

  TopicState copyWith({
    TopicStatus? status,
    String? message,
    List<Topic>? listData,
    List<Topic>? selectedTitles,
  }) {
    return TopicState(
      status: status ?? this.status,
      message: message ?? this.message,
      listData: listData ?? this.listData,
      selectedTitles: selectedTitles ?? this.selectedTitles,
    );
  }
}
