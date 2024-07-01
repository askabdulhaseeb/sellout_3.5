// ignore: depend_on_referenced_packages
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../enums/core/api_request_type.dart';
import '../local/auth/local_auth.dart';
import 'data_state.dart';

class ApiCall<T> {
  Future<DataState<T>> call({
    required String url,
    required ApiRequestType requestType,
    String? body,
    Map<String, String>? extraHeader,
    bool isConnectType = true,
    bool isAuth = true,
  }) async {
    try {
      /// Request
      final http.Request request =
          http.Request(requestType.json, Uri.parse(url));

      /// Request Header
      // [Content-Type]
      final Map<String, String> headers = extraHeader ?? <String, String>{};
      if (isConnectType) {
        headers.addAll(<String, String>{'Content-Type': 'application/json'});
      }
      // [Authorization]
      if (isAuth) {
        final String? token = LocalAuth.token;
        if (token == null) {
          return DataFailer<T>(CustomException('Unauthorized Access'));
        }
        final String tokenStr =
            token.startsWith('Bearer') ? token : 'Bearer $token';
        headers.addAll(<String, String>{'Authorization': tokenStr});
      }
      request.headers.addAll(headers);
      // debugPrint('👉🏻 API Call: header - $headers');

      /// Request Body
      if (body != null && body.isNotEmpty) {
        request.body = body;
      }
      // debugPrint('👉🏻 API Call: body - $body');

      /// Send Request
      http.StreamedResponse response = await request.send();

      debugPrint('👉🏻 API Call: url - $url');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final String data = await response.stream.bytesToString();
        // debugPrint('✅ Request Success');
        if (data.isEmpty) {
          log('❌ ERROR: ERROR: No Data Found - API: $url');
          return DataFailer<T>(CustomException('ERROR: No Data Found'));
        } else {
          return DataSuccess<T>(data, null);
        }
      } else {
        // Unauthorized
        // Failer
        return DataFailer<T>(CustomException('ERROR: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailer<T>(CustomException(e.toString()));
    }
  }
}
