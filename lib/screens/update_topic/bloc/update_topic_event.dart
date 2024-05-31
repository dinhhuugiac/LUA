import 'package:equatable/equatable.dart';
import 'package:lua_v3/models/topic_model.dart';

class UpdateTopicEvent extends Equatable {
  const UpdateTopicEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitUpdateTopicEvent extends UpdateTopicEvent {
  final List<String>? selectTopic;
  const InitUpdateTopicEvent({this.selectTopic});
  @override
  // TODO: implement props
  List<Object?> get props => [selectTopic];
}

class SubmitUpdateTopicEvent extends UpdateTopicEvent {
  final List<Topic>? listData;

  const SubmitUpdateTopicEvent({this.listData});
  @override
  List<Object?> get props => [listData];
}

class ChosseUpdateTopicEvent extends UpdateTopicEvent {
  final String selectedData;

  const ChosseUpdateTopicEvent({required this.selectedData});
  @override
  List<Object?> get props => [selectedData];
}
