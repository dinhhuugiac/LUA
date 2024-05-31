import 'package:lua_v3/models/coach_detail.dart';

class CoachDetailModel {
  final int status_code;
  final String message;
  final List<CoachDetail>? coachDetail;

  CoachDetailModel({this.status_code = 0, this.message = '', this.coachDetail});

  factory CoachDetailModel.fromJson(Map<String, dynamic> json) {
    return CoachDetailModel(
      status_code: json['status_code'] ?? 0,
      message: json['message'] ?? '',
      coachDetail: (json['data'] as List<dynamic>?)
          ?.map((item) => CoachDetail.fromJson(item))
          .toList(),
    );
  }
}
