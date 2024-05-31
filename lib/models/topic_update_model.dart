

class TopicUpdateModel {
  int? status_code;
  String? message;
  TopicUpdateModel({
    this.status_code,
    this.message,
  });

  TopicUpdateModel copyWith({
    int? status_code,
    String? message,
  }) {
    return TopicUpdateModel(
      status_code: status_code ?? this.status_code,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status_code': status_code,
      'message': message,
    };
  }

  factory TopicUpdateModel.fromJson(Map<String, dynamic> map) {
    return TopicUpdateModel(
      status_code: map['status_code'] != null ? map['status_code'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

 

  @override
  String toString() => 'TopicUpdateModel(status_code: $status_code, message: $message)';

  @override
  bool operator ==(covariant TopicUpdateModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status_code == status_code &&
      other.message == message;
  }

  @override
  int get hashCode => status_code.hashCode ^ message.hashCode;
} 
