class TopicModel {
  final int? statusCode;
  final String? message;
  final List<Topic>? data;

  TopicModel(
      {required this.statusCode, required this.message, required this.data});

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      statusCode: json['status_code'],
      message: json['message'],
      data: json['data'] != null
          ? List<Topic>.from(json['data'].map((x) => Topic.fromJson(x)))
          : null,
    );
  }
}

class Topic {
  final String? title;

  Topic({this.title});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      title: json['title'],
    );
  }

  get id => null;
}
