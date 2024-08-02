import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../features/attachment_selection/selectable_attachment/domain/picked_attachment.dart';
import '../../enums/core/api_request_type.dart';
import '../local/auth/local_auth.dart';
import '../local/core/local_request_history.dart';
import 'data_state.dart';

class ApiCall<T> {
  Future<DataState<T>> call({
    required String url,
    required ApiRequestType requestType,
    String? body,
    Map<String, String>? fielsMap,
    List<PickedAttachment>? attachments,
    Map<String, String>? extraHeader,
    bool isConnectType = true,
    bool isAuth = true,
  }) async {
    try {
      /// Request
      final http.Request request =
          http.Request(requestType.json, Uri.parse(url));

      /// Request Fields
      if (fielsMap != null && fielsMap.isNotEmpty) {
        request.bodyFields = fielsMap;
      }

      if (attachments != null && attachments.isNotEmpty) {
        request.bodyFields.addEntries(attachments.map((PickedAttachment e) {
          return MapEntry<String, String>('files', e.file.path);
        }));
      }

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
        debugPrint('✅ Request Success');
        if (data.isEmpty) {
          log('❌ ERROR: ERROR: No Data Found - API: $url');
          return DataFailer<T>(CustomException('ERROR: No Data Found'));
        } else {
          ApiRequestEntity apiRequestEntity = ApiRequestEntity(
            url: url,
            encodedData: data,
          );
          await LocalRequestHistory().save(apiRequestEntity);
          return DataSuccess<T>(data, null);
        }
      } else {
        // Unauthorized
        // Failer
        final String data = await response.stream.bytesToString();
        final Map<String, dynamic> decoded = jsonDecode(data);

        log('❌ ERROR: ${response.statusCode} - API: message -> ${decoded['message']}');
        log('❌ ERROR: ${response.statusCode} - API: detail -> ${decoded['details']}');
        return DataFailer<T>(CustomException('ERROR: ${decoded['message']}'));
      }
    } catch (e) {
      return DataFailer<T>(CustomException(e.toString()));
    }
  }

  Future<DataState<T>> callFormData({
    required String url,
    required ApiRequestType requestType,
    Map<String, String>? fielsMap,
    List<PickedAttachment>? attachments,
    Map<String, String>? extraHeader,
    bool isConnectType = true,
    bool isAuth = true,
  }) async {
    try {
      /// Request
      http.MultipartRequest request =
          http.MultipartRequest(requestType.json, Uri.parse(url));

      if (fielsMap != null && fielsMap.isNotEmpty) {
        request.fields.addAll(fielsMap);
      }

      if (attachments != null && attachments.isNotEmpty) {
        for (PickedAttachment element in attachments) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'files',
              element.file.path,
            ),
          );
        }
      }

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

      /// Send Request
      http.StreamedResponse response = await request.send();

      debugPrint('👉🏻 API Call: url - $url');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final String data = await response.stream.bytesToString();
        debugPrint('✅ Request Success');
        if (data.isEmpty) {
          log('❌ ERROR: ERROR: No Data Found - API: $url');
          return DataFailer<T>(CustomException('ERROR: No Data Found'));
        } else {
          ApiRequestEntity apiRequestEntity = ApiRequestEntity(
            url: url,
            encodedData: data,
          );
          await LocalRequestHistory().save(apiRequestEntity);
          return DataSuccess<T>(data, null);
        }
      } else {
        // Unauthorized
        // Failer
        final String data = await response.stream.bytesToString();
        final Map<String, dynamic> decoded = jsonDecode(data);

        log('❌ ERROR: ${response.statusCode} - API: message -> ${decoded['message']}');
        log('❌ ERROR: ${response.statusCode} - API: detail -> ${decoded['details']}');
        return DataFailer<T>(CustomException('ERROR: ${decoded['message']}'));
      }
    } catch (e) {
      return DataFailer<T>(CustomException(e.toString()));
    }
  }
}
