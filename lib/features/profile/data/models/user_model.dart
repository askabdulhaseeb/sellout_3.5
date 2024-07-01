import 'dart:convert';

import '../../domain/entities/user_entity.dart';
export '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.mobileNo,
    required super.timestamp,
    required super.fullName,
    required super.email,
    required super.uid,
    required super.interest,
    required super.lastLoginTime,
    required super.date,
    required super.token,
    required super.profilePic,
    required super.userName,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        mobileNo: json['mobile_no'],
        timestamp: DateTime.tryParse(
                json['timestamp']?.toString() ?? DateTime.now().toString()) ??
            DateTime.now(),
        fullName: json['full_name'],
        email: json['email'],
        uid: json['uid'],
        interest: List<dynamic>.from(json['interest'].map((dynamic x) => x)),
        lastLoginTime: json['last_login_time'],
        date: DateTime.tryParse(
                json['date']?.toString() ?? DateTime.now().toString()) ??
            DateTime.now(),
        token: json['token'],
        profilePic: json['profile_pic'],
        userName: json['user_name'],
      );
}
