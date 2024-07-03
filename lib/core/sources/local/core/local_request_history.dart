import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../utilities/app_strings.dart';
import 'entity/api_request_entity.dart';
export 'entity/api_request_entity.dart';

class LocalRequestHistory {
  static final String boxTitle = AppStrings.localRequestHistory;
  static Box<ApiRequestEntity> get _box => Hive.box<ApiRequestEntity>(boxTitle);

  static Future<Box<ApiRequestEntity>> get openBox async =>
      await Hive.openBox<ApiRequestEntity>(boxTitle);

  Future<Box<ApiRequestEntity>> refresh() async {
    final bool isOpen = Hive.isBoxOpen(boxTitle);
    if (isOpen) {
      return _box;
    } else {
      return await Hive.openBox<ApiRequestEntity>(boxTitle);
    }
  }

  Future<void> save(ApiRequestEntity request) async =>
      await _box.put(request.url, request);

  Future<ApiRequestEntity?> request(
    String value, {
    Duration duration = const Duration(hours: 1),
  }) async {
    ApiRequestEntity? result = _box.get(value);
    if (result == null) return null;
    if (!result.timesAgo(duration)) {
      debugPrint('🔵 Less then $duration - $value');
      return result;
    } else {
      debugPrint('🔵 More then $duration - $value');
      await delete(value);
      return null;
    }
  }

  Future<void> delete(String value) async => await _box.delete(value);
}
