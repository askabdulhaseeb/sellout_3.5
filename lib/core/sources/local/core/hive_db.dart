import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../auth/local_auth.dart';
import '../local_user.dart';
import 'local_request_history.dart';

class HiveDB {
  static Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    await Hive.initFlutter();

    // Hive
    Hive.registerAdapter(CurrentUserEntityAdapter()); // 0
    Hive.registerAdapter(UserEntityAdapter()); // 1
    Hive.registerAdapter(ApiRequestEntityAdapter()); // 3

    // Hive box Open
    await refresh();
  }

  static Future<void> refresh() async {
    await LocalAuth().refresh();
    await LocalUser().refresh();
    await LocalRequestHistory().refresh();
  }

  Future<void> signout() async => await LocalAuth().signout();
}
