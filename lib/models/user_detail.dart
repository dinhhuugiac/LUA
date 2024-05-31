// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserDetail {
  String? id;
  String? phone_number;
  String? email;
  String? avatar;
  String? full_name;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? userType;
  List<String>? fav_content;
  String? introduction;
  String? coverImage;
  String? dateVerified;
  bool? isRegister;
  UserDetail({
    this.id,
    this.phone_number,
    this.email,
    this.avatar,
    this.full_name,
    this.gender,
    this.address,
    this.dateOfBirth,
    this.userType,
    this.fav_content,
    this.introduction,
    this.coverImage,
    this.dateVerified,
    this.isRegister,
  });

  UserDetail copyWith({
    String? id,
    String? phone_number,
    String? email,
    String? avatar,
    String? full_name,
    String? gender,
    String? address,
    String? dateOfBirth,
    String? userType,
    List<String>? fav_content,
    String? introduction,
    String? coverImage,
    String? dateVerified,
    bool? isRegister,
  }) {
    return UserDetail(
      id: id ?? this.id,
      phone_number: phone_number ?? phone_number,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      full_name: full_name ?? full_name,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      userType: userType ?? this.userType,
      fav_content: fav_content ?? fav_content,
      introduction: introduction ?? this.introduction,
      coverImage: coverImage ?? this.coverImage,
      dateVerified: dateVerified ?? this.dateVerified,
      isRegister: isRegister ?? this.isRegister,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'phone_number': phone_number,
      'email': email,
      'avatar': avatar,
      'full_name': full_name,
      'gender': gender,
      'address': address,
      'dateOfBirth': dateOfBirth,
      'userType': userType,
      'fav_content': fav_content,
      'introduction': introduction,
      'coverImage': coverImage,
      'dateVerified': dateVerified,
      'isRegister': isRegister,
    };
  }

  factory UserDetail.fromJson(Map<String, dynamic> map) {
    return UserDetail(
      id: map['id'] != null ? map['id'] as String : null,
      phone_number:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      full_name: map['full_name'] != null ? map['full_name'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      dateOfBirth:
          map['date_of_birth'] != null ? map['date_of_birth'] as String : null,
      userType: map['user_type'] != null ? map['user_type'] as String : null,
      fav_content: map['fav_content'] != null
          ? List<String>.from((map['fav_content']))
          : null,
      introduction:
          map['introduction'] != null ? map['introduction'] as String : null,
      coverImage:
          map['cover_image'] != null ? map['cover_image'] as String : null,
      dateVerified:
          map['date_verified'] != null ? map['date_verified'] as String : null,
      isRegister:
          map['is_register'] != null ? map['is_register'] as bool : null,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, phoneNumber: $phone_number, email: $email, avatar: $avatar, fullName: $full_name, gender: $gender, address: $address, dateOfBirth: $dateOfBirth, userType: $userType, favContent: $fav_content, introduction: $introduction, coverImage: $coverImage, dateVerified: $dateVerified, isRegister: $isRegister)';
  }

  @override
  bool operator ==(covariant UserDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phone_number == phone_number &&
        other.email == email &&
        other.avatar == avatar &&
        other.full_name == full_name &&
        other.gender == gender &&
        other.address == address &&
        other.dateOfBirth == dateOfBirth &&
        other.userType == userType &&
        listEquals(other.fav_content, fav_content) &&
        other.introduction == introduction &&
        other.coverImage == coverImage &&
        other.dateVerified == dateVerified &&
        other.isRegister == isRegister;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        phone_number.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        full_name.hashCode ^
        gender.hashCode ^
        address.hashCode ^
        dateOfBirth.hashCode ^
        userType.hashCode ^
        fav_content.hashCode ^
        introduction.hashCode ^
        coverImage.hashCode ^
        dateVerified.hashCode ^
        isRegister.hashCode;
  }
}
