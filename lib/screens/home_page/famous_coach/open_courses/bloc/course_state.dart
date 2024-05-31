// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:lua_v3/models/subscription_course.dart';
import 'package:lua_v3/models/topic_model.dart';

enum DescribeCourseStatus {
  init,
  loading,
  success,
  error,
}

class DescribeCourseState extends Equatable {
  DescribeCourseStatus? status;
  String? message;
  List<Course>? listData;
  DescribeCourseState({
    this.status = DescribeCourseStatus.init,
    this.message,
    this.listData = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, listData];

  DescribeCourseState copyWith({
    DescribeCourseStatus? status,
    String? message,
    List<Course>? listData,
  }) {
    return DescribeCourseState(
      status: status ?? this.status,
      message: message ?? this.message,
      listData: listData ?? this.listData,
    );
  }
}
