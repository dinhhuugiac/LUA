class DescribeCourse {
  final int? statusCode;
  final String? message;
  final List<Course>? data;

  DescribeCourse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory DescribeCourse.fromJson(Map<String, dynamic> json) {
    return DescribeCourse(
      statusCode: json['status_code'],
      message: json['message'],
      data: json['data'] != null
          ? List<Course>.from(
              json['data'].map((x) => Course.fromJson(x)))
          : null,
    );
  }
}

class Course{
  final String? id;
  final String? title;
  final String? description;
  final int? price;
  final int? discount;
  final int? days;

  Course({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discount,
    this.days,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      days: json['days'],
    );
  }
}
