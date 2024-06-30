import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../features/auth/signin/domain/entities/current_user_entity.dart';
import '../auth/local_auth.dart';

class HiveDB {
  static Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    await Hive.initFlutter();

    // Hive
    Hive.registerAdapter(CurrentUserEntityAdapter()); // 0

    // Hive box Open
    await refresh();
  }

  static Future<void> refresh() async {
    await LocalAuth().refresh();
  }

  Future<void> signout() async => await LocalAuth().signout();
}
