import 'package:flutter/material.dart';

import '../../../../core/enums/core/api_request_type.dart';
import '../../../../core/sources/apis/api_call.dart';
import '../../../../core/sources/apis/data_state.dart';
import '../../../../core/utilities/app_strings.dart';
import '../models/user_model.dart';

class GetUserAPI {
  Future<DataState<UserEntity?>> user(String? uid) async {
    try {
      if (uid == null) {
        return DataFailer<UserEntity?>(CustomException('User ID is null'));
      }
      final String url = '${AppStrings().baseURL}/user/$uid';
      // Request
      final DataState<bool> result = await ApiCall<bool>().call(
        url: url,
        isAuth: true,
        isConnectType: false,
        requestType: ApiRequestType.get,
      );
      //
      if (result is DataSuccess<bool>) {
        final String data = result.data ?? '';
        final UserEntity entity = UserModel.fromRawJson(data);
        return DataSuccess<UserEntity>(data, entity);
      }
      return DataFailer<UserEntity?>(CustomException('User not found'));
    } catch (e) {
      debugPrint('❌ Error GetUserAPI.user: catch $e');
    }
    return DataFailer<UserEntity?>(CustomException('User not found'));
  }
}
