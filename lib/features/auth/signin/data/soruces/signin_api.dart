import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../core/enums/core/api_request_type.dart';
import '../../../../../core/sources/apis/api_call.dart';
import '../../../../../core/sources/apis/data_state.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../models/current_user_model.dart';

class SigninAPI {
  Future<DataState<bool>> signin(
      {required String email, required String password}) async {
    try {
      final String url = '${AppStrings().baseURL}/userAuth/login';
      // Request
      final DataState<bool> result = await ApiCall<bool>().call(
        url: url,
        requestType: ApiRequestType.post,
        body: json.encode(<String, String>{
          'email': email.trim(),
          'password': password.trim(),
        }),
      );
      //
      if (result is DataSuccess) {
        // Current User
        final CurrentUserEntity currentUser =
            CurrentUserModel.fromRawJson(result.data ?? '');
        debugPrint(
          '👉🏻 SigninAPI.signin: $currentUser'
          '\n👉🏻 SigninAPI.signin: ${currentUser.email}'
          '\n👉🏻 SigninAPI.signin: ${currentUser.token}'
          '\n👉🏻 SigninAPI.signin: ${currentUser.userName}'
          '\n👉🏻 SigninAPI.signin: ${currentUser.userId}'
          '\n👉🏻 SigninAPI.signin: ${currentUser.fullName}',
        );
        return result;
      } else if (result is DataFailer) {
        debugPrint('❌ Error in SigninAPI.signin: ${result.exception?.message}');
      }
      return result;
    } catch (e) {
      debugPrint('❌ Error in SigninAPI.signin: $e');
      return DataFailer<bool>(CustomException(e.toString()));
    }
  }
}
