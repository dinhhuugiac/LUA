import 'package:equatable/equatable.dart';
import 'package:lua_v3/models/topic_model.dart';

class TopicEvent extends Equatable {
  const TopicEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitTopicEvent extends TopicEvent {
  const InitTopicEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SubmitTopicEvent extends TopicEvent {
  final List<Topic>? listData;
  const SubmitTopicEvent({this.listData});
  @override
  List<Object?> get props => [listData];
}

class ChosseTopicEvent extends TopicEvent {
  final Topic selectedData;

  const ChosseTopicEvent({required this.selectedData});
  @override
  List<Object?> get props => [selectedData];
}
