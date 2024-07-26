import 'dart:convert';

import '../../../../../core/enums/core/api_request_type.dart';
import '../../../../../core/sources/apis/api_call.dart';
import '../../../../../core/sources/apis/data_state.dart';
import '../../../../../core/utilities/app_strings.dart';

class GetAccessCodeApi {
  Future<String?> getCode({String? oldCode}) async {
    if (oldCode != null && oldCode.isNotEmpty) return oldCode;
    final String url = '${AppStrings().baseURL}/post/getCode';
    // Request
    final DataState<bool> result = await ApiCall<bool>().call(
      url: url,
      isAuth: false,
      isConnectType: false,
      requestType: ApiRequestType.get,
    );

    if (result is DataSuccess) {
      final String data = result.data ?? '';
      if (data.isEmpty) return null;
      final dynamic dataMap = json.decode(data);
      return dataMap['code'];
    } else {
      return null;
    }
  }
}
