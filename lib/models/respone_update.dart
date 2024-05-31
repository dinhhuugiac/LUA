class ResponUpdate {
  final int? statusCode;
  final String? message;
  final Map<String, dynamic>? data;

  ResponUpdate(
      {required this.statusCode, required this.message, required this.data});

  factory ResponUpdate.fromJson(Map<String, dynamic> json) {
    return ResponUpdate(
      statusCode: json['status_code'],
      message: json['message'],
       data: json['data'] ?? {},
    );
  }
}
