import 'dart:convert';

import '../../domain/entities/current_user_entity.dart';
export '../../domain/entities/current_user_entity.dart';

class CurrentUserModel extends CurrentUserEntity {
  CurrentUserModel({
    required super.message,
    required super.email,
    required super.token,
    required super.userName,
    required super.userId,
    required super.fullName,
  });

  factory CurrentUserModel.fromRawJson(String str) =>
      CurrentUserModel.fromJson(json.decode(str));

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) =>
      CurrentUserModel(
        message: json['message'],
        email: json['email'],
        token: json['token'],
        userName: json['user_name'],
        userId: json['user_id'],
        fullName: json['full_name'],
      );
}
