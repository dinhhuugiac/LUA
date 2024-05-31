// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:lua_v3/models/topic_model.dart';

enum UpdateTopicStatus {
  init,
  loading,
  success,
  error,
  submit,
  submitSuccess,
  submitError,
  submitloading,

}

class UpdateTopicState extends Equatable {
  UpdateTopicStatus? status;
  String? message;
  List<Topic>? listData;
  List<String>? selectedTitles;

  UpdateTopicState({
    this.status = UpdateTopicStatus.init,
    this.message,
    this.listData = const [],
    this.selectedTitles = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, listData, selectedTitles];

  UpdateTopicState copyWith({
    UpdateTopicStatus? status,
    String? message,
    List<Topic>? listData,
    List<String>? selectedTitles,
  }) {
    return UpdateTopicState(
      status: status ?? this.status,
      message: message ?? this.message,
      listData: listData ?? this.listData,
      selectedTitles: selectedTitles ?? this.selectedTitles,
    );
  }
}
