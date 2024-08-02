import 'package:flutter/foundation.dart';

import '../../../../core/enums/core/api_request_type.dart';
import '../../../../core/sources/apis/api_call.dart';
import '../../../../core/sources/apis/data_state.dart';
import '../../../../core/sources/local/core/local_request_history.dart';
import '../../../../core/sources/local/local_user.dart';
import '../../../../core/utilities/app_strings.dart';

class GetUserAPI {
  Future<DataState<UserEntity?>> user(String? uid) async {
    try {
      if (uid == null) {
        return DataFailer<UserEntity?>(CustomException('User ID is null'));
      }
      final String url = '${AppStrings().baseURL}/user/$uid';
      ApiRequestEntity? request = await LocalRequestHistory().request(url,
          duration: kDebugMode
              ? const Duration(seconds: 10)
              : const Duration(minutes: 30));
      if (request != null) {
        final DataState<UserEntity?> local = LocalUser().userState(uid);
        if (local is DataSuccess<UserEntity?> && local.entity != null) {
          return local;
        }
      }
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
        await LocalUser().save(entity);
        // await LocalRequestHistory().save(ApiRequestEntity(url: url));
        return DataSuccess<UserEntity>(data, entity);
      }
      return DataFailer<UserEntity?>(CustomException('User not found'));
    } catch (e) {
      debugPrint('❌ Error GetUserAPI.user: catch $e');
    }
    return DataFailer<UserEntity?>(CustomException('User not found'));
  }
}
