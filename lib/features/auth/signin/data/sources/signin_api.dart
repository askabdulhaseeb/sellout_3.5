import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../core/enums/core/api_request_type.dart';
import '../../../../../core/sources/apis/api_call.dart';
import '../../../../../core/sources/apis/data_state.dart';
import '../../../../../core/sources/local/auth/local_auth.dart';
import '../../../../../core/utilities/app_strings.dart';

class SigninAPI {
  Future<DataState<bool>> signin({
    required String email,
    required String password,
  }) async {
    try {
      final String url = '${AppStrings().baseURL}/userAuth/login';
      // Request
      final DataState<bool> result = await ApiCall<bool>().call(
        url: url,
        isAuth: false,
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
        await LocalAuth().signin(currentUser);
        return result;
      } else if (result is DataFailer) {
        debugPrint(
            '❌ Error in SigninAPI.signin: else if (result is DataFailer) - ${result.exception?.message}');
        return result;
      }
      return result;
    } catch (e) {
      debugPrint('❌ Error in SigninAPI.signin: catch (e) - $e');
      return DataFailer<bool>(CustomException(e.toString()));
    }
  }
}
