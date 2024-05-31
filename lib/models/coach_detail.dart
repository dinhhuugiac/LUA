// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CoachDetail {
  String? id;
  String? full_name;
  String? gender;
  String? phone_number;
  String? address;
  String? introduction;
  String? user_type;
  String? avatar;
  String? email;
  String? date_verified;
  int? total_video_view;

  CoachDetail({
    this.id,
    this.full_name,
    this.gender,
    this.phone_number,
    this.address,
    this.introduction,
    this.user_type,
    this.avatar,
    this.email,
    this.date_verified,
    this.total_video_view,
  });

  CoachDetail copyWith({
    String? id,
    String? full_name,
    String? gender,
    String? phone_number,
    String? address,
    String? introduction,
    String? user_type,
    String? avatar,
    String? email,
    String? date_verified,
    int? total_video_view,
  }) {
    return CoachDetail(
      id: id ?? this.id,
      full_name: full_name ?? this.full_name,
      gender: gender ?? this.gender,
      phone_number: phone_number ?? this.phone_number,
      address: address ?? this.address,
      introduction: introduction ?? this.introduction,
      user_type: user_type ?? this.user_type,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      date_verified: date_verified ?? this.date_verified,
      total_video_view: total_video_view ?? this.total_video_view,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'full_name': full_name,
      'gender': gender,
      'phone_number': phone_number,
      'address': address,
      'introduction': introduction,
      'user_type': user_type,
      'avatar': avatar,
      'email': email,
      'date_verified': date_verified,
      'total_video_view': total_video_view,
    };
  }

  factory CoachDetail.fromJson(Map<String, dynamic> map) {
    return CoachDetail(
      id: map['id'] != null ? map['id'] as String : null,
      full_name: map['full_name'] != null ? map['full_name'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      phone_number:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      introduction:
          map['introduction'] != null ? map['introduction'] as String : null,
      user_type: map['user_type'] != null ? map['user_type'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      date_verified:
          map['date_verified'] != null ? map['date_verified'] as String : null,
      total_video_view: map['total_video_view'] != null
          ? map['total_video_view'] as int
          : null,
    );
  }

  @override
  String toString() {
    return 'CoachDetail(id: $id, full_name: $full_name, gender: $gender, phone_number: $phone_number, address: $address, introduction: $introduction, user_type: $user_type, avatar: $avatar, email: $email, date_verified: $date_verified, total_video_view: $total_video_view)';
  }

  @override
  bool operator ==(covariant CoachDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.full_name == full_name &&
        other.gender == gender &&
        other.phone_number == phone_number &&
        other.address == address &&
        other.introduction == introduction &&
        other.user_type == user_type &&
        other.avatar == avatar &&
        other.email == email &&
        other.date_verified == date_verified &&
        other.total_video_view == total_video_view;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        full_name.hashCode ^
        gender.hashCode ^
        phone_number.hashCode ^
        address.hashCode ^
        introduction.hashCode ^
        user_type.hashCode ^
        avatar.hashCode ^
        email.hashCode ^
        date_verified.hashCode ^
        total_video_view.hashCode;
  }
}
